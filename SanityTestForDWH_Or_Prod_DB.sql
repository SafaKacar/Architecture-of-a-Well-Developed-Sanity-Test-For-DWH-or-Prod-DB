DECLARE @StartDate AS DATE = CAST(GETDATE()-1 AS DATE)
	   ,@EndDate   AS DATE = CAST(GETDATE() AS DATE);
WITH SanitySingularNullityChecks_DIM_CustomsCards AS
(
	SELECT
			  'DWH_Customs'		[DataBase]
			 ,'DIM_CustomsCards' TestTable
/*✓*/	     ,COUNT(CASE WHEN  Id							   IS NULL THEN 1 ELSE NULL END) [Id]
/*✓*/		 ,COUNT(CASE WHEN  [Status]						   IS NULL THEN 1 ELSE NULL END) [Status]
/*✓*/		 ,COUNT(CASE WHEN  CreateDate					   IS NULL THEN 1 ELSE NULL END) [CreateDate]
/*✓*/		 ,COUNT(CASE WHEN  CreateDate_DateKey			   IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
/*✓*/		 ,COUNT(CASE WHEN  NoFee						   IS NULL THEN 1 ELSE NULL END) [NoFee]
/*✓*/		 ,COUNT(CASE WHEN  [Type]						   IS NULL THEN 1 ELSE NULL END) [Type]
/*✓*/		 ,COUNT(CASE WHEN  LogoType						   IS NULL THEN 1 ELSE NULL END) [LogoType]
/*✓*/		 ,COUNT(CASE WHEN  ApplicationType				   IS NULL THEN 1 ELSE NULL END) [ApplicationType]
/*✓*/		 ,COUNT(CASE WHEN  LimitType					   IS NULL THEN 1 ELSE NULL END) [LimitType]
/*✓*/		 ,COUNT(CASE WHEN  IsNoName						   IS NULL THEN 1 ELSE NULL END) [IsNoName]
/*✓*/		 ,COUNT(CASE WHEN  IsContactlessTransactionEnabled IS NULL THEN 1 ELSE NULL END) [IsContactlessTransactionEnabled]
/*✓*/		 ,COUNT(CASE WHEN  MicroServiceType					   IS NULL THEN 1 ELSE NULL END) [MicroServiceType]
/*✓*/		 ,COUNT(CASE WHEN  PrimeCardProgramEnabled		   IS NULL THEN 1 ELSE NULL END) [PrimeCardProgramEnabled]

	FROM DWH_Customs..DIM_CustomsCards pc with (nolock)
),SanitySingularNullityChecks_DIM_BankPosMapping AS
(
  SELECT
  		   'DWH_Customs'		[DataBase]
		  ,'DIM_BankPosMapping' TestTable
/*✓*/	  ,COUNT(CASE WHEN Id			 IS NULL THEN 1 ELSE NULL END) [Id]
/*✓*/	  ,COUNT(CASE WHEN [IbanCode]	 IS NULL THEN 1 ELSE NULL END) [IbanCode]
/*✓*/	  ,COUNT(CASE WHEN [MicroServiceCode] IS NULL THEN 1 ELSE NULL END) [MicroServiceCode]
/*✓*/	  ,COUNT(CASE WHEN [BreakDown]   IS NULL THEN 1 ELSE NULL END) [BreakDown]
/*✓*/	  ,COUNT(CASE WHEN [Bank]		 IS NULL THEN 1 ELSE NULL END) [Bank]
  FROM DWH_Customs..DIM_BankPosMapping with (nolock)
  ),SanitySingularNullityChecks_DIM_Banks AS
  (
  SELECT
		  'DWH_Customs'		[DataBase]
    	 ,'DIM_Banks' TestTable
		 ,COUNT(CASE WHEN id						   IS NULL THEN 1 ELSE NULL END) [Id]
		 ,COUNT(CASE WHEN [OfficialName]			   IS NULL THEN 1 ELSE NULL END) [OfficialName] 
		 ,COUNT(CASE WHEN [ShortName]				   IS NULL THEN 1 ELSE NULL END) [ShortName]
		 ,COUNT(CASE WHEN [IbanCode]				   IS NULL THEN 1 ELSE NULL END) [IbanCode]
		 ,COUNT(CASE WHEN [WebServiceEnabled]		   IS NULL THEN 1 ELSE NULL END) [WebServiceEnabled]
		 ,COUNT(CASE WHEN [WebServiceExternalMoneyTransferStartingTime]  IS NULL THEN 1 ELSE NULL END) [WebServiceExternalMoneyTransferStartingTime]
		 ,COUNT(CASE WHEN [WebServiceExternalMoneyTransferEndTime]	   IS NULL THEN 1 ELSE NULL END) [WebServiceExternalMoneyTransferEndTime]
		 ,COUNT(CASE WHEN [AllowsExternalMoneyTransfer]				   IS NULL THEN 1 ELSE NULL END) [AllowsExternalMoneyTransfer]
		 ,COUNT(CASE WHEN [TransferCommission]		   IS NULL THEN 1 ELSE NULL END) [TransferCommission]
		 ,COUNT(CASE WHEN [OverTimeTransferCommission] IS NULL THEN 1 ELSE NULL END) [OverTimeTransferCommission]
		 ,COUNT(CASE WHEN [ExternalMoneyTransferCommission]			   IS NULL THEN 1 ELSE NULL END) [ExternalMoneyTransferCommission]
		 ,COUNT(CASE WHEN [CreateDate]				   IS NULL THEN 1 ELSE NULL END) [CreateDate]
		 ,COUNT(CASE WHEN [CreateDate_DateKey]		   IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
		 ,COUNT(CASE WHEN [AlwaysManuallyTransferred]  IS NULL THEN 1 ELSE NULL END) [AlwaysManuallyTransferred]
		 ,COUNT(CASE WHEN [AutoDepositEnabled]		   IS NULL THEN 1 ELSE NULL END) [AutoDepositEnabled]
		 ,COUNT(CASE WHEN [AllowCustomerWithdrawals]   IS NULL THEN 1 ELSE NULL END) [AllowCustomerWithdrawals]
		 ,COUNT(CASE WHEN [AlwaysTransferredByExternalMoneyTransfer]	   IS NULL THEN 1 ELSE NULL END) [AlwaysTransferredByExternalMoneyTransfer]
  FROM DWH_Customs..DIM_Banks with (nolock)
  ),SanitySingularNullityChecks_DIM_BannedTransferIbans  AS
  (
  SELECT
  		  'DWH_Customs'		[DataBase]
    	 ,'DIM_BannedTransferIbans' TestTable
		 ,COUNT(CASE WHEN id				   IS NULL THEN 1 ELSE NULL END) [Id]
		 ,COUNT(CASE WHEN [CreateDate]		   IS NULL THEN 1 ELSE NULL END) [CreateDate]
		 ,COUNT(CASE WHEN [CreateDate_DateKey]  IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
		 ,COUNT(CASE WHEN [Type]			   IS NULL THEN 1 ELSE NULL END) [Type]
  FROM DWH_Customs..DIM_BannedTransferIbans with (nolock)
  ), SanitySingularNullityChecks_DIM_BICombinationType AS
  (
   SELECT
   		  'DWH_Customs'		[DataBase]
    	 ,'DIM_BICombinationType' TestTable
		 ,COUNT(CASE WHEN FeatureType				 IS NULL THEN 1 END) [FeatureType]
		 ,COUNT(CASE WHEN [Currency]			 IS NULL THEN 1 END) [Currency]				
		 ,COUNT(CASE WHEN [CustomsCardTxType]	 IS NULL THEN 1 END) [CustomsCardTxType]		
		 ,COUNT(CASE WHEN [MoneyTransferType]	 IS NULL THEN 1 END) [MoneyTransferType]		
		 ,COUNT(CASE WHEN [EntrySubType]		 IS NULL THEN 1 END) [EntrySubType]			
		 ,COUNT(CASE WHEN [is_Offline]			 IS NULL THEN 1 END) [is_Offline]				
		 ,COUNT(CASE WHEN [isDirectRevenue]		 IS NULL THEN 1 END) [isDirectRevenue]		
		 ,COUNT(CASE WHEN [CombinationType]		 IS NULL THEN 1 END) [CombinationType]		
		 ,COUNT(CASE WHEN [Name]				 IS NULL THEN 1 END) [Name]					
		 ,COUNT(CASE WHEN [NameENG]				 IS NULL THEN 1 END) [NameENG]				
		 ,COUNT(CASE WHEN [Description]			 IS NULL THEN 1 END) [Description]			
		 ,COUNT(CASE WHEN [CashFlowType]		 IS NULL THEN 1 END) [CashFlowType]			
		 ,COUNT(CASE WHEN [Domain]				 IS NULL THEN 1 END) [Domain]					
		 ,COUNT(CASE WHEN [CashFlowTypeName_ENG] IS NULL THEN 1 END) [CashFlowTypeName_ENG]	
		 ,COUNT(CASE WHEN [DomainName_ENG]		 IS NULL THEN 1 END) [DomainName_ENG]			
  FROM DWH_Customs..DIM_BICombinationType with (nolock)
  ), SanitySingularNullityChecks_DIM_CardInstitutionIdentifications AS
  (
  SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_CardInstitutionIdentifications' TestTable
	,COUNT(CASE WHEN Id						   IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [CardIssuerName]		   IS NULL THEN 1 ELSE NULL END) [CardIssuerName]
	,COUNT(CASE WHEN [CreditCardFraudMaxLimit] IS NULL THEN 1 ELSE NULL END) [CreditCardFraudMaxLimit]
	,COUNT(CASE WHEN [DebitCardFraudMaxLimit]  IS NULL THEN 1 ELSE NULL END) [DebitCardFraudMaxLimit]
	,COUNT(CASE WHEN [CreateDate]			   IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [FraudPendingTime]		   IS NULL THEN 1 ELSE NULL END) [FraudPendingTime]
	,COUNT(CASE WHEN [IsDomestic]			   IS NULL THEN 1 ELSE NULL END) [IsDomestic]
  FROM DWH_Customs..DIM_CardInstitutionIdentifications with (nolock)
  ), SanitySingularNullityChecks_DIM_CashbackConditions AS
  (
  SELECT
  	 'DWH_Customs'		[DataBase]
    ,'DIM_CashbackConditions' TestTable
	,COUNT(CASE WHEN Id							  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [CashbackRatio]			  IS NULL THEN 1 ELSE NULL END) [CashbackRatio]
	,COUNT(CASE WHEN [ApplicableToFeatureType]	  IS NULL THEN 1 ELSE NULL END)	[ApplicableToFeatureType]
	,COUNT(CASE WHEN [ApplicableToCurrency]		  IS NULL THEN 1 ELSE NULL END)	[ApplicableToCurrency]
	,COUNT(CASE WHEN [HasMonthlyCap]			  IS NULL THEN 1 ELSE NULL END)	[HasMonthlyCap]
	,COUNT(CASE WHEN [MonthlyCap]				  IS NULL THEN 1 ELSE NULL END)	[MonthlyCap]
	,COUNT(CASE WHEN [HasAmountPerTransactionCap] IS NULL THEN 1 ELSE NULL END)	[HasAmountPerTransactionCap]
	,COUNT(CASE WHEN [AmountPerTransactionCap]	  IS NULL THEN 1 ELSE NULL END)	[AmountPerTransactionCap]
	,COUNT(CASE WHEN [OnlyAppliedToAssignedUsers] IS NULL THEN 1 ELSE NULL END)	[OnlyAppliedToAssignedUsers]
	,COUNT(CASE WHEN [RewardLedgerIconUrl]		  IS NULL THEN 1 ELSE NULL END)	[RewardLedgerIconUrl]
	,COUNT(CASE WHEN [DescriptionTitle]			  IS NULL THEN 1 ELSE NULL END)	[DescriptionTitle]
	,COUNT(CASE WHEN [CreateDate]				  IS NULL THEN 1 ELSE NULL END)	[CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey]		  IS NULL THEN 1 ELSE NULL END)	[CreateDate_DateKey]
	,COUNT(CASE WHEN [DiscriminatorId]			  IS NULL THEN 1 ELSE NULL END)	[DiscriminatorId]
	,COUNT(CASE WHEN [StartDate]				  IS NULL THEN 1 ELSE NULL END)	[StartDate]
	,COUNT(CASE WHEN [EndDate]					  IS NULL THEN 1 ELSE NULL END)	[EndDate]
	,COUNT(CASE WHEN [AllowedCashbackCount]		  IS NULL THEN 1 ELSE NULL END)	[AllowedCashbackCount]
	,COUNT(CASE WHEN [CashbackAmount]			  IS NULL THEN 1 ELSE NULL END)	[CashbackAmount]
	,COUNT(CASE WHEN [MinimumTransactionAmount]	  IS NULL THEN 1 ELSE NULL END)	[MinimumTransactionAmount]
	,COUNT(CASE WHEN [ApplicableToFeatureTypeCodes] IS NULL THEN 1 ELSE NULL END)	[ApplicableToFeatureTypeCodes]
  FROM DWH_Customs..DIM_CashbackConditions with (nolock)
  ), SanitySingularNullityChecks_DIM_Date AS
  (
  SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_Date' TestTable
	,COUNT(CASE WHEN DateKey			IS NULL THEN 1 ELSE NULL END) [DateKey]
	,COUNT(CASE WHEN [CreateDatee]		IS NULL THEN 1 ELSE NULL END) [CreateDatee]
	,COUNT(CASE WHEN [DayOfWeekEN]		IS NULL THEN 1 ELSE NULL END) [DayOfWeekEN]
	,COUNT(CASE WHEN [DayOfWeek]		IS NULL THEN 1 ELSE NULL END) [DayOfWeek]
	,COUNT(CASE WHEN [DayNumberInMonth]	IS NULL THEN 1 ELSE NULL END) [DayNumberInMonth]
	,COUNT(CASE WHEN [WeekNumberInYear]	IS NULL THEN 1 ELSE NULL END) [WeekNumberInYear]
	,COUNT(CASE WHEN [CalendarMonthEN]	IS NULL THEN 1 ELSE NULL END) [CalendarMonthEN]
	,COUNT(CASE WHEN [CalendarMonth]	IS NULL THEN 1 ELSE NULL END) [CalendarMonth]
	,COUNT(CASE WHEN [MonthNumber]		IS NULL THEN 1 ELSE NULL END) [MonthNumber]
	,COUNT(CASE WHEN [YearNumber]		IS NULL THEN 1 ELSE NULL END) [YearNumber]
	,COUNT(CASE WHEN [CalendarQuarter]	IS NULL THEN 1 ELSE NULL END) [CalendarQuarter]
	,COUNT(CASE WHEN [FiscalQuarter]	IS NULL THEN 1 ELSE NULL END) [FiscalQuarter]
	,COUNT(CASE WHEN [FiscalMonth]		IS NULL THEN 1 ELSE NULL END) [FiscalMonth]
	,COUNT(CASE WHEN [FiscalYear]		IS NULL THEN 1 ELSE NULL END) [FiscalYear]
	,COUNT(CASE WHEN [IsHoliday]		IS NULL THEN 1 ELSE NULL END) [IsHoliday]
	,COUNT(CASE WHEN [IsWeekDay]		IS NULL THEN 1 ELSE NULL END) [IsWeekDay]
	,COUNT(CASE WHEN [IsLastDayOfMonth]	IS NULL THEN 1 ELSE NULL END) [IsLastDayOfMonth]
	,COUNT(CASE WHEN [DayNumberInWeek]	IS NULL THEN 1 ELSE NULL END) [DayNumberInWeek]
	,COUNT(CASE WHEN [MonthKey]			IS NULL THEN 1 ELSE NULL END) [MonthKey]
  FROM DWH_Customs..DIM_Date with (nolock)
  ),  SanitySingularNullityChecks_DIM_RecognizedCardAcceptorBkmIds AS
  (
  SELECT
	 'DWH_Customs'		[DataBase]
	,'DIM_RecognizedCardAcceptorBkmIds' TestTable
	,COUNT(CASE WHEN Id						  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [RecognizedCardAcceptorId] IS NULL THEN 1 ELSE NULL END) [RecognizedCardAcceptorId]
	,COUNT(CASE WHEN [CreateDate]			  IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey]	  IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
  FROM DWH_Customs..DIM_RecognizedCardAcceptorBkmIds with (nolock)
  ),  SanitySingularNullityChecks_DIM_RecognizedCardSystemMerchantNames AS
  (
  SELECT
	 'DWH_Customs'		[DataBase]
	,'DIM_RecognizedCardSystemMerchantNames' TestTable
	,COUNT(CASE WHEN   Id					  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [RecognizedCardAcceptorId] IS NULL THEN 1 ELSE NULL END) [RecognizedCardAcceptorId]
	,COUNT(CASE WHEN [CardSystemMerchantName]		  IS NULL THEN 1 ELSE NULL END) [CardSystemMerchantName]
	,COUNT(CASE WHEN [CreateDate]			  IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey]	  IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
  FROM DWH_Customs..DIM_RecognizedCardSystemMerchantNames with (nolock)
  ), SanitySingularNullityChecks_DIM_RecognizedCardAcceptorCustomsCards AS
  (
  SELECT
	 'DWH_Customs'		[DataBase]
  	,'DIM_RecognizedCardAcceptorCustomsCards' TestTable
	,COUNT(CASE WHEN RecognizedCardAcceptor_Id IS NULL THEN 1 ELSE NULL END) [RecognizedCardAcceptor_Id]
	,COUNT(CASE WHEN CustomsCard_Id 			 IS NULL THEN 1 ELSE NULL END) [CustomsCard_Id]
  FROM DWH_Customs..DIM_RecognizedCardAcceptorCustomsCards with (nolock)
  ), SanitySingularNullityChecks_DIM_RecognizedCardAcceptors AS
  (
  SELECT
	 'DWH_Customs'		[DataBase]
  	,'DIM_RecognizedCardAcceptors' TestTable
	,COUNT(CASE WHEN Id						  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [BrandName]			  IS NULL THEN 1 ELSE NULL END) [BrandName] 
	,COUNT(CASE WHEN [CategoryId]			  IS NULL THEN 1 ELSE NULL END) [CategoryId]
	,COUNT(CASE WHEN [IconUrl]				  IS NULL THEN 1 ELSE NULL END) [IconUrl] 
	,COUNT(CASE WHEN [CreateDate]			  IS NULL THEN 1 ELSE NULL END) [CreateDate] 
	,COUNT(CASE WHEN [CreateDate_DateKey]	  IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
	,COUNT(CASE WHEN [IsCredentialOnFile]	  IS NULL THEN 1 ELSE NULL END) [IsCredentialOnFile]
	,COUNT(CASE WHEN [IsAvailableForGiftCard] IS NULL THEN 1 ELSE NULL END) [IsAvailableForGiftCard]
	,COUNT(CASE WHEN [IsPopular]			  IS NULL THEN 1 ELSE NULL END) [IsPopular]
   FROM DWH_Customs..DIM_RecognizedCardAcceptors with (nolock)
  ), SanitySingularNullityChecks_DIM_FamilyRelations AS
  (
SELECT
   'DWH_Customs'		[DataBase]
  ,'DIM_FamilyRelations' TestTable
  ,COUNT(CASE WHEN Id					IS NULL THEN 1 ELSE NULL END) [Id]
  ,COUNT(CASE WHEN [Child_Key]			IS NULL THEN 1 ELSE NULL END) [Child_Key]
  ,COUNT(CASE WHEN [RelationType]		IS NULL THEN 1 ELSE NULL END) [RelationType]
  ,COUNT(CASE WHEN [RelatedPhoneNumber] IS NULL THEN 1 ELSE NULL END) [RelatedPhoneNumber]
  ,COUNT(CASE WHEN [RelationStatus]		IS NULL THEN 1 ELSE NULL END) [RelationStatus]
  ,COUNT(CASE WHEN [IsActive]			IS NULL THEN 1 ELSE NULL END) [IsActive]
  ,COUNT(CASE WHEN [CreateDate]			IS NULL THEN 1 ELSE NULL END) [CreateDate]
  ,COUNT(CASE WHEN [CreateDate_DateKey]	IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
 FROM DWH_Customs..DIM_FamilyRelations (nolock)
  ), SanitySingularNullityChecks_DIM_IdentityGroupRoles AS
  (
  SELECT
	 'DWH_Customs'		[DataBase]
  	,'DIM_IdentityGroupRoles' TestTable
	,COUNT(CASE WHEN RoleGroupId IS NULL THEN 1 ELSE NULL END) [RoleGroupId]
	,COUNT(CASE WHEN Role_Key 	 IS NULL THEN 1 ELSE NULL END) [Role_Key]  
  FROM DWH_Customs..DIM_IdentityGroupRoles with (nolock)
  ), SanitySingularNullityChecks_DIM_InhouseRolesV2 AS
  (
  SELECT
	 'DWH_Customs'		[DataBase]
  	,'DIM_InhouseRolesV2' TestTable
	,COUNT(CASE WHEN [Id]				 IS NULL THEN 1 ELSE NULL END) [Id] 
	,COUNT(CASE WHEN [Name]				 IS NULL THEN 1 ELSE NULL END) [Name]
	,COUNT(CASE WHEN [Identity]			 IS NULL THEN 1 ELSE NULL END) [Identity]
	,COUNT(CASE WHEN [Description]		 IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [RoleType]			 IS NULL THEN 1 ELSE NULL END) [RoleType]
	,COUNT(CASE WHEN [CreateDate]		 IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
  FROM DWH_Customs..DIM_InhouseRolesV2 with (nolock)
  ), SanitySingularNullityChecks_DIM_IdentityUserRolesV2 AS
  (
  SELECT
	 'DWH_Customs'		[DataBase]
  	,'DIM_IdentityUserRolesV2' TestTable
	,COUNT(CASE WHEN Id			 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [User_Key]  IS NULL THEN 1 ELSE NULL END) [User_Key]
	,COUNT(CASE WHEN [IsAllowed] IS NULL THEN 1 ELSE NULL END) [IsAllowed]
	,COUNT(CASE WHEN [CreateDate] IS NULL THEN 1 ELSE NULL END) [CreateDate]
  FROM DWH_Customs..DIM_IdentityUserRolesV2 with (nolock)
  ), SanitySingularNullityChecks_DIM_InvestmentNotificationSubcriberEntities AS
  (
 SELECT
	'DWH_Customs'		[DataBase]
   ,'DIM_InvestmentNotificationSubcriberEntities' TestTable
   ,COUNT(CASE WHEN Id					IS NULL THEN 1 ELSE NULL END) [Id]
   ,COUNT(CASE WHEN [UserKey]			IS NULL THEN 1 ELSE NULL END) [UserKey]
   ,COUNT(CASE WHEN [CreateDate]			IS NULL THEN 1 ELSE NULL END) [CreateDate]
   ,COUNT(CASE WHEN [CreateDate_DateKey]	IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
 FROM DWH_Customs..DIM_InvestmentNotificationSubcriberEntities with (nolock)
  ), SanitySingularNullityChecks_DIM_InviteByFamilyRelations AS
  (
  SELECT
	 'DWH_Customs'		[DataBase]
  	,'DIM_InviteByFamilyRelations' TestTable
	,COUNT(CASE WHEN id					   IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [User_Key]			   IS NULL THEN 1 ELSE NULL END) [User_Key]
	,COUNT(CASE WHEN [ReceiverPhoneNumber] IS NULL THEN 1 ELSE NULL END) [ReceiverPhoneNumber]
	,COUNT(CASE WHEN [Status]			   IS NULL THEN 1 ELSE NULL END) [Status]
	,COUNT(CASE WHEN [ExternalId]		   IS NULL THEN 1 ELSE NULL END) [ExternalId]
	,COUNT(CASE WHEN [CreateDate]		   IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey]   IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]  
  FROM DWH_Customs..DIM_InviteByFamilyRelations with (nolock)
  ), SanitySingularNullityChecks_DIM_KartTeslimat AS
  (
  SELECT
	  'DWH_Customs'		[DataBase]
  	 ,'DIM_KartTeslimat' TestTable
	 ,COUNT(CASE WHEN CardID								 IS NULL THEN 1 ELSE NULL END) [CardID]
	 ,COUNT(CASE WHEN [CardType]							 IS NULL THEN 1 ELSE NULL END) [CardType]
	 ,COUNT(CASE WHEN [CardLogoType]						 IS NULL THEN 1 ELSE NULL END) [CardLogoType]
	 ,COUNT(CASE WHEN [CardStatus]							 IS NULL THEN 1 ELSE NULL END) [CardStatus]
	 ,COUNT(CASE WHEN [Kart Tipi]							 IS NULL THEN 1 ELSE NULL END) [Kart Tipi]
	 ,COUNT(CASE WHEN [Kart Tipi - Detay]					 IS NULL THEN 1 ELSE NULL END) [Kart Tipi - Detay]
	 ,COUNT(CASE WHEN [Kart Statüsü]						 IS NULL THEN 1 ELSE NULL END) [Kart Statüsü]
	 ,COUNT(CASE WHEN [Kart Başvuru Tarihi]					 IS NULL THEN 1 ELSE NULL END) [Kart Başvuru Tarihi]
	 ,COUNT(CASE WHEN [Kart Basım Tarihi]					 IS NULL THEN 1 ELSE NULL END) [Kart Basım Tarihi]
	 ,COUNT(CASE WHEN [Kartın Kuryeye/Kargoya Teslim Tarihi] IS NULL THEN 1 ELSE NULL END) [Kartın Kuryeye/Kargoya Teslim Tarihi]
	 ,COUNT(CASE WHEN [Kartın Kullanıcıya Teslim Tarihi]	 IS NULL THEN 1 ELSE NULL END) [Kartın Kullanıcıya Teslim Tarihi]
	 ,COUNT(CASE WHEN [Kart Aktivasyon Tarihi]				 IS NULL THEN 1 ELSE NULL END) [Kart Aktivasyon Tarihi]
	 ,COUNT(CASE WHEN [Adres Sorunlu Olma Durumu]			 IS NULL THEN 1 ELSE NULL END) [Adres Sorunlu Olma Durumu]
	 ,COUNT(CASE WHEN [Başvuru->Kurye (g)]					 IS NULL THEN 1 ELSE NULL END) [Başvuru->Kurye (g)]
	 ,COUNT(CASE WHEN [Kurye->Kullanıcı (g)]				 IS NULL THEN 1 ELSE NULL END) [Kurye->Kullanıcı (g)]
	 ,COUNT(CASE WHEN [Başvuru->Teslim (g)]					 IS NULL THEN 1 ELSE NULL END) [Başvuru->Teslim (g)]
	 ,COUNT(CASE WHEN [Teslim->Aktivasyon (g)]				 IS NULL THEN 1 ELSE NULL END) [Teslim->Aktivasyon (g)]
	 ,COUNT(CASE WHEN [Başvuru->Aktivasyon (g)]				 IS NULL THEN 1 ELSE NULL END) [Başvuru->Aktivasyon (g)]
  FROM DWH_Customs.dbo.DIM_KartTeslimat with (nolock)
  ), SanitySingularNullityChecks_DIM_KYCSozlesmeliKullanici AS
  (
   SELECT
	 'DWH_Customs'		[DataBase]
   	,'DIM_KYCSozlesmeliKullanici' TestTable
	,COUNT(CASE WHEN UserKey			 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [DeviceDescription] IS NULL THEN 1 ELSE NULL END) [DeviceDescription]
	,COUNT(CASE WHEN [CreateDate]		 IS NULL THEN 1 ELSE NULL END) [CreateDate]
  FROM DWH_CustomTables.DBO.DIM_KYCSozlesmeliKullanici with (nolock)
  ), SanitySingularNullityChecks_DIM_McCodes AS
  (
  SELECT
     'DWH_Customs'		[DataBase]
  	,'DIM_McCodes' TestTable
	,COUNT(CASE WHEN Id				 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [Code]			 IS NULL THEN 1 ELSE NULL END) [Code]
	,COUNT(CASE WHEN [CreateDate]	 IS NULL THEN 1 ELSE NULL END) [CreateDate]			
	,COUNT(CASE WHEN [CreateDate_Key] IS NULL THEN 1 ELSE NULL END) [CreateDate_Key]
  FROM DWH_Customs..DIM_McCodes with (nolock)
  ),  SanitySingularNullityChecks_DIM_Merchants_Control AS
  (
    SELECT
	 'DWH_Customs'		[DataBase]
	,'DIM_Merchants_Control' TestTable
	,COUNT(CASE WHEN Id		   IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN BrandName IS NULL THEN 1 ELSE NULL END) [BrandName]
  FROM DWH_Customs..DIM_Merchants_Control with (nolock)
  ),  SanitySingularNullityChecks_DIM_MerchantFee AS
  (
    SELECT
	  'DWH_Customs'		[DataBase]
	 ,'DIM_MerchantFees' TestTable
	 ,COUNT(CASE WHEN Id				  IS NULL THEN 1 ELSE NULL END) [Id]
	 ,COUNT(CASE WHEN [Merchant_Key]	  IS NULL THEN 1 ELSE NULL END) [Merchant_Key]		
	 ,COUNT(CASE WHEN [Currency]		  IS NULL THEN 1 ELSE NULL END) [Currency]			
	 ,COUNT(CASE WHEN [OperationType]	  IS NULL THEN 1 ELSE NULL END) [OperationType]	
	 ,COUNT(CASE WHEN [FeeType]			  IS NULL THEN 1 ELSE NULL END) [FeeType]			
	 ,COUNT(CASE WHEN [Value]			  IS NULL THEN 1 ELSE NULL END) [Value]				
	 ,COUNT(CASE WHEN [MaxFee]			  IS NULL THEN 1 ELSE NULL END) [MaxFee]				
	 ,COUNT(CASE WHEN [CreateDate]		  IS NULL THEN 1 ELSE NULL END) [CreateDate]			
	 ,COUNT(CASE WHEN [CreateDate_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]	
	 ,COUNT(CASE WHEN [VolumeLimit]		  IS NULL THEN 1 ELSE NULL END) [VolumeLimit]		
  FROM DWH_Customs..DIM_MerchantFees with (nolock)
  ),  SanitySingularNullityChecks_DIM_MerchantUsers AS
  (
    SELECT
	 'DWH_Customs'		[DataBase]
	,'DIM_MerchantUsers' TestTable
	,COUNT(CASE WHEN Id					 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [MerchantKey]		 IS NULL THEN 1 ELSE NULL END) [MerchantKey]
	,COUNT(CASE WHEN [UserKey]			 IS NULL THEN 1 ELSE NULL END) [UserKey]
	,COUNT(CASE WHEN [CreateDate]		 IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
	,COUNT(CASE WHEN [IsDeleted]		 IS NULL THEN 1 ELSE NULL END) [IsDeleted]
  FROM DWH_Customs..DIM_MerchantUsers with (nolock)
  ),  SanitySingularNullityChecks_DIM_Merchants AS
  (
    SELECT
	 'DWH_Customs'		[DataBase]
	,'DIM_Merchants' TestTable
	,COUNT(CASE WHEN Id									   IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [LegalName]						   IS NULL THEN 1 ELSE NULL END) [LegalName]							
	,COUNT(CASE WHEN [BrandName]						   IS NULL THEN 1 ELSE NULL END) [BrandName]							
	,COUNT(CASE WHEN [SecretKey]						   IS NULL THEN 1 ELSE NULL END) [SecretKey]							
	,COUNT(CASE WHEN [ApiKey]							   IS NULL THEN 1 ELSE NULL END) [ApiKey]								
	,COUNT(CASE WHEN [CreateDate]						   IS NULL THEN 1 ELSE NULL END) [CreateDate]							
	,COUNT(CASE WHEN [CreateDate_DateKey]				   IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]				
	,COUNT(CASE WHEN [MerchantCategory]					   IS NULL THEN 1 ELSE NULL END) [MerchantCategory]					
	,COUNT(CASE WHEN [EncryptedSecretKey]				   IS NULL THEN 1 ELSE NULL END) [EncryptedSecretKey]				
	,COUNT(CASE WHEN [EncryptedApiKey]					   IS NULL THEN 1 ELSE NULL END) [EncryptedApiKey]					
	,COUNT(CASE WHEN [EncryptedEncryptionPassword]		   IS NULL THEN 1 ELSE NULL END) [EncryptedEncryptionPassword]				
	,COUNT(CASE WHEN [IsLockedOut]						   IS NULL THEN 1 ELSE NULL END) [IsLockedOut]						
	,COUNT(CASE WHEN [MerchantNumber]					   IS NULL THEN 1 ELSE NULL END) [MerchantNumber]					
	,COUNT(CASE WHEN [CityCode]							   IS NULL THEN 1 ELSE NULL END) [CityCode]							
	,COUNT(CASE WHEN [DistrictCode]						   IS NULL THEN 1 ELSE NULL END) [DistrictCode]					
	,COUNT(CASE WHEN [IsPaymentNotificationEnabled]		   IS NULL THEN 1 ELSE NULL END) [IsPaymentNotificationEnabled]		
	,COUNT(CASE WHEN [IsHashEnabled]					   IS NULL THEN 1 ELSE NULL END) [IsHashEnabled]						
	,COUNT(CASE WHEN [IsCorporateCardTwoFactorAuthEnabled] IS NULL THEN 1 ELSE NULL END) [IsCorporateCardTwoFactorAuthEnabled]		
	,COUNT(CASE WHEN [EnabledReportTpye]				   IS NULL THEN 1 ELSE NULL END) [EnabledReportTpye]					
	,COUNT(CASE WHEN [IsBroker]							   IS NULL THEN 1 ELSE NULL END) [IsBroker]							
	,COUNT(CASE WHEN [IsPartner]						   IS NULL THEN 1 ELSE NULL END) [IsPartner]						
	,COUNT(CASE WHEN [MerchantType]						   IS NULL THEN 1 ELSE NULL END) [MerchantType]						
	,COUNT(CASE WHEN [IdempotencyEnabled]				   IS NULL THEN 1 ELSE NULL END) [IdempotencyEnabled]	
	,COUNT(CASE WHEN [Merchant_Key]						   IS NULL THEN 1 ELSE NULL END) [Merchant_Key]						
  FROM DWH_Customs..DIM_Merchants with (nolock)
  ),  SanitySingularNullityChecks_DIM_Resources AS
  (
    SELECT
	 'DWH_Customs'		[DataBase]
	,'DIM_Resources' TestTable
	,COUNT(CASE WHEN   Id				 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [CreateDate]		 IS NULL THEN 1 ELSE NULL END) [CreateDate]			
	,COUNT(CASE WHEN [CreateDate_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]	
	,COUNT(CASE WHEN [Key]				 IS NULL THEN 1 ELSE NULL END) [Key]				
	,COUNT(CASE WHEN [Language]			 IS NULL THEN 1 ELSE NULL END) [Language]			
	,COUNT(CASE WHEN [Type]				 IS NULL THEN 1 ELSE NULL END) [Type]				
	,COUNT(CASE WHEN [Target]			 IS NULL THEN 1 ELSE NULL END) [Target]				
   FROM DWH_Customs..DIM_Resources With (nolock)
  ), SanitySingularNullityChecks_DIM_SavedCards AS
  (
  SELECT
	 'DWH_Customs'		[DataBase]
	,'DIM_SavedCards' TestTable
	,COUNT(CASE WHEN [Id]				 IS NULL THEN 1 ELSE NULL END) [Id] 
	,COUNT(CASE WHEN [UserKey]			 IS NULL THEN 1 ELSE NULL END) [UserKey]
	,COUNT(CASE WHEN [UserId]			 IS NULL THEN 1 ELSE NULL END) [UserId]
	,COUNT(CASE WHEN [CreditCardHash]	 IS NULL THEN 1 ELSE NULL END) [CreditCardHash]
	,COUNT(CASE WHEN [Approved]			 IS NULL THEN 1 ELSE NULL END) [Approved]
	,COUNT(CASE WHEN [CreateDate]		 IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
	,COUNT(CASE WHEN [Refund]			 IS NULL THEN 1 ELSE NULL END) [Refund]
	,COUNT(CASE WHEN [NotRefund]		 IS NULL THEN 1 ELSE NULL END) [NotRefund]
 FROM DWH_Customs..DIM_SavedCards with (nolock)
  ), SanitySingularNullityChecks_DIM_SavingBalanceDefinitions AS
  (
    SELECT
	  'DWH_Customs'		[DataBase]
	 ,'DIM_SavingBalanceDefinitions' TestTable
	 ,COUNT(CASE WHEN Id				  IS NULL THEN 1 ELSE NULL END) [Id]
	 ,COUNT(CASE WHEN [DefinitionType]	  IS NULL THEN 1 ELSE NULL END) [DefinitionType]
	 ,COUNT(CASE WHEN [User_Key]		  IS NULL THEN 1 ELSE NULL END) [User_Key]
	 ,COUNT(CASE WHEN [SavingBalanceId]	  IS NULL THEN 1 ELSE NULL END) [SavingBalanceId]
	 ,COUNT(CASE WHEN [CreateDate]		  IS NULL THEN 1 ELSE NULL END) [CreateDate]
	 ,COUNT(CASE WHEN [CreateDate_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
  FROM DWH_Customs..DIM_SavingBalanceDefinitions with (nolock)
  ), SanitySingularNullityChecks_DIM_MobileDevices AS
  (
  SELECT
	 'DWH_Customs'		[DataBase]
  	,'DIM_MobileDevices' TestTable
	,COUNT(CASE WHEN Id					 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [DeviceBrand]		 IS NULL THEN 1 ELSE NULL END) [DeviceBrand]		
	,COUNT(CASE WHEN [DeviceModel]		 IS NULL THEN 1 ELSE NULL END) [DeviceModel]		
	,COUNT(CASE WHEN [IsNfcSupported]	 IS NULL THEN 1 ELSE NULL END) [IsNfcSupported]		
	,COUNT(CASE WHEN [CreateDate]		 IS NULL THEN 1 ELSE NULL END) [CreateDate]			
	,COUNT(CASE WHEN [CreateDate_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
  from DWH_Customs..DIM_MobileDevices with (nolock)
  ), SanitySingularNullityChecks_DIM_ParentStudentRelationships AS
  (
SELECT
	 'DWH_Customs'		[DataBase]
	,'DIM_ParentStudentRelationships' TestTable
	,COUNT(CASE WHEN Id							  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [Student_Key]				  IS NULL THEN 1 ELSE NULL END) [Student_Key]
	,COUNT(CASE WHEN [Parent_Key]				  IS NULL THEN 1 ELSE NULL END) [Parent_Key]
	,COUNT(CASE WHEN [IsActive]					  IS NULL THEN 1 ELSE NULL END) [IsActive]
	,COUNT(CASE WHEN [StudentAuthorizedParent]	  IS NULL THEN 1 ELSE NULL END) [StudentAuthorizedParent]
	,COUNT(CASE WHEN [ParentReceivesNotificaiton] IS NULL THEN 1 ELSE NULL END) [ParentReceivesNotificaiton]
	,COUNT(CASE WHEN [CreateDate]				  IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey]		  IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
  FROM DWH_Customs..DIM_ParentStudentRelationships with (Nolock)
  ), SanitySingularNullityChecks_DIM_UserOperationNotes  AS
  (
  SELECT
	 'DWH_Customs'		[DataBase]
  	,'DIM_UserOperationNotes' TestTable
	,COUNT(CASE WHEN id				 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN UserKey		 IS NULL THEN 1 ELSE NULL END) [UserKey]
	,COUNT(CASE WHEN OperatorUserKey IS NULL THEN 1 ELSE NULL END) [OperatorUserKey]
	,COUNT(CASE WHEN CreateDate		 IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN DateKey		 IS NULL THEN 1 ELSE NULL END) [DateKey]
  FROM DWH_Customs..DIM_UserOperationNotes with (nolock)
  ), SanitySingularNullityChecks_DIM_UserTransferIbans AS
  (
    SELECT
	   'DWH_Customs'		[DataBase]
	  ,'DIM_UserTransferIbans' TestTable
	  ,COUNT(CASE WHEN  Id				  IS NULL THEN 1 ELSE NULL END) [Id]
	  ,COUNT(CASE WHEN  UserKey			  IS NULL THEN 1 ELSE NULL END) [UserKey]
	  ,COUNT(CASE WHEN  BankId			  IS NULL THEN 1 ELSE NULL END) [BankId]
	  ,COUNT(CASE WHEN  Iban			  IS NULL THEN 1 ELSE NULL END) [Iban]
	  ,COUNT(CASE WHEN  Currency		  IS NULL THEN 1 ELSE NULL END) [Currency]
	  ,COUNT(CASE WHEN  IsActive		  IS NULL THEN 1 ELSE NULL END) [IsActive]
	  ,COUNT(CASE WHEN  CreateDate		  IS NULL THEN 1 ELSE NULL END) [CreateDate]
	  ,COUNT(CASE WHEN  CreateDate_DateKey IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey] 
	FROM DWH_Customs..DIM_UserTransferIbans with (nolock)
  ), SanitySingularNullityChecks_DIM_AtmTerminals AS
  (
	SELECT
	'DWH_Customs'		[DataBase]
    ,'DIM_AtmTerminals' TestTable
	,COUNT(CASE WHEN  Id			  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN  TerminalId	  IS NULL THEN 1 ELSE NULL END) [TerminalId]
	,COUNT(CASE WHEN  CityCode		  IS NULL THEN 1 ELSE NULL END) [CityCode]
	,COUNT(CASE WHEN  FeeDiscountType IS NULL THEN 1 ELSE NULL END) [FeeDiscountType]
	FROM DWH_Customs.dbo.DIM_AtmTerminals with (nolock)
  ), SanitySingularNullityChecks_DIM_BankDepositRefundExitType AS
  (
	SELECT
	'DWH_Customs'		[DataBase]
	,'DIM_BankDepositRefundExitType' TestTable
	,COUNT(CASE WHEN ExitType IS NULL THEN 1 ELSE NULL END) [ExitType]
	FROM DWH_Customs..DIM_BankDepositRefundExitType with (nolock)
  ), SanitySingularNullityChecks_DIM_BankAccounts AS
  (
  SELECT
     'DWH_Customs'		[DataBase]
	,'DIM_BankAccounts' TestTable
	,COUNT(CASE WHEN [Id]				 IS NULL THEN 1 ELSE NULL END) [Id]		
	,COUNT(CASE WHEN [Currency]			 IS NULL THEN 1 ELSE NULL END) [Currency]
	,COUNT(CASE WHEN [IsActive]			 IS NULL THEN 1 ELSE NULL END) [IsActive]
	,COUNT(CASE WHEN [CreateDate]		 IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
	,COUNT(CASE WHEN [DiscriminatorId]	 IS NULL THEN 1 ELSE NULL END) [DiscriminatorId]
	,COUNT(CASE WHEN [Bank_Id]			 IS NULL THEN 1 ELSE NULL END) [Bank_Id]
  FROM DWH_Customs..DIM_BankAccounts with (nolock)
  ), SanitySingularNullityChecks_DIM_BankAccountSettings AS
  (
SELECT
	 'Customs_banking'		  [DataBase]
	,'DIM_BankAccountSettings' TestTable
	,COUNT(CASE WHEN [Id]							  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [Name]							  IS NULL THEN 1 ELSE NULL END) [Name]
	,COUNT(CASE WHEN [IbanCode]						  IS NULL THEN 1 ELSE NULL END) [IbanCode]	
	,COUNT(CASE WHEN [TransactionEnabled]			  IS NULL THEN 1 ELSE NULL END) [TransactionEnabled]
	,COUNT(CASE WHEN [CreateDate]					  IS NULL THEN 1 ELSE NULL END) [CreateDate]	
	,COUNT(CASE WHEN [Balance]						  IS NULL THEN 1 ELSE NULL END) [Balance]
	,COUNT(CASE WHEN [Currency]						  IS NULL THEN 1 ELSE NULL END) [Currency]		
	,COUNT(CASE WHEN [AllowedForAtmDeposits]		  IS NULL THEN 1 ELSE NULL END) [AllowedForAtmDeposits]
	,COUNT(CASE WHEN [AllowedForBankTransferDeposits] IS NULL THEN 1 ELSE NULL END) [AllowedForBankTransferDeposits]
	,COUNT(CASE WHEN [AutoTransferEnabled]			  IS NULL THEN 1 ELSE NULL END) [AutoTransferEnabled]		
	,COUNT(CASE WHEN [AutoExternalMoneyTransferEnabled]				  IS NULL THEN 1 ELSE NULL END) [AutoExternalMoneyTransferEnabled]		
	,COUNT(CASE WHEN [TransferCommission]			  IS NULL THEN 1 ELSE NULL END) [TransferCommission]
	,COUNT(CASE WHEN [ExternalMoneyTransferCommission]				  IS NULL THEN 1 ELSE NULL END) [ExternalMoneyTransferCommission]
	,COUNT(CASE WHEN [AlwaysManuallyTransferred]	  IS NULL THEN 1 ELSE NULL END) [AlwaysManuallyTransferred]
	,COUNT(CASE WHEN [AllowCustomerWithdrawals]		  IS NULL THEN 1 ELSE NULL END) [AllowCustomerWithdrawals]
	,COUNT(CASE WHEN [AlwaysTransferredByExternalMoneyTransfer]		  IS NULL THEN 1 ELSE NULL END) [AlwaysTransferredByExternalMoneyTransfer]
	,COUNT(CASE WHEN [IsActive]						  IS NULL THEN 1 ELSE NULL END) [IsActive]
	,COUNT(CASE WHEN [ImageUrl]						  IS NULL THEN 1 ELSE NULL END) [ImageUrl]
	,COUNT(CASE WHEN [CdnImageUrl]					  IS NULL THEN 1 ELSE NULL END) [CdnImageUrl]
	,COUNT(CASE WHEN [AutoRefundEnabled]			  IS NULL THEN 1 ELSE NULL END) [AutoRefundEnabled]	
	,COUNT(CASE WHEN [FirstDepositMaxAmount]		  IS NULL THEN 1 ELSE NULL END) [FirstDepositMaxAmount]
	,COUNT(CASE WHEN [FirstDepositCheckIsEnabled]	  IS NULL THEN 1 ELSE NULL END) [FirstDepositCheckIsEnabled]
	,COUNT(CASE WHEN [NewUserDepositMaxAmount]		  IS NULL THEN 1 ELSE NULL END) [NewUserDepositMaxAmount]	
	,COUNT(CASE WHEN [NewUserDepositCheckEnabled]	  IS NULL THEN 1 ELSE NULL END) [NewUserDepositCheckEnabled]
	,COUNT(CASE WHEN [AllowedForFastDeposits]		  IS NULL THEN 1 ELSE NULL END) [AllowedForFastDeposits]
	,COUNT(CASE WHEN [AllowCustomerIbanMoneyTransfer] IS NULL THEN 1 ELSE NULL END) [AllowCustomerIbanMoneyTransfer]
	,COUNT(CASE WHEN [AutoFastEnabled]				  IS NULL THEN 1 ELSE NULL END) [AutoFastEnabled]
	,COUNT(CASE WHEN [AutoFastEnabledAllBank]		  IS NULL THEN 1 ELSE NULL END) [AutoFastEnabledAllBank]	
	,COUNT(CASE WHEN [FastCommission]				  IS NULL THEN 1 ELSE NULL END) [FastCommission]
	,COUNT(CASE WHEN [MaxFastAmount]				  IS NULL THEN 1 ELSE NULL END) [MaxFastAmount]
	,COUNT(CASE WHEN [AllowedTransferredByFast]		  IS NULL THEN 1 ELSE NULL END) [AllowedTransferredByFast]
	,COUNT(CASE WHEN [CreateDate_DateKey]			  IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
FROM Customs_banking..DIM_BankAccountSettings with (Nolock)
  ), SanitySingularNullityChecks_DIM_BankAccountSettingsLog AS
  (
SELECT
	 'DWH_Customs'		[DataBase]
	,'DIM_BankAccountSettings' TestTable
	,COUNT(CASE WHEN [RowId]							  IS NULL THEN 1 ELSE NULL END) [RowId]
	,COUNT(CASE WHEN [Id]								  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [Name]								  IS NULL THEN 1 ELSE NULL END) [Name]
	,COUNT(CASE WHEN [IbanCode]							  IS NULL THEN 1 ELSE NULL END) [IbanCode]	
	,COUNT(CASE WHEN [TransactionEnabled]				  IS NULL THEN 1 ELSE NULL END) [TransactionEnabled]
	,COUNT(CASE WHEN [CreateDate]						  IS NULL THEN 1 ELSE NULL END) [CreateDate]	
	,COUNT(CASE WHEN [Balance]							  IS NULL THEN 1 ELSE NULL END) [Balance]
	,COUNT(CASE WHEN [Currency]							  IS NULL THEN 1 ELSE NULL END) [Currency]		
	,COUNT(CASE WHEN [AllowedForAtmDeposits]			  IS NULL THEN 1 ELSE NULL END) [AllowedForAtmDeposits]
	,COUNT(CASE WHEN [AllowedForBankTransferDeposits]	  IS NULL THEN 1 ELSE NULL END) [AllowedForBankTransferDeposits]
	,COUNT(CASE WHEN [AutoTransferEnabled]				  IS NULL THEN 1 ELSE NULL END) [AutoTransferEnabled]		
	,COUNT(CASE WHEN [AutoExternalMoneyTransferEnabled]					  IS NULL THEN 1 ELSE NULL END) [AutoExternalMoneyTransferEnabled]		
	,COUNT(CASE WHEN [TransferCommission]				  IS NULL THEN 1 ELSE NULL END) [TransferCommission]
	,COUNT(CASE WHEN [ExternalMoneyTransferCommission]					  IS NULL THEN 1 ELSE NULL END) [ExternalMoneyTransferCommission]
	,COUNT(CASE WHEN [AlwaysManuallyTransferred]		  IS NULL THEN 1 ELSE NULL END) [AlwaysManuallyTransferred]
	,COUNT(CASE WHEN [AllowCustomerWithdrawals]			  IS NULL THEN 1 ELSE NULL END) [AllowCustomerWithdrawals]
	,COUNT(CASE WHEN [AlwaysTransferredByExternalMoneyTransfer]			  IS NULL THEN 1 ELSE NULL END) [AlwaysTransferredByExternalMoneyTransfer]
	,COUNT(CASE WHEN [IsActive]							  IS NULL THEN 1 ELSE NULL END) [IsActive]
	,COUNT(CASE WHEN [ImageUrl]							  IS NULL THEN 1 ELSE NULL END) [ImageUrl]
	,COUNT(CASE WHEN [CdnImageUrl]						  IS NULL THEN 1 ELSE NULL END) [CdnImageUrl]
	,COUNT(CASE WHEN [AutoRefundEnabled]				  IS NULL THEN 1 ELSE NULL END) [AutoRefundEnabled]
	,COUNT(CASE WHEN [FirstDepositMaxAmount]			  IS NULL THEN 1 ELSE NULL END) [FirstDepositMaxAmount]
	,COUNT(CASE WHEN [FirstDepositCheckIsEnabled]		  IS NULL THEN 1 ELSE NULL END) [FirstDepositCheckIsEnabled]
	,COUNT(CASE WHEN [NewUserDepositMaxAmount]			  IS NULL THEN 1 ELSE NULL END) [NewUserDepositMaxAmount]	
	,COUNT(CASE WHEN [NewUserDepositCheckEnabled]		  IS NULL THEN 1 ELSE NULL END) [NewUserDepositCheckEnabled]
	,COUNT(CASE WHEN [AllowedForFastDeposits]			  IS NULL THEN 1 ELSE NULL END) [AllowedForFastDeposits]
	,COUNT(CASE WHEN [AllowCustomerIbanMoneyTransfer]	  IS NULL THEN 1 ELSE NULL END) [AllowCustomerIbanMoneyTransfer]
	,COUNT(CASE WHEN [AutoFastEnabled]					  IS NULL THEN 1 ELSE NULL END) [AutoFastEnabled]
	,COUNT(CASE WHEN [AutoFastEnabledAllBank]			  IS NULL THEN 1 ELSE NULL END) [AutoFastEnabledAllBank]	
	,COUNT(CASE WHEN [FastCommission]					  IS NULL THEN 1 ELSE NULL END) [FastCommission]
	,COUNT(CASE WHEN [MaxFastAmount]					  IS NULL THEN 1 ELSE NULL END) [MaxFastAmount]
	,COUNT(CASE WHEN [AllowedTransferredByFast]			  IS NULL THEN 1 ELSE NULL END) [AllowedTransferredByFast]
	,COUNT(CASE WHEN [GetDate_LogDate]					  IS NULL THEN 1 ELSE NULL END) [GetDate_LogDate]
	,COUNT(CASE WHEN [CriticalBalance]					  IS NULL THEN 1 ELSE NULL END) [CriticalBalance]
	,COUNT(CASE WHEN [AllowCustomerIbanMoneyTransferFast] IS NULL THEN 1 ELSE NULL END) [AllowCustomerIbanMoneyTransferFast]
	,COUNT(CASE WHEN [MaxAllowedFastAmount]				  IS NULL THEN 1 ELSE NULL END) [MaxAllowedFastAmount]
	,COUNT(CASE WHEN [HasBankAccount]					  IS NULL THEN 1 ELSE NULL END) [HasBankAccount]
FROM DWH_Customs..DIM_BankAccountSettingsLog with (Nolock)
  )
  ,SanitySingularNullityChecks_DIM_UserCards_CardType AS
(
SELECT
	 'DWH_Customs'			 [DataBase]
    ,'DIM_UserCards_CardType' TestTable
	,COUNT(CASE WHEN [CardCategory]	  IS NULL THEN 1 ELSE NULL END) [CardCategory]
	,COUNT(CASE WHEN [CardCategoryId] IS NULL THEN 1 ELSE NULL END) [CardCategoryId]
	,COUNT(CASE WHEN [CardName]		  IS NULL THEN 1 ELSE NULL END) [CardName]
	,COUNT(CASE WHEN [CardType]		  IS NULL THEN 1 ELSE NULL END) [CardType]
	,COUNT(CASE WHEN [CardTypeName]	  IS NULL THEN 1 ELSE NULL END) [CardTypeName]
	,COUNT(CASE WHEN [Corporate]	  IS NULL THEN 1 ELSE NULL END) [Corporate]
	,COUNT(CASE WHEN [Edu]			  IS NULL THEN 1 ELSE NULL END) [Edu]
	,COUNT(CASE WHEN [FullCardName]	  IS NULL THEN 1 ELSE NULL END) [FullCardName]
	,COUNT(CASE WHEN [Id]			  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [LogoType]		  IS NULL THEN 1 ELSE NULL END) [LogoType]
	,COUNT(CASE WHEN [LogoTypeName]	  IS NULL THEN 1 ELSE NULL END) [LogoTypeName]
	,COUNT(CASE WHEN [NoName]		  IS NULL THEN 1 ELSE NULL END) [NoName]
	,COUNT(CASE WHEN [Ordered]		  IS NULL THEN 1 ELSE NULL END) [Ordered]
	,COUNT(CASE WHEN [Physical]		  IS NULL THEN 1 ELSE NULL END) [Physical]
	,COUNT(CASE WHEN [Sketch]		  IS NULL THEN 1 ELSE NULL END) [Sketch]
FROM DWH_CustomTables..DIM_UserCards_CardType with (nolock)
), SanitySingularNullityChecks_DIM_MappingCity AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_MappingCity'   TestTable
	,COUNT(CASE WHEN [City]			  IS NULL THEN 1 ELSE NULL END) [City]
	,COUNT(CASE WHEN [Id]			  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [MappingCityCode] IS NULL THEN 1 ELSE NULL END) [MappingCityCode]
	,COUNT(CASE WHEN [MappingName]	  IS NULL THEN 1 ELSE NULL END) [MappingName]
FROM DWH_Customs.DBO.DIM_MappingCity with (nolock)
), SanitySingularNullityChecks_DIM_UserEstimations AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_UserEstimations' TestTable
	,COUNT(CASE WHEN [UserKey] IS NULL THEN 1 ELSE NULL END) [UserKey]
FROM DWH_CustomTables.DBO.DIM_UserEstimations with (nolock)
), SanitySingularNullityChecks_DIM_CustomsCard_LogoType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_CustomsCard_LogoType' TestTable
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [LogoType]	   IS NULL THEN 1 ELSE NULL END) [LogoType]
FROM DWH_Customs.DBO.DIM_CustomsCard_LogoType with (nolock)
), SanitySingularNullityChecks_DIM_EntrySubType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_EntrySubType' TestTable
	,COUNT(CASE WHEN [Description]  IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [ENG_Name]		IS NULL THEN 1 ELSE NULL END) [ENG_Name]
	,COUNT(CASE WHEN [EntrySubType] IS NULL THEN 1 ELSE NULL END) [EntrySubType]
FROM DWH_Customs.DBO.DIM_EntrySubType with (nolock)
), SanitySingularNullityChecks_DIM_AuditActivityName AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_AuditActivityName' TestTable
	,COUNT(CASE WHEN [Description]   IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [ActivityName] IS NULL THEN 1 ELSE NULL END) [ActivityName]
FROM DWH_Customs.DBO.DIM_AuditActivityName with (nolock)
), SanitySingularNullityChecks_DIM_KycUserType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_KycUserType' TestTable
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [Type] 	   IS NULL THEN 1 ELSE NULL END) [Type]
FROM DWH_Customs.DBO.DIM_KycUserType with (nolock)
), SanitySingularNullityChecks_DIM_Courier AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_Courier' TestTable
	,COUNT(CASE WHEN [Cargo] IS NULL AND ID!=10 THEN 1 ELSE NULL END) [Cargo]
	,COUNT(CASE WHEN [Id]	 IS NULL			THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [Name]  IS NULL			THEN 1 ELSE NULL END) [Name]
FROM DWH_Customs.DBO.DIM_Courier with (nolock)
), SanitySingularNullityChecks_DIM_PosTxPointType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_PosTxPointType' TestTable
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [Id]		   IS NULL THEN 1 ELSE NULL END) [Id]
FROM DWH_Customs.DBO.DIM_PosTxPointType with (nolock)
), SanitySingularNullityChecks_DIM_LRFM_Score AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_LRFM_Score' TestTable
	,COUNT(CASE WHEN [FM_Description] IS NULL THEN 1 ELSE NULL END) [FM_Description]
	,COUNT(CASE WHEN [FM_Score]		  IS NULL THEN 1 ELSE NULL END) [FM_Score]
	,COUNT(CASE WHEN [Id]			  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [LR_Description] IS NULL THEN 1 ELSE NULL END) [LR_Description]
	,COUNT(CASE WHEN [LR_Score]		  IS NULL THEN 1 ELSE NULL END) [LR_Score]
	,COUNT(CASE WHEN [LRFM_Score]	  IS NULL THEN 1 ELSE NULL END) [LRFM_Score]
	,COUNT(CASE WHEN [TypesofUsers]	  IS NULL THEN 1 ELSE NULL END) [TypesofUsers]
FROM DWH_Customs.DBO.DIM_LRFM_Score with (nolock)
),SanitySingularNullityChecks_DIM_FM_Score AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_FM_Score' TestTable
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [FM_Score]	   IS NULL THEN 1 ELSE NULL END) [FM_Score]
FROM DWH_Customs..DIM_FM_Score with (nolock)
),SanitySingularNullityChecks_DIM_LR_Score AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_LR_Score' TestTable
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [LR_Score]    IS NULL THEN 1 ELSE NULL END) [LR_Score]
FROM DWH_Customs..DIM_LR_Score with (nolock)
), SanitySingularNullityChecks_DIM_UserTypeHistory AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_UserTypeHistory' TestTable
	,COUNT(CASE WHEN [CreateDate]   IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [UserKey]	   IS NULL THEN 1 ELSE NULL END) [UserKey]
	,COUNT(CASE WHEN [UserType]    IS NULL THEN 1 ELSE NULL END) [UserType]
FROM DWH_CustomTables.DBO.DIM_UserTypeHistory with (nolock)
), SanitySingularNullityChecks_DIM_CashbackPOSBreakdownType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_CashbackPOSBreakdownType' TestTable
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [Id]		   IS NULL THEN 1 ELSE NULL END) [Id]
FROM DWH_Customs..DIM_CashbackPOSBreakdownType with (nolock)
), SanitySingularNullityChecks_DIM_Users_Details AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_Users_Details' TestTable
	,COUNT(CASE WHEN [ChatbotStatus]				   IS NULL THEN 1 ELSE NULL END) [ChatbotStatus]
	,COUNT(CASE WHEN [CustomerId]					   IS NULL THEN 1 ELSE NULL END) [CustomerId]
	,COUNT(CASE WHEN [DeviceNotificationEnabled]	   IS NULL THEN 1 ELSE NULL END) [DeviceNotificationEnabled]
	,COUNT(CASE WHEN [Id]							   IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [IsComplianceLocked]			   IS NULL THEN 1 ELSE NULL END) [IsComplianceLocked]
	,COUNT(CASE WHEN [IsDepositConfirmationBank]	   IS NULL THEN 1 ELSE NULL END) [IsDepositConfirmationBank]
	,COUNT(CASE WHEN [IsLowBalanceNotificationEnabled] IS NULL THEN 1 ELSE NULL END) [IsLowBalanceNotificationEnabled]
	,COUNT(CASE WHEN [LiveChatEnabled]				   IS NULL THEN 1 ELSE NULL END) [LiveChatEnabled]
	,COUNT(CASE WHEN [LockoutEnabled]				   IS NULL THEN 1 ELSE NULL END) [LockoutEnabled]
	,COUNT(CASE WHEN [MobileNotificationsEnabled]	   IS NULL THEN 1 ELSE NULL END) [MobileNotificationsEnabled]
	,COUNT(CASE WHEN [RowVersion]					   IS NULL THEN 1 ELSE NULL END) [RowVersion]
	,COUNT(CASE WHEN [Tick]							   IS NULL THEN 1 ELSE NULL END) [Tick]
	,COUNT(CASE WHEN [TwoFactorEnabled]				   IS NULL THEN 1 ELSE NULL END) [TwoFactorEnabled]
	,COUNT(CASE WHEN [User_Key]						   IS NULL THEN 1 ELSE NULL END) [User_Key]
	,COUNT(CASE WHEN [UserMustChangePassword]		   IS NULL THEN 1 ELSE NULL END) [UserMustChangePassword]
	,COUNT(CASE WHEN [UserName]						   IS NULL THEN 1 ELSE NULL END) [UserName]			 -----*User_Key != 10993818*
	,COUNT(CASE WHEN [UserName_persisted]			   IS NULL THEN 1 ELSE NULL END) [UserName_persisted]-----*User_Key != 10993818*
FROM DWH_Customs..DIM_Users_Details with (nolock) WHERE User_Key != 10993818
), SanitySingularNullityChecks_DIM_UserAddresses AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_UserAddresses' TestTable
	,COUNT(CASE WHEN [Id]				 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [AddressType]		 IS NULL THEN 1 ELSE NULL END) [AddressType]
	,COUNT(CASE WHEN [City]				 IS NULL THEN 1 ELSE NULL END) [City]
	,COUNT(CASE WHEN [CityCode]			 IS NULL THEN 1 ELSE NULL END) [CityCode]
	,COUNT(CASE WHEN [CreateDate]		 IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
	,COUNT(CASE WHEN [District]			 IS NULL THEN 1 ELSE NULL END) [District]
	,COUNT(CASE WHEN [DistrictCode]		 IS NULL THEN 1 ELSE NULL END) [DistrictCode]
	,COUNT(CASE WHEN [FormattedAddress]  IS NULL THEN 1 ELSE NULL END) [FormattedAddress]
	,COUNT(CASE WHEN [NeighborhoodCode]  IS NULL THEN 1 ELSE NULL END) [NeighborhoodCode]
	,COUNT(CASE WHEN [User_Key]			 IS NULL THEN 1 ELSE NULL END) [User_Key]
FROM DWH_Customs..DIM_UserAddresses with (nolock)
), SanitySingularNullityChecks_DIM_Discriminator AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_Discriminator' TestTable
	,COUNT(CASE WHEN [Discriminator]   IS NULL THEN 1 ELSE NULL END) [Discriminator]
	,COUNT(CASE WHEN [DiscriminatorId] IS NULL THEN 1 ELSE NULL END) [DiscriminatorId]
FROM DWH_Customs..DIM_Discriminator with (nolock)
),SanitySingularNullityChecks_DIM_InhouseRoles_RoleType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_InhouseRoles_RoleType' TestTable
	,COUNT(CASE WHEN [NameTR]   IS NULL THEN 1 ELSE NULL END) [NameTR]
	,COUNT(CASE WHEN [Role_Key] IS NULL THEN 1 ELSE NULL END) [Role_Key]
	,COUNT(CASE WHEN [RoleType] IS NULL THEN 1 ELSE NULL END) [RoleType]
FROM DWH_Customs..DIM_InhouseRoles_RoleType with (nolock)
),SanitySingularNullityChecks_DIM_Streamers AS
(
SELECT
	 'DWH_Customs'	 [DataBase]
    ,'DIM_Streamers' TestTable
	,COUNT(CASE WHEN [CreateDate]		  IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [Id]				  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [IsDeleted]		  IS NULL THEN 1 ELSE NULL END) [IsDeleted]
	,COUNT(CASE WHEN [MinAmount]		  IS NULL THEN 1 ELSE NULL END) [MinAmount]
	,COUNT(CASE WHEN [Nickname]			  IS NULL THEN 1 ELSE NULL END) [Nickname]
	,COUNT(CASE WHEN [NotificationSource] IS NULL THEN 1 ELSE NULL END) [NotificationSource]
	,COUNT(CASE WHEN [Status]			  IS NULL THEN 1 ELSE NULL END) [Status]
	,COUNT(CASE WHEN [StreamUrl]		  IS NULL THEN 1 ELSE NULL END) [StreamUrl]
	,COUNT(CASE WHEN [UserKey]			  IS NULL THEN 1 ELSE NULL END) [UserKey]
FROM DWH_Customs..DIM_Streamers with (nolock)
),SanitySingularNullityChecks_DIM_TwitchStreamers AS
(
SELECT
	 'DWH_Customs'		   [DataBase]
    ,'DIM_TwitchStreamers' TestTable
	,COUNT(CASE WHEN [AccessToken]    IS NULL THEN 1 ELSE NULL END) [AccessToken]
	,COUNT(CASE WHEN [CreateDate]      IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [Id]		      IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [Nickname]       IS NULL THEN 1 ELSE NULL END) [Nickname]
	,COUNT(CASE WHEN [StreamerId]     IS NULL THEN 1 ELSE NULL END) [StreamerId]
	,COUNT(CASE WHEN [TokenExpiresIn] IS NULL THEN 1 ELSE NULL END) [TokenExpiresIn]
FROM DWH_Customs..DIM_TwitchStreamers with (nolock)
),SanitySingularNullityChecks_DIM_FeeType_Subgroup AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_FeeType_Subgroup' TestTable
	,COUNT(CASE WHEN [Fee_Key]		IS NULL THEN 1 ELSE NULL END) [Fee_Key]
	,COUNT(CASE WHEN [Subgroup]		IS NULL THEN 1 ELSE NULL END) [Subgroup]
	,COUNT(CASE WHEN [Subgroup_Key] IS NULL THEN 1 ELSE NULL END) [Subgroup_Key]
FROM DWH_Customs..DIM_FeeType_Subgroup with (nolock)
),SanitySingularNullityChecks_DIM_EduStatus AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_EduStatus' TestTable
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [EduStatus]   IS NULL THEN 1 ELSE NULL END) [EduStatus]
FROM DWH_Customs..DIM_EduStatus with (nolock)
),SanitySingularNullityChecks_DIM_FeeType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_FeeType' TestTable
	,COUNT(CASE WHEN [Fee_Key] IS NULL THEN 1 ELSE NULL END) [Fee_Key]
	,COUNT(CASE WHEN [FeeType] IS NULL THEN 1 ELSE NULL END) [FeeType]
FROM DWH_Customs..DIM_FeeType with (nolock)
),SanitySingularNullityChecks_DIM_IdentityRoleGroups AS
(
SELECT
	 'DWH_Customs'			 [DataBase]
    ,'DIM_IdentityRoleGroups' TestTable
	,COUNT(CASE WHEN [CreateDate]		 IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
	,COUNT(CASE WHEN [Id]				 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [IsDefault]		 IS NULL THEN 1 ELSE NULL END) [IsDefault]
	,COUNT(CASE WHEN [Name]				 IS NULL THEN 1 ELSE NULL END) [Name]
FROM DWH_Customs..DIM_IdentityRoleGroups with (nolock)
),SanitySingularNullityChecks_DIM_CustomsCardCancelReason AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_CustomsCardCancelReason' TestTable
	,COUNT(CASE WHEN [Description_ENG] IS NULL THEN 1 ELSE NULL END) [Description_ENG]
	,COUNT(CASE WHEN [Description_TR]  IS NULL THEN 1 ELSE NULL END) [Description_TR]
	,COUNT(CASE WHEN [Id]			   IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [Name_ENG]		   IS NULL THEN 1 ELSE NULL END) [Name_ENG]
	,COUNT(CASE WHEN [Name_TR]		   IS NULL THEN 1 ELSE NULL END) [Name_TR]
FROM DWH_Customs..DIM_CustomsCardCancelReason with (nolock)
),SanitySingularNullityChecks_DIM_JobTypes AS
(
SELECT
	 'DWH_Customs'	[DataBase]
    ,'DIM_JobTypes' TestTable
	,COUNT(CASE WHEN [AllowedSingleCardTransactionLimit] IS NULL THEN 1 ELSE NULL END) [AllowedSingleCardTransactionLimit]
	,COUNT(CASE WHEN [CreateDate]						 IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey]				 IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
	,COUNT(CASE WHEN [Id]								 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [IsCommercial]						 IS NULL THEN 1 ELSE NULL END) [IsCommercial]
	,COUNT(CASE WHEN [Name]								 IS NULL THEN 1 ELSE NULL END) [Name]
	,COUNT(CASE WHEN [Name_Eng]							 IS NULL THEN 1 ELSE NULL END) [Name_Eng]
	,COUNT(CASE WHEN [Name_Tr]							 IS NULL THEN 1 ELSE NULL END) [Name_Tr]
	,COUNT(CASE WHEN [Order]							 IS NULL THEN 1 ELSE NULL END) [Order]
	,COUNT(CASE WHEN [ShowOnAll]						 IS NULL THEN 1 ELSE NULL END) [ShowOnAll]
FROM DWH_Customs..DIM_JobTypes with (nolock)
),SanitySingularNullityChecks_DIM_CustomsCardRejectReason AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_CustomsCardRejectReason' TestTable
	,COUNT(CASE WHEN [Id]		IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [Name_ENG] IS NULL THEN 1 ELSE NULL END) [Name_ENG]
	,COUNT(CASE WHEN [Name_TR]	IS NULL THEN 1 ELSE NULL END) [Name_TR]
FROM DWH_Customs..DIM_CustomsCardRejectReason with (nolock)
), SanitySingularNullityChecks_DIM_PosCategories AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_PosCategories' TestTable
,COUNT(CASE WHEN [CreateDate]		 IS NULL THEN 1 ELSE NULL END) [CreateDate]
,COUNT(CASE WHEN [CreateDate_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
,COUNT(CASE WHEN [ENG_Name]			 IS NULL THEN 1 ELSE NULL END) [ENG_Name]
,COUNT(CASE WHEN [Id]				 IS NULL THEN 1 ELSE NULL END) [Id]
,COUNT(CASE WHEN [Name]				 IS NULL THEN 1 ELSE NULL END) [Name]
,COUNT(CASE WHEN [NameResourceKey]	 IS NULL THEN 1 ELSE NULL END) [NameResourceKey]
FROM DWH_Customs..DIM_PosCategories with (nolock)
), SanitySingularNullityChecks_DIM_Users_AgeCategories AS
(
SELECT
	 'DWH_Customs'			  [DataBase]
    ,'DIM_Users_AgeCategories' TestTable
	,COUNT(CASE WHEN [AgeCategoryId] IS NULL THEN 1 ELSE NULL END) [AgeCategoryId]
	,COUNT(CASE WHEN [Description]	 IS NULL THEN 1 ELSE NULL END) [Description]
FROM DWH_Customs..DIM_Users_AgeCategories with (nolock)
),SanitySingularNullityChecks_DIM_Currency AS
(
SELECT
	 'DWH_Customs'	[DataBase]
    ,'DIM_Currency' TestTable
	,COUNT(CASE WHEN [Currency]	   IS NULL THEN 1 ELSE NULL END) [Currency]
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [IsoCode]	   IS NULL THEN 1 ELSE NULL END) [IsoCode]
	,COUNT(CASE WHEN [Name_ENG]	   IS NULL THEN 1 ELSE NULL END) [Name_ENG]
FROM DWH_Customs..DIM_Currency with (nolock)
), SanitySingularNullityChecks_DIM_FCR AS
(
SELECT
	 'DWH_Customs' [DataBase]
    ,'DIM_FCR' TestTable
	,COUNT(CASE WHEN [BildirimNo]	  IS NULL THEN 1 ELSE NULL END) [BildirimNo]
	,COUNT(CASE WHEN [BildirimTarihi] IS NULL THEN 1 ELSE NULL END) [BildirimTarihi]
	,COUNT(CASE WHEN [Ismerged]		  IS NULL THEN 1 ELSE NULL END) [Ismerged]
	,COUNT(CASE WHEN [KontaktTipi]	  IS NULL THEN 1 ELSE NULL END) [KontaktTipi]
	,COUNT(CASE WHEN [User_Key]		  IS NULL THEN 1 ELSE NULL END) [User_Key]
FROM DWH_Customs..DIM_FCR with (nolock)
),SanitySingularNullityChecks_DIM_BankTransferRequestStatus AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_BankTransferRequestStatus' TestTable
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [Status]	   IS NULL THEN 1 ELSE NULL END) [Status]
FROM DWH_Customs..DIM_BankTransferRequestStatus with (nolock)
),SanitySingularNullityChecks_DIM_BankTransferType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_BankTransferType' TestTable
	,COUNT(CASE WHEN [BankTransferType] IS NULL THEN 1 ELSE NULL END) [BankTransferType]
	,COUNT(CASE WHEN [Description]		IS NULL THEN 1 ELSE NULL END) [Description]
FROM DWH_Customs..DIM_BankTransferType with (nolock)
),SanitySingularNullityChecks_DIM_CustomsCard_CardStatus AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_CustomsCard_CardStatus' TestTable
	,COUNT(CASE WHEN [CardStatus]  IS NULL THEN 1 ELSE NULL END) [CardStatus]
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
FROM DWH_Customs..DIM_CustomsCard_CardStatus with (nolock)
),SanitySingularNullityChecks_DIM_CustomsCard_CardType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_CustomsCard_CardType' TestTable
	,COUNT(CASE WHEN [CardType]	   IS NULL					  THEN 1 ELSE NULL END) [CardType]
	,COUNT(CASE WHEN [Description] IS NULL					  THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [Physical]	   IS NULL AND CardType != -1 THEN 1 ELSE NULL END) [Physical]
FROM DWH_Customs..DIM_CustomsCard_CardType with (nolock)
),SanitySingularNullityChecks_DIM_MerchantCategory AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_MerchantCategory' TestTable
,COUNT(CASE WHEN [MerchantCategory]		 IS NULL THEN 1 ELSE NULL END) [MerchantCategory]
,COUNT(CASE WHEN [MerchantCategory_Key]  IS NULL THEN 1 ELSE NULL END) [MerchantCategory_Key]
,COUNT(CASE WHEN [MerchantCategory_NAME] IS NULL THEN 1 ELSE NULL END) [MerchantCategory_NAME]
FROM DWH_Customs..DIM_MerchantCategory with (nolock)
),SanitySingularNullityChecks_DIM_MoneyTransferMethod AS
(
SELECT
	 'DWH_Customs'			  [DataBase]
    ,'DIM_MoneyTransferMethod' TestTable
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [Method]	   IS NULL THEN 1 ELSE NULL END) [Method]
FROM DWH_Customs..DIM_MoneyTransferMethod with (nolock)
),SanitySingularNullityChecks_DIM_MerchantType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_MerchantType' TestTable
	,COUNT(CASE WHEN [MerchantType]		 IS NULL THEN 1 ELSE NULL END) [MerchantType]
	,COUNT(CASE WHEN [MerchantType_Key]	 IS NULL THEN 1 ELSE NULL END) [MerchantType_Key]
	,COUNT(CASE WHEN [MerchantType_NAME] IS NULL THEN 1 ELSE NULL END) [MerchantType_NAME]
FROM DWH_Customs..DIM_MerchantType with (nolock)
),SanitySingularNullityChecks_DIM_MoneySource AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_MoneySource' TestTable
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [MoneySource] IS NULL THEN 1 ELSE NULL END) [MoneySource]
FROM DWH_Customs..DIM_MoneySource with (nolock)
), SanitySingularNullityChecks_DIM_PocketMoneyTransferStatus AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_PocketMoneyTransferStatus' TestTable
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [Status]	   IS NULL THEN 1 ELSE NULL END) [Status]
FROM DWH_Customs..DIM_PocketMoneyTransferStatus with (nolock)
), SanitySingularNullityChecks_DIM_PreKycInfos AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_PreKycInfos' TestTable
	,COUNT(CASE WHEN [ComplianceNoticeStatus] IS NULL THEN 1 ELSE NULL END) [ComplianceNoticeStatus]
	,COUNT(CASE WHEN [CreateDate]			  IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey]	  IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
	,COUNT(CASE WHEN [FailCount]			  IS NULL THEN 1 ELSE NULL END) [FailCount]
	,COUNT(CASE WHEN [IsCleaned]			  IS NULL THEN 1 ELSE NULL END) [IsCleaned]
	,COUNT(CASE WHEN [IsDissimilar]			  IS NULL THEN 1 ELSE NULL END) [IsDissimilar]
	,COUNT(CASE WHEN [IsIdentityWithoutPhoto] IS NULL THEN 1 ELSE NULL END) [IsIdentityWithoutPhoto]
	,COUNT(CASE WHEN [IsNfcSupported]		  IS NULL THEN 1 ELSE NULL END) [IsNfcSupported]
	,COUNT(CASE WHEN [IsVerified]			  IS NULL THEN 1 ELSE NULL END) [IsVerified]
	,COUNT(CASE WHEN [KycStatus]			  IS NULL THEN 1 ELSE NULL END) [KycStatus]
	,COUNT(CASE WHEN [RowVersion]			  IS NULL THEN 1 ELSE NULL END) [RowVersion]
	,COUNT(CASE WHEN [Tick]					  IS NULL THEN 1 ELSE NULL END) [Tick]
	,COUNT(CASE WHEN [TurkishNationalId]	  IS NULL THEN 1 ELSE NULL END) [TurkishNationalId]
	,COUNT(CASE WHEN [UpdatedAt]			  IS NULL THEN 1 ELSE NULL END) [UpdatedAt]
	,COUNT(CASE WHEN [UserApprovalType]		  IS NULL THEN 1 ELSE NULL END) [UserApprovalType]
	,COUNT(CASE WHEN [UserCanBeVerified]	  IS NULL THEN 1 ELSE NULL END) [UserCanBeVerified]
	,COUNT(CASE WHEN [UserKey]				  IS NULL THEN 1 ELSE NULL END) [UserKey]
	,COUNT(CASE WHEN [UserType]				  IS NULL THEN 1 ELSE NULL END) [UserType]
FROM DWH_Customs..DIM_PreKycInfos with (nolock)
), SanitySingularNullityChecks_DIM_CustomsCardOrder_Status AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_CustomsCardOrder_Status' TestTable
	,COUNT(CASE WHEN [CardStatus]  IS NULL THEN 1 ELSE NULL END) [CardStatus]
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
FROM DWH_Customs..DIM_CustomsCardOrder_Status with (nolock)
),SanitySingularNullityChecks_DIM_PocketMoneyTransferPeriod AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_PocketMoneyTransferPeriod' TestTable
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [Period]	   IS NULL THEN 1 ELSE NULL END) [Period]
FROM DWH_Customs..DIM_PocketMoneyTransferPeriod with (nolock)
),SanitySingularNullityChecks_DIM_PocketMoneyTransferType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_PocketMoneyTransferType' TestTable
	,COUNT(CASE WHEN [Description]			   IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [PocketMoneyTransferType] IS NULL THEN 1 ELSE NULL END) [PocketMoneyTransferType]
FROM DWH_Customs..DIM_PocketMoneyTransferType with (nolock)
), SanitySingularNullityChecks_DIM_UserType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_UserType' TestTable
	,COUNT(CASE WHEN [Id]		IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [UserType] IS NULL THEN 1 ELSE NULL END) [UserType]
FROM DWH_Customs..DIM_UserType with (nolock)
), SanitySingularNullityChecks_DIM_FeatureType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_FeatureType' TestTable
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [ENG_Name]	   IS NULL AND FeatureType != -1 THEN 1 ELSE NULL END) [ENG_Name]
	,COUNT(CASE WHEN [FeatureType]   IS NULL THEN 1 ELSE NULL END) [FeatureType]
FROM DWH_Customs..DIM_FeatureType with (nolock)
), SanitySingularNullityChecks_DIM_UserCards AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_UserCards' TestTable
	,COUNT(CASE WHEN [CardLogoType]	  IS NULL THEN 1 ELSE NULL END) [CardLogoType]
	,COUNT(CASE WHEN [CardType]		  IS NULL THEN 1 ELSE NULL END) [CardType]
	,COUNT(CASE WHEN [Id]			  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [UserCardTypeId] IS NULL THEN 1 ELSE NULL END) [UserCardTypeId]
FROM DWH_CustomTables.DBO.DIM_UserCards with (nolock)
),SanitySingularNullityChecks_DIM_MoneyTransferType AS
(
SELECT
	 'DWH_Customs'			[DataBase]
    ,'DIM_MoneyTransferType' TestTable
	,COUNT(CASE WHEN [Description]		 IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [MoneyTransferType] IS NULL THEN 1 ELSE NULL END) [MoneyTransferType]
FROM DWH_Customs..DIM_MoneyTransferType with (nolock)
),SanitySingularNullityChecks_DIM_CustomsCardTxType AS
(
SELECT
	 'DWH_Customs'			[DataBase]
    ,'DIM_CustomsCardTxType' TestTable
	,COUNT(CASE WHEN [Description]		IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [CustomsCardTxType] IS NULL THEN 1 ELSE NULL END) [CustomsCardTxType]
FROM DWH_Customs..DIM_CustomsCardTxType with (nolock)
),SanitySingularNullityChecks_DIM_MerchantFeeOperationType AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_MerchantFeeOperationType' TestTable
	,COUNT(CASE WHEN [Description]   IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [OperationType] IS NULL THEN 1 ELSE NULL END) [OperationType]
FROM DWH_Customs..DIM_MerchantFeeOperationType with (nolock)
),SanitySingularNullityChecks_DIM_MerchantNotes AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_MerchantNotes' TestTable
	,COUNT(CASE WHEN [CreateDate]	   IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [Id]			   IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [MerchantKey]	   IS NULL THEN 1 ELSE NULL END) [MerchantKey]
	,COUNT(CASE WHEN [Note]			   IS NULL THEN 1 ELSE NULL END) [Note]
	,COUNT(CASE WHEN [OperatorUserKey] IS NULL THEN 1 ELSE NULL END) [OperatorUserKey]
FROM DWH_Customs..DIM_MerchantNotes with (nolock)
),SanitySingularNullityChecks_DIM_Users AS
(
SELECT
	 'DWH_Customs' [DataBase]
    ,'DIM_Users'  TestTable
	,COUNT(CASE WHEN [AccessFailedCount]	   IS NULL THEN 1 ELSE NULL END) [AccessFailedCount]
	,COUNT(CASE WHEN [AccountNumber]		   IS NULL THEN 1 ELSE NULL END) [AccountNumber]
	,COUNT(CASE WHEN [Age]					   IS NULL THEN 1 ELSE NULL END) [Age]
	,COUNT(CASE WHEN [AgeCategory]			   IS NULL THEN 1 ELSE NULL END) [AgeCategory]
	,COUNT(CASE WHEN [ApprovalType]			   IS NULL THEN 1 ELSE NULL END) [ApprovalType]
	,COUNT(CASE WHEN [CreateDate]			   IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey]	   IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
	,COUNT(CASE WHEN [DateOfBirth]			   IS NULL THEN 1 ELSE NULL END) [DateOfBirth]
	,COUNT(CASE WHEN [DeviceType]			   IS NULL THEN 1 ELSE NULL END) [DeviceType]
	,COUNT(CASE WHEN [EduStatus]			   IS NULL THEN 1 ELSE NULL END) [EduStatus]
	,COUNT(CASE WHEN [Email]				   IS NULL THEN 1 ELSE NULL END) [Email]
	,COUNT(CASE WHEN [EmailConfirmed]		   IS NULL THEN 1 ELSE NULL END) [EmailConfirmed]
	,COUNT(CASE WHEN [FirstName]			   IS NULL THEN 1 ELSE NULL END) [FirstName]
	,COUNT(CASE WHEN [HasBankDeposit]		   IS NULL THEN 1 ELSE NULL END) [HasBankDeposit]
	,COUNT(CASE WHEN [HasMaxAmountOverDeposit] IS NULL THEN 1 ELSE NULL END) [HasMaxAmountOverDeposit]
	,COUNT(CASE WHEN [Id]					   IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [IsCommercial]			   IS NULL THEN 1 ELSE NULL END) [IsCommercial]
	,COUNT(CASE WHEN [IsCustomsFamily]		   IS NULL THEN 1 ELSE NULL END) [IsCustomsFamily]
	,COUNT(CASE WHEN [IsPassiveAccount]		   IS NULL THEN 1 ELSE NULL END) [IsPassiveAccount]
	,COUNT(CASE WHEN [LastName]				   IS NULL THEN 1 ELSE NULL END) [LastName]
	,COUNT(CASE WHEN [MailDomain]			   IS NULL THEN 1 ELSE NULL END) [MailDomain]
	,COUNT(CASE WHEN [PhoneNumberConfirmed]	   IS NULL THEN 1 ELSE NULL END) [PhoneNumberConfirmed]
	,COUNT(CASE WHEN [SignUpChannel]		   IS NULL THEN 1 ELSE NULL END) [SignUpChannel]
	,COUNT(CASE WHEN [SignUpMethod]			   IS NULL THEN 1 ELSE NULL END) [SignUpMethod]
	,COUNT(CASE WHEN [User_Key]				   IS NULL THEN 1 ELSE NULL END) [User_Key]
	,COUNT(CASE WHEN [UserType]				   IS NULL THEN 1 ELSE NULL END) [UserType]
FROM DWH_Customs..DIM_Users with (nolock) where User_Key != 16940354
),SanitySingularNullityChecks_DIM_UserDevices AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_UserDevices' TestTable
	,COUNT(CASE WHEN [CreateDate]			  IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey]	  IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
	,COUNT(CASE WHEN [Id]					  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [IpAddress]			  IS NULL THEN 1 ELSE NULL END) [IpAddress]
	,COUNT(CASE WHEN [IsApprovedByUser]		  IS NULL THEN 1 ELSE NULL END) [IsApprovedByUser]
	,COUNT(CASE WHEN [OperatingSystem]		  IS NULL THEN 1 ELSE NULL END) [OperatingSystem]
	,COUNT(CASE WHEN [UniqueDeviceIdentifier] IS NULL THEN 1 ELSE NULL END) [UniqueDeviceIdentifier]
	,COUNT(CASE WHEN [UserKey]				  IS NULL THEN 1 ELSE NULL END) [UserKey]
FROM DWH_Customs..DIM_UserDevices with (nolock)
),SanitySingularNullityChecks_DIM_AddressNeighborhoods AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_AddressNeighborhoods' TestTable
	,COUNT(CASE WHEN [DistrictId]		IS NULL THEN 1 ELSE NULL END) [DistrictId]
	,COUNT(CASE WHEN [NeighborhoodCode] IS NULL THEN 1 ELSE NULL END) [NeighborhoodCode]
	,COUNT(CASE WHEN [NeighborhoodName] IS NULL THEN 1 ELSE NULL END) [NeighborhoodName]
	,COUNT(CASE WHEN [PostalCode]		IS NULL THEN 1 ELSE NULL END) [PostalCode]
FROM DWH_Customs..DIM_AddressNeighborhoods with (nolock)
),SanitySingularNullityChecks_DIM_AddressDistricts AS
(
SELECT
	 'DWH_Customs'			[DataBase]
    ,'DIM_AddressDistricts' TestTable
	,COUNT(CASE WHEN [CityCode]		IS NULL THEN 1 ELSE NULL END) [CityCode]
	,COUNT(CASE WHEN [DistrictCode] IS NULL THEN 1 ELSE NULL END) [DistrictCode]
	,COUNT(CASE WHEN [DistrictId]	IS NULL THEN 1 ELSE NULL END) [DistrictId]
	,COUNT(CASE WHEN [DistrictName] IS NULL THEN 1 ELSE NULL END) [DistrictName]
FROM DWH_Customs..DIM_AddressDistricts with (nolock)
), SanitySingularNullityChecks_DIM_AddressCountries AS
(
SELECT
	 'DWH_Customs'			[DataBase]
    ,'DIM_AddressCountries' TestTable
	,COUNT(CASE WHEN [Culture] IS NULL THEN 1 ELSE NULL END) [Culture]
	,COUNT(CASE WHEN [Id]	   IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [Name]	   IS NULL THEN 1 ELSE NULL END) [Name]
	,COUNT(CASE WHEN [Order]   IS NULL THEN 1 ELSE NULL END) [Order]
FROM DWH_Customs..DIM_AddressCountries with (nolock)
), SanitySingularNullityChecks_DIM_PosModels AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_PosModels' TestTable
	,COUNT(CASE WHEN [CreateDate]   IS NULL			   THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [Description] IS NULL			   THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [Id]		   IS NULL			   THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [IKSCode]	   IS NULL and Id != 7 THEN 1 ELSE NULL END) [IKSCode]
	,COUNT(CASE WHEN [PinpadType]  IS NULL			   THEN 1 ELSE NULL END) [PinpadType]
	,COUNT(CASE WHEN [PosBrandId]  IS NULL			   THEN 1 ELSE NULL END) [PosBrandId]
FROM DWH_Customs..DIM_PosModels with (nolock)
), SanitySingularNullityChecks_DIM_PosBrands AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_PosBrands' TestTable
	,COUNT(CASE WHEN [CreateDate]   IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [Description] IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [Id]		   IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [IKSCode]	   IS NULL THEN 1 ELSE NULL END) [IKSCode]
FROM DWH_Customs..DIM_PosBrands with (nolock)
),SanitySingularNullityChecks_DIM_AddressCities AS
(
SELECT
	 'DWH_Customs'		[DataBase]
    ,'DIM_AddressCities' TestTable
	,COUNT(CASE WHEN [CityCode] IS NULL THEN 1 ELSE NULL END) [CityCode]
	,COUNT(CASE WHEN [CityName] IS NULL THEN 1 ELSE NULL END) [CityName]
FROM DWH_Customs..DIM_AddressCities with (nolock)
),SanitySingularNullityChecks_DIM_CustomsCards_Details AS
(
SELECT
	 'DWH_Customs'			   [DataBase]
    ,'DIM_CustomsCards_Details' TestTable
	,COUNT(CASE WHEN [Id]						   IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [InternetTransactionsEnabled] IS NULL THEN 1 ELSE NULL END) [InternetTransactionsEnabled]
	,COUNT(CASE WHEN [Network]					   IS NULL THEN 1 ELSE NULL END) [Network]
	,COUNT(CASE WHEN [OnlyEnabledForEduTerminals]  IS NULL THEN 1 ELSE NULL END) [OnlyEnabledForEduTerminals]
	,COUNT(CASE WHEN [SpendRoundingEnabled]		   IS NULL THEN 1 ELSE NULL END) [SpendRoundingEnabled]
FROM DWH_Customs..DIM_CustomsCards_Details with (nolock)
), SanitySingularNullityChecks_DIM_BillType AS
(
SELECT
	 'Customs_billpayment'		[DataBase]
    ,'DIM_BillType'				TestTable
	,COUNT(CASE WHEN [Id]		IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [IsActive] IS NULL THEN 1 ELSE NULL END) [IsActive]
	,COUNT(CASE WHEN [Name]		IS NULL THEN 1 ELSE NULL END) [Name]
	,COUNT(CASE WHEN [Name_ENG] IS NULL THEN 1 ELSE NULL END) [Name_ENG]
FROM Customs_billpayment..DIM_BillType with (nolock)
), SanitySingularNullityChecks_DIM_Company AS
(
SELECT
	 'Customs_billpayment'		[DataBase]
    ,'DIM_Company'				TestTable
	,COUNT(CASE WHEN [Id]				  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [CreateDatee]		  IS NULL THEN 1 ELSE NULL END) [CreateDatee]
	,COUNT(CASE WHEN [CreateDatee_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDatee_DateKey]
	,COUNT(CASE WHEN [IsActive]			  IS NULL THEN 1 ELSE NULL END) [IsActive]
	,COUNT(CASE WHEN [BillTypeId]		  IS NULL THEN 1 ELSE NULL END) [BillTypeId]
	,COUNT(CASE WHEN [Name]				  IS NULL THEN 1 ELSE NULL END) [Name]
FROM Customs_billpayment..DIM_Company with (nolock)
), SanitySingularNullityChecks_DIM_CompanySubType AS
(
SELECT
	 'Customs_billpayment'		[DataBase]
    ,'DIM_CompanySubType' TestTable
,COUNT(CASE WHEN [Id]		  IS NULL THEN 1 ELSE NULL END) [Id]
,COUNT(CASE WHEN [IsActive]	  IS NULL THEN 1 ELSE NULL END) [IsActive]
,COUNT(CASE WHEN [BillTypeId] IS NULL THEN 1 ELSE NULL END) [BillTypeId]
,COUNT(CASE WHEN [Name]		  IS NULL THEN 1 ELSE NULL END) [Name]
,COUNT(CASE WHEN [Name_ENG]	  IS NULL THEN 1 ELSE NULL END) [Name_ENG]
FROM Customs_billpayment..DIM_CompanySubType with (nolock)
), SanitySingularNullityChecks_DIM_Country AS
(
SELECT
	 'Customs_billpayment'		[DataBase]
    ,'DIM_Country' TestTable
	,COUNT(CASE WHEN [Id]				  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [Name]				  IS NULL THEN 1 ELSE NULL END) [Name]
	,COUNT(CASE WHEN [Alpha2Code]		  IS NULL THEN 1 ELSE NULL END) [Alpha2Code]
	,COUNT(CASE WHEN [Alpha3Code]		  IS NULL THEN 1 ELSE NULL END) [Alpha3Code]
	,COUNT(CASE WHEN [Numeric]			  IS NULL THEN 1 ELSE NULL END) [Numeric]
	,COUNT(CASE WHEN [Iso_3166_2]		  IS NULL THEN 1 ELSE NULL END) [Iso_3166_2]
	,COUNT(CASE WHEN [Region]			  IS NULL THEN 1 ELSE NULL END) [Region]
	,COUNT(CASE WHEN [SubRegion]		  IS NULL THEN 1 ELSE NULL END) [SubRegion]
	,COUNT(CASE WHEN [IntermediateRegion] IS NULL THEN 1 ELSE NULL END) [IntermediateRegion]
	,COUNT(CASE WHEN [RegionCode]		  IS NULL THEN 1 ELSE NULL END) [RegionCode]
	,COUNT(CASE WHEN [SubRegionCode]	  IS NULL THEN 1 ELSE NULL END) [SubRegionCode]
FROM Customs_billpayment..DIM_Country with (nolock)
),SanitySingularNullityChecks_DIM_DonationAssociation AS
(
SELECT
	 'Customs_billpayment'		[DataBase]
    ,'DIM_DonationAssociation' TestTable
	,COUNT(CASE WHEN [Id]			 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [CompanyId]	 IS NULL THEN 1 ELSE NULL END) [CompanyId]
	,COUNT(CASE WHEN [MinimumAmount] IS NULL THEN 1 ELSE NULL END) [MinimumAmount]
	,COUNT(CASE WHEN [ShortName]	 IS NULL THEN 1 ELSE NULL END) [ShortName]
	,COUNT(CASE WHEN [DisplayName]   IS NULL THEN 1 ELSE NULL END) [DisplayName]
	,COUNT(CASE WHEN [ImageUrl]		 IS NULL THEN 1 ELSE NULL END) [ImageUrl]
	,COUNT(CASE WHEN [AccessToken]   IS NULL THEN 1 ELSE NULL END) [AccessToken]
	,COUNT(CASE WHEN [Order]		 IS NULL THEN 1 ELSE NULL END) [Order]
	,COUNT(CASE WHEN [MaximumAmount] IS NULL THEN 1 ELSE NULL END) [MaximumAmount]
FROM Customs_billpayment..DIM_DonationAssociation with (nolock)
), SanitySingularNullityChecks_DIM_LocationRelation AS
(
SELECT
	 'Customs_billpayment'		[DataBase]
    ,'DIM_LocationRelation' TestTable
	,COUNT(CASE WHEN [Id]				  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [CreateDatee]		  IS NULL THEN 1 ELSE NULL END) [CreateDatee]
	,COUNT(CASE WHEN [CreateDatee_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDatee_DateKey]
	,COUNT(CASE WHEN [CountryId]		  IS NULL THEN 1 ELSE NULL END) [CountryId]
FROM Customs_billpayment..DIM_LocationRelation with (nolock)
), SanitySingularNullityChecks_DIM_Province AS
(
SELECT
	 'Customs_billpayment'		[DataBase]
    ,'DIM_Province' TestTable
	,COUNT(CASE WHEN [Id]				  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [CreateDatee]		  IS NULL THEN 1 ELSE NULL END) [CreateDatee]
	,COUNT(CASE WHEN [CreateDatee_DateKey] IS NULL THEN 1 ELSE NULL END) [CreateDatee_DateKey]
	,COUNT(CASE WHEN [CountryId]		  IS NULL THEN 1 ELSE NULL END) [CountryId]
	,COUNT(CASE WHEN [Name]				  IS NULL THEN 1 ELSE NULL END) [Name]
	,COUNT(CASE WHEN [Alpha2Code]		  IS NULL THEN 1 ELSE NULL END) [Alpha2Code]
FROM Customs_billpayment..DIM_Province with (nolock)
), SanitySingularNullityChecks_DIM_ServiceProvider AS
(
SELECT
	 'Customs_billpayment'		[DataBase]
    ,'DIM_ServiceProvider' TestTable
	,COUNT(CASE WHEN [Id]				   IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [Name]				   IS NULL THEN 1 ELSE NULL END) [Name]
	,COUNT(CASE WHEN [Status]			   IS NULL THEN 1 ELSE NULL END) [Status]
	,COUNT(CASE WHEN [ServiceProviderType] IS NULL THEN 1 ELSE NULL END) [ServiceProviderType]
FROM Customs_billpayment..DIM_ServiceProvider with (nolock)
),SanitySingularNullityChecks_DIM_TravelCard AS
(
SELECT
	 'Customs_billpayment'		[DataBase]
    ,'DIM_TravelCard' TestTable
	,COUNT(CASE WHEN [Id]			 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [CustomsUserKey] IS NULL THEN 1 ELSE NULL END) [CustomsUserKey]
	,COUNT(CASE WHEN [CardId]		 IS NULL THEN 1 ELSE NULL END) [CardId]
	,COUNT(CASE WHEN [CompanyId]	 IS NULL THEN 1 ELSE NULL END) [CompanyId]
	,COUNT(CASE WHEN [CreatedDate]	 IS NULL THEN 1 ELSE NULL END) [CreatedDate]
	,COUNT(CASE WHEN [IsActive]		 IS NULL THEN 1 ELSE NULL END) [IsActive]
FROM Customs_billpayment..DIM_TravelCard with (nolock)
),SanitySingularNullityChecks_DIM_DonationTemplate AS
(
SELECT
	 'Customs_billpayment'		[DataBase]
    ,'DIM_DonationTemplate' TestTable
	,COUNT(CASE WHEN [Id]			   IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [Name]			   IS NULL THEN 1 ELSE NULL END) [Name]
	,COUNT(CASE WHEN [Icon]			   IS NULL THEN 1 ELSE NULL END) [Icon]
	,COUNT(CASE WHEN [BackgroundImage] IS NULL THEN 1 ELSE NULL END) [BackgroundImage]
	,COUNT(CASE WHEN [Language]		   IS NULL THEN 1 ELSE NULL END) [Language]
	,COUNT(CASE WHEN [IsSelected]	   IS NULL THEN 1 ELSE NULL END) [IsSelected]
	,COUNT(CASE WHEN [Sort]			   IS NULL THEN 1 ELSE NULL END) [Sort]
	,COUNT(CASE WHEN [IsActive]		   IS NULL THEN 1 ELSE NULL END) [IsActive]
	,COUNT(CASE WHEN [CreateDatee]	   IS NULL THEN 1 ELSE NULL END) [CreateDatee]
	,COUNT(CASE WHEN [UpdateDate]	   IS NULL THEN 1 ELSE NULL END) [UpdateDate]
	,COUNT(CASE WHEN [Description]	   IS NULL THEN 1 ELSE NULL END) [Description]
	,COUNT(CASE WHEN [PreviewImage]	   IS NULL THEN 1 ELSE NULL END) [PreviewImage]
	,COUNT(CASE WHEN [MailingImage]	   IS NULL THEN 1 ELSE NULL END) [MailingImage]
FROM Customs_billpayment..DIM_DonationTemplate with (nolock)
), SanitySingularNullityChecks_DIM_Product AS
(
SELECT
	 'Customs_insurance'		[DataBase]
    ,'DIM_Product'			TestTable
	,COUNT(CASE WHEN [Id]							 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [Name]							 IS NULL THEN 1 ELSE NULL END) [Name]
	,COUNT(CASE WHEN [CompanyId]					 IS NULL THEN 1 ELSE NULL END) [CompanyId]
	,COUNT(CASE WHEN [TypeId]						 IS NULL THEN 1 ELSE NULL END) [TypeId]
	,COUNT(CASE WHEN [CustomsFeeOperationType]		 IS NULL THEN 1 ELSE NULL END) [CustomsFeeOperationType]
	,COUNT(CASE WHEN [ProviderId]					 IS NULL THEN 1 ELSE NULL END) [ProviderId]
	,COUNT(CASE WHEN [IsActive]						 IS NULL THEN 1 ELSE NULL END) [IsActive]
	,COUNT(CASE WHEN [HasCustomsCCSupport]		     IS NULL THEN 1 ELSE NULL END) [HasCustomsCCSupport]
	,COUNT(CASE WHEN [HasInsuranceCompanyCCSupport]  IS NULL THEN 1 ELSE NULL END) [HasInsuranceCompanyCCSupport]
	,COUNT(CASE WHEN [CreateDatee]					 IS NULL THEN 1 ELSE NULL END) [CreateDatee]
	,COUNT(CASE WHEN [BranchId]						 IS NULL THEN 1 ELSE NULL END) [BranchId]
	,COUNT(CASE WHEN [HasCancellationFeatureEnabled] IS NULL THEN 1 ELSE NULL END) [HasCancellationFeatureEnabled]
FROM Customs_insurance..DIM_Product with (nolock)
),SanitySingularNullityChecks_DIM_Companies AS
(
SELECT
	 'Customs_insurance'		[DataBase]
    ,'DIM_Companies'		TestTable
	,COUNT(CASE WHEN [Id]		 IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [ShortName] IS NULL THEN 1 ELSE NULL END) [ShortName]
	,COUNT(CASE WHEN [LongName]  IS NULL THEN 1 ELSE NULL END) [LongName]
FROM Customs_insurance..DIM_Companies with (nolock)
), SanitySingularNullityChecks_DIM_CellPhoneActivations AS
(
SELECT
	 'Customs_insurance'		[DataBase]
    ,'DIM_CellPhoneActivations' TestTable
	,COUNT(CASE WHEN [Id]		  IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [CreateDatee] IS NULL THEN 1 ELSE NULL END) [CreateDatee]
	,COUNT(CASE WHEN [PolicyNo]   IS NULL THEN 1 ELSE NULL END) [PolicyNo]
	,COUNT(CASE WHEN [IMEI]		  IS NULL THEN 1 ELSE NULL END) [IMEI]
	,COUNT(CASE WHEN [DeviceId]   IS NULL THEN 1 ELSE NULL END) [DeviceId]
	,COUNT(CASE WHEN [DeviceOS]   IS NULL THEN 1 ELSE NULL END) [DeviceOS]
	,COUNT(CASE WHEN [DeviceInfo] IS NULL THEN 1 ELSE NULL END) [DeviceInfo]
	,COUNT(CASE WHEN [Images]	  IS NULL THEN 1 ELSE NULL END) [Images]
	,COUNT(CASE WHEN [Test]		  IS NULL THEN 1 ELSE NULL END) [Test]
FROM Customs_insurance..DIM_CellPhoneActivations with (nolock)
),SanitySingularNullityChecks_DIM_Countries AS
(
SELECT
	 'Customs_terrapay'		[DataBase]
    ,'DIM_Countries' TestTable
	,COUNT(CASE WHEN [Id]						IS NULL THEN 1 ELSE NULL END) [Id]
	,COUNT(CASE WHEN [TurkishName]				IS NULL THEN 1 ELSE NULL END) [TurkishName]
	,COUNT(CASE WHEN [EnglishName]				IS NULL THEN 1 ELSE NULL END) [EnglishName]
	,COUNT(CASE WHEN [Code]						IS NULL THEN 1 ELSE NULL END) [Code]
	,COUNT(CASE WHEN [Flag]						IS NULL THEN 1 ELSE NULL END) [Flag]
	,COUNT(CASE WHEN [Status]					IS NULL THEN 1 ELSE NULL END) [Status]
	,COUNT(CASE WHEN [IsMaintenanceModeEnabled] IS NULL THEN 1 ELSE NULL END) [IsMaintenanceModeEnabled]
	,COUNT(CASE WHEN [CreateDate]				IS NULL THEN 1 ELSE NULL END) [CreateDate]
	,COUNT(CASE WHEN [CreateDate_DateKey]		IS NULL THEN 1 ELSE NULL END) [CreateDate_DateKey]
FROM Customs_terrapay..DIM_Countries with (nolock)
)
  SELECT
    GETDATE() TestDate
   ,[DataBase]
   ,TestTable
   ,TestTableField
   ,CAST(IIF(HasTimeRange=0,0,1) AS BIT) HasTimeRange
   ,TestTimeRange /*0='All Table'*/
   ,IIF(HasTimeRange=1,@StartDate,NULL) TestedStreamDate
   ,TestType /*0 = 'Nullity'*/
   ,CheckType /*0= 'Singular Nullity'*/
   ,CAST(IIF(InsanityOutputCount=0,0,1) AS BIT) HasInsanity
   ,InsanityOutputCount
   ,CASE WHEN TestType = 0 AND CheckType = 0 AND InsanityOutputCount = 0 THEN 'SUCCESS! Has no insantiy for singular nullity'
																		 ELSE 'FAILURE! Has insantiy for singular nullity'	  END SanityResultDescription

  FROM (
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				*
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CustomsCards
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (	--Sağdakine ismini verdir, çıktısını soldakine
					  																 [Id]
					  																,[Status]
					  																,[CreateDate]
					  																,[CreateDate_DateKey]
					  																,[NoFee]
					  																,[Type]
					  																,[LogoType]
					  																,[ApplicationType]
					  																,[LimitType]
					  																,[IsNoName]
					  																,[IsContactlessTransactionEnabled]
					  																,[MicroServiceType]
					  																,[PrimeCardProgramEnabled]
					  															  )
					  				   ) AS UNPIVOTSingularNullityChecks_For_DIM_CustomsCards
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CustomsCards
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_BankPosMapping
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[IbanCode]
																					,[MicroServiceCode]
																					,[BreakDown]
																					,[Bank]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_BankPosMapping
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_BankPosMapping
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Banks
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[OfficialName] 
																					,[ShortName]
																					,[IbanCode]
																					,[WebServiceEnabled]
																					,[WebServiceExternalMoneyTransferStartingTime]
																					,[WebServiceExternalMoneyTransferEndTime]
																					,[AllowsExternalMoneyTransfer]
																					,[TransferCommission]
																					,[OverTimeTransferCommission]
																					,[ExternalMoneyTransferCommission]
																					,[CreateDate]
																					,[CreateDate_DateKey]
																					,[AlwaysManuallyTransferred]
																					,[AutoDepositEnabled]
																					,[AllowCustomerWithdrawals]
																					,[AlwaysTransferredByExternalMoneyTransfer]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Banks
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Banks
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_BannedTransferIbans
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																  [Id]
																					 ,[CreateDate]
																					 ,[CreateDate_DateKey]
																					 ,[Type]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_BannedTransferIbans
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_BannedTransferIbans
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_BICombinationType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [FeatureType]
																					,[Currency]				
																					,[CustomsCardTxType]		
																					,[MoneyTransferType]	
																					,[EntrySubType]			
																					,[is_Offline]			
																					,[isDirectRevenue]		
																					,[CombinationType]		
																					,[Name]					
																					,[NameENG]				
																					,[Description]			
																					,[CashFlowType]			
																					,[Domain]				
																					,[CashFlowTypeName_ENG]	
																					,[DomainName_ENG]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_BICombinationType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_BICombinationType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CardInstitutionIdentifications
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[CardIssuerName]
																					,[CreditCardFraudMaxLimit]
																					,[DebitCardFraudMaxLimit]
																					,[CreateDate]
																					,[FraudPendingTime]
																					,[IsDomestic]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_CardInstitutionIdentifications
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CardInstitutionIdentifications
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CashbackConditions
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[CashbackRatio]
																					,[ApplicableToFeatureType]
																					,[ApplicableToCurrency]
																					,[HasMonthlyCap]
																					,[MonthlyCap]
																					,[HasAmountPerTransactionCap]
																					,[AmountPerTransactionCap]
																					,[OnlyAppliedToAssignedUsers]
																					,[RewardLedgerIconUrl]
																					,[DescriptionTitle]
																					,[CreateDate]
																					,[CreateDate_DateKey]
																					,[DiscriminatorId]
																					,[StartDate]
																					,[EndDate]
																					,[AllowedCashbackCount]
																					,[CashbackAmount]
																					,[MinimumTransactionAmount]
																					,[ApplicableToFeatureTypeCodes]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_CashbackConditions
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CashbackConditions
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Date
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [DateKey]
																					,[CreateDatee]
																					,[DayOfWeekEN]
																					,[DayOfWeek]
																					,[DayNumberInMonth]
																					,[WeekNumberInYear]
																					,[CalendarMonthEN]
																					,[CalendarMonth]
																					,[MonthNumber]
																					,[YearNumber]
																					,[CalendarQuarter]
																					,[FiscalQuarter]
																					,[FiscalMonth]
																					,[FiscalYear]
																					,[IsHoliday]
																					,[IsWeekDay]
																					,[IsLastDayOfMonth]
																					,[DayNumberInWeek]
																					,[MonthKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Date
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Date
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_RecognizedCardAcceptorBkmIds
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[RecognizedCardAcceptorId]
																					,[CreateDate]
																					,[CreateDate_DateKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_RecognizedCardAcceptorBkmIds
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_RecognizedCardAcceptorBkmIds
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_RecognizedCardSystemMerchantNames
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[RecognizedCardAcceptorId]
																					,[CardSystemMerchantName]
																					,[CreateDate]
																					,[CreateDate_DateKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_RecognizedCardSystemMerchantNames
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_RecognizedCardSystemMerchantNames
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_RecognizedCardAcceptorCustomsCards
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [RecognizedCardAcceptor_Id]
																					,[CustomsCard_Id]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_RecognizedCardAcceptorCustomsCards
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_RecognizedCardAcceptorCustomsCards
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_RecognizedCardAcceptors
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[BrandName] 
																					,[CategoryId]
																					,[IconUrl] 
																					,[CreateDate] 
																					,[CreateDate_DateKey]
																					,[IsCredentialOnFile]
																					,[IsAvailableForGiftCard]
																					,[IsPopular]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_RecognizedCardAcceptors
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_RecognizedCardAcceptors
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_FamilyRelations
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[Child_Key]
																					,[RelationType]
																					,[RelatedPhoneNumber]
																					,[RelationStatus]
																					,[IsActive]
																					,[CreateDate]
																					,[CreateDate_DateKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_FamilyRelations
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_FamilyRelations
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_IdentityGroupRoles
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [RoleGroupId]
																					,[Role_Key]  
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_IdentityGroupRoles
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_IdentityGroupRoles
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_InhouseRolesV2
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id] 
																					,[Name]
																					,[Identity]
																					,[Description]
																					,[RoleType]
																					,[CreateDate]
																					,[CreateDate_DateKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_InhouseRolesV2
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_InhouseRolesV2
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_IdentityUserRolesV2
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[User_Key]
																					,[IsAllowed]
																					,[CreateDate]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_IdentityUserRolesV2
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_IdentityUserRolesV2
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_InvestmentNotificationSubcriberEntities
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[UserKey]
																					,[CreateDate]
																					,[CreateDate_DateKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_InvestmentNotificationSubcriberEntities
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_InvestmentNotificationSubcriberEntities
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_InviteByFamilyRelations
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[User_Key]
																					,[ReceiverPhoneNumber]
																					,[Status]
																					,[ExternalId]
																					,[CreateDate]
																					,[CreateDate_DateKey]  
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_InviteByFamilyRelations
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_InviteByFamilyRelations
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_KartTeslimat
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CardID]
																					,[CardType]
																					,[CardLogoType]
																					,[CardStatus]
																					,[Kart Tipi]
																					,[Kart Tipi - Detay]
																					,[Kart Statüsü]
																					,[Kart Başvuru Tarihi]
																					,[Kart Basım Tarihi]
																					,[Kartın Kuryeye/Kargoya Teslim Tarihi]
																					,[Kartın Kullanıcıya Teslim Tarihi]
																					,[Kart Aktivasyon Tarihi]
																					,[Adres Sorunlu Olma Durumu]
																					,[Başvuru->Kurye (g)]
																					,[Kurye->Kullanıcı (g)]
																					,[Başvuru->Teslim (g)]
																					,[Teslim->Aktivasyon (g)]
																					,[Başvuru->Aktivasyon (g)]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_KartTeslimat
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_KartTeslimat
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_KYCSozlesmeliKullanici
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[DeviceDescription]
																					,[CreateDate]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_KYCSozlesmeliKullanici
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_KYCSozlesmeliKullanici
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Merchants_Control
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[BrandName]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Merchants_Control
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Merchants_Control
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_MerchantFee
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[Merchant_Key]		
																					,[Currency]			
																					,[OperationType]	
																					,[FeeType]			
																					,[Value]				
																					,[MaxFee]			
																					,[CreateDate]			
																					,[CreateDate_DateKey]	
																					,[VolumeLimit]		
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_MerchantFee
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_MerchantFee
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_MerchantUsers
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[MerchantKey]	
																					,[UserKey]	
																					,[CreateDate]	
																					,[CreateDate_DateKey]	
																					,[IsDeleted]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_MerchantUsers
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_MerchantUsers
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Merchants
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[LegalName]							
																					,[BrandName]							
																					,[SecretKey]							
																					,[ApiKey]									
																					,[CreateDate]							
																					,[CreateDate_DateKey]				
																					,[MerchantCategory]					
																					,[EncryptedSecretKey]				
																					,[EncryptedApiKey]						
																					,[EncryptedEncryptionPassword]			
																					,[IsLockedOut]						
																					,[MerchantNumber]					
																					,[CityCode]
																					,[DistrictCode]						
																					,[IsPaymentNotificationEnabled]		
																					,[IsHashEnabled]
																					,[IsCorporateCardTwoFactorAuthEnabled]
																					,[EnabledReportTpye]					
																					,[IsBroker]								
																					,[IsPartner]						
																					,[MerchantType]						
																					,[IdempotencyEnabled]		
																					,[Merchant_Key]						
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Merchants
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Merchants
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Resources
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[CreateDate]			
																					,[CreateDate_DateKey]
																					,[Key]				
																					,[Language]				
																					,[Type]				
																					,[Target]		
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Resources
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Resources
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_SavedCards
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id] 
																					,[UserKey]	
																					,[UserId]
																					,[CreditCardHash]
																					,[Approved]	
																					,[CreateDate]
																					,[CreateDate_DateKey]
																					,[Refund]
																					,[NotRefund]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_SavedCards
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_SavedCards
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_SavingBalanceDefinitions
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[DefinitionType]
																					,[User_Key]
																					,[SavingBalanceId]
																					,[CreateDate]
																					,[CreateDate_DateKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_SavingBalanceDefinitions
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_SavingBalanceDefinitions
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_MobileDevices
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[DeviceBrand]
																					,[DeviceModel]
																					,[IsNfcSupported]	
																					,[CreateDate]
																					,[CreateDate_DateKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_MobileDevices
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_MobileDevices
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_ParentStudentRelationships
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[Student_Key]
																					,[Parent_Key]
																					,[IsActive]
																					,[StudentAuthorizedParent]
																					,[ParentReceivesNotificaiton]
																					,[CreateDate]
																					,[CreateDate_DateKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_ParentStudentRelationships
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_ParentStudentRelationships
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_UserOperationNotes
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[UserKey]
																					,[OperatorUserKey]
																					,[CreateDate]
																					,[DateKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_UserOperationNotes
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_UserOperationNotes
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_UserTransferIbans
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[UserKey]
																					,[BankId]
																					,[Iban]
																					,[Currency]
																					,[IsActive]
																					,[CreateDate]
																					,[CreateDate_DateKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_UserTransferIbans
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_UserTransferIbans
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_AtmTerminals
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[TerminalId]
																					,[CityCode]
																					,[FeeDiscountType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_AtmTerminals
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_AtmTerminals
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType		 /*0 = 'Nullity'*/
					  				,0 CheckType	 /*0 = 'Singular Nullity'*/
									,0 HasTimeRange  /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_BankDepositRefundExitType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN ([ExitType])
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_BankDepositRefundExitType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_BankDepositRefundExitType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_BankAccounts
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[Currency]
																					,[IsActive]
																					,[CreateDate]	
																					,[CreateDate_DateKey]
																					,[DiscriminatorId]
																					,[Bank_Id]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_BankAccounts
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_BankAccounts
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_BankAccounts
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[Currency]
																					,[IsActive]
																					,[CreateDate]	
																					,[CreateDate_DateKey]
																					,[DiscriminatorId]
																					,[Bank_Id]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_BankAccounts
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_BankAccounts
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_BankAccountSettings
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[Name]
																					,[IbanCode]	
																					,[TransactionEnabled]
																					,[CreateDate]	
																					,[Balance]
																					,[Currency]		
																					,[AllowedForAtmDeposits]
																					,[AllowedForBankTransferDeposits]
																					,[AutoTransferEnabled]		
																					,[AutoExternalMoneyTransferEnabled]		
																					,[TransferCommission]
																					,[ExternalMoneyTransferCommission]
																					,[AlwaysManuallyTransferred]
																					,[AllowCustomerWithdrawals]
																					,[AlwaysTransferredByExternalMoneyTransfer]
																					,[IsActive]
																					,[ImageUrl]
																					,[CdnImageUrl]
																					,[AutoRefundEnabled]	
																					,[FirstDepositMaxAmount]
																					,[FirstDepositCheckIsEnabled]
																					,[NewUserDepositMaxAmount]	
																					,[NewUserDepositCheckEnabled]
																					,[AllowedForFastDeposits]
																					,[AllowCustomerIbanMoneyTransfer]
																					,[AutoFastEnabled]
																					,[AutoFastEnabledAllBank]	
																					,[FastCommission]
																					,[MaxFastAmount]
																					,[AllowedTransferredByFast]
																					,[CreateDate_DateKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_BankAccountSettings
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_BankAccountSettings
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_BankAccountSettingsLog
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [RowId]
																					,[Id]
																					,[Name]
																					,[IbanCode]	
																					,[TransactionEnabled]
																					,[CreateDate]	
																					,[Balance]
																					,[Currency]		
																					,[AllowedForAtmDeposits]
																					,[AllowedForBankTransferDeposits]
																					,[AutoTransferEnabled]		
																					,[AutoExternalMoneyTransferEnabled]		
																					,[TransferCommission]
																					,[ExternalMoneyTransferCommission]
																					,[AlwaysManuallyTransferred]
																					,[AllowCustomerWithdrawals]
																					,[AlwaysTransferredByExternalMoneyTransfer]
																					,[IsActive]
																					,[ImageUrl]
																					,[CdnImageUrl]
																					,[AutoRefundEnabled]
																					,[FirstDepositMaxAmount]
																					,[FirstDepositCheckIsEnabled]
																					,[NewUserDepositMaxAmount]
																					,[NewUserDepositCheckEnabled]
																					,[AllowedForFastDeposits]
																					,[AllowCustomerIbanMoneyTransfer]
																					,[AutoFastEnabled]
																					,[AutoFastEnabledAllBank]	
																					,[FastCommission]
																					,[MaxFastAmount]
																					,[AllowedTransferredByFast]
																					,[GetDate_LogDate]
																					,[CriticalBalance]
																					,[AllowCustomerIbanMoneyTransferFast]
																					,[MaxAllowedFastAmount]
																					,[HasBankAccount]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_BankAccountSettingsLog
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_BankAccountSettingsLog
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_UserCards_CardType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CardCategory]
																					,[CardCategoryId]
																					,[CardName]
																					,[CardType]
																					,[CardTypeName]
																					,[Corporate]
																					,[Edu]
																					,[FullCardName]
																					,[Id]
																					,[LogoType]
																					,[LogoTypeName]
																					,[NoName]
																					,[Ordered]
																					,[Physical]
																					,[Sketch]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_UserCards_CardType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_UserCards_CardType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_MappingCity
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [City]
																					,[Id]
																					,[MappingCityCode]
																					,[MappingName]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_MappingCity
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_MappingCity
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_UserEstimations
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN ([UserKey])
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_UserEstimations
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_UserEstimations
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CustomsCard_LogoType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[LogoType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_CustomsCard_LogoType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CustomsCard_LogoType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_EntrySubType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[ENG_Name]
																					,[EntrySubType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_EntrySubType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_EntrySubType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_AuditActivityName
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[ActivityName]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_AuditActivityName
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_AuditActivityName
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_KycUserType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[Type]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_KycUserType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_KycUserType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Courier
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Cargo]
																					,[Id]
																					,[Name]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Courier
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Courier
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_PosTxPointType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[Id]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_PosTxPointType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_PosTxPointType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_LRFM_Score
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [FM_Description]
																					,[FM_Score]
																					,[Id]
																					,[LR_Description]
																					,[LR_Score]
																					,[LRFM_Score]
																					,[TypesofUsers]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_LRFM_Score
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_LRFM_Score
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_FM_Score
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[FM_Score]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_FM_Score
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_FM_Score
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_LR_Score
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[LR_Score]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_LR_Score
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_LR_Score
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_UserTypeHistory
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CreateDate]
																					,[Description]
																					,[Id]
																					,[UserKey]
																					,[UserType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_UserTypeHistory
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_UserTypeHistory
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CashbackPOSBreakdownType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[Id]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_CashbackPOSBreakdownType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CashbackPOSBreakdownType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Users_Details
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [ChatbotStatus]
																					,[CustomerId]
																					,[DeviceNotificationEnabled]
																					,[Id]
																					,[IsComplianceLocked]
																					,[IsDepositConfirmationBank]
																					,[IsLowBalanceNotificationEnabled]
																					,[LiveChatEnabled]
																					,[LockoutEnabled]
																					,[MobileNotificationsEnabled]
																					,[RowVersion]
																					,[Tick]
																					,[TwoFactorEnabled]
																					,[User_Key]
																					,[UserMustChangePassword]
																					,[UserName]			 				
																					,[UserName_persisted]				
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Users_Details
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Users_Details
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_UserAddresses
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[AddressType]
																					,[City]
																					,[CityCode]
																					,[CreateDate]
																					,[CreateDate_DateKey]
																					,[District]
																					,[DistrictCode]
																					,[FormattedAddress]
																					,[NeighborhoodCode]
																					,[User_Key]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_UserAddresses
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_UserAddresses
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Discriminator
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Discriminator]
																					,[DiscriminatorId]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Discriminator
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Discriminator
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_InhouseRoles_RoleType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [NameTR]
																					,[Role_Key]
																					,[RoleType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_InhouseRoles_RoleType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_InhouseRoles_RoleType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Streamers
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CreateDate]
																					,[Id]
																					,[IsDeleted]
																					,[MinAmount]
																					,[Nickname]
																					,[NotificationSource]
																					,[Status]
																					,[StreamUrl]
																					,[UserKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Streamers
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Streamers
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_TwitchStreamers
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [AccessToken]
																					,[CreateDate]
																					,[Id]
																					,[Nickname]
																					,[StreamerId]
																					,[TokenExpiresIn]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_TwitchStreamers
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_TwitchStreamers
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_FeeType_Subgroup
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Fee_Key]
																					,[Subgroup]
																					,[Subgroup_Key]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_FeeType_Subgroup
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_FeeType_Subgroup
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_EduStatus
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[EduStatus]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_EduStatus
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_EduStatus
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_FeeType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Fee_Key]
																					,[FeeType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_FeeType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_FeeType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_IdentityRoleGroups
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CreateDate]
																					,[CreateDate_DateKey]
																					,[Id]
																					,[IsDefault]
																					,[Name]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_IdentityRoleGroups
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_IdentityRoleGroups
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CustomsCardCancelReason
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description_ENG]
																					,[Description_TR]
																					,[Id]
																					,[Name_ENG]
																					,[Name_TR]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_CustomsCardCancelReason
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CustomsCardCancelReason
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_JobTypes
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [AllowedSingleCardTransactionLimit]
																					,[CreateDate]
																					,[CreateDate_DateKey]
																					,[Id]
																					,[IsCommercial]
																					,[Name]
																					,[Name_Eng]
																					,[Name_Tr]
																					,[Order]
																					,[ShowOnAll]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_JobTypes
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_JobTypes
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CustomsCardRejectReason
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[Name_ENG]
																					,[Name_TR]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_CustomsCardRejectReason
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CustomsCardRejectReason
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_PosCategories
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CreateDate]
																					,[CreateDate_DateKey]
																					,[ENG_Name]
																					,[Id]
																					,[Name]
																					,[NameResourceKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_PosCategories
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_PosCategories
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Users_AgeCategories
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [AgeCategoryId]
																					,[Description]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Users_AgeCategories
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Users_AgeCategories
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Currency
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Currency]
																					,[Description]
																					,[IsoCode]
																					,[Name_ENG]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Currency
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Currency
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_FCR
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [BildirimNo]
																					,[BildirimTarihi]
																					,[Ismerged]
																					,[KontaktTipi]
																					,[User_Key]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_FCR
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_FCR
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_BankTransferRequestStatus
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[Status]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_BankTransferRequestStatus
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_BankTransferRequestStatus
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_BankTransferType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [BankTransferType]
																					,[Description]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_BankTransferType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_BankTransferType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CustomsCard_CardStatus
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CardStatus]
																					,[Description]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_CustomsCard_CardStatus
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CustomsCard_CardStatus
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CustomsCard_CardType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CardType]
																					,[Description]
																					,[Physical]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_CustomsCard_CardType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CustomsCard_CardType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_MerchantCategory
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [MerchantCategory]
																					,[MerchantCategory_Key]
																					,[MerchantCategory_NAME]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_MerchantCategory
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_MerchantCategory
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_MoneyTransferMethod
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[Method]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_MoneyTransferMethod
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_MoneyTransferMethod
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_MerchantType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [MerchantType]
																					,[MerchantType_Key]
																					,[MerchantType_NAME]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_MerchantType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_MerchantType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_MoneySource
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[MoneySource]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_MoneySource
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_MoneySource
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_PocketMoneyTransferStatus
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[Status]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_PocketMoneyTransferStatus
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_PocketMoneyTransferStatus
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_PreKycInfos
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [ComplianceNoticeStatus]
																					,[CreateDate]
																					,[CreateDate_DateKey]
																					,[FailCount]
																					,[IsCleaned]
																					,[IsDissimilar]
																					,[IsIdentityWithoutPhoto]
																					,[IsNfcSupported]
																					,[IsVerified]
																					,[KycStatus]
																					,[RowVersion]
																					,[Tick]
																					,[TurkishNationalId]
																					,[UpdatedAt]
																					,[UserApprovalType]
																					,[UserCanBeVerified]
																					,[UserKey]
																					,[UserType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_PreKycInfos
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_PreKycInfos
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CustomsCardOrder_Status
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CardStatus]
																					,[Description]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_CustomsCardOrder_Status
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CustomsCardOrder_Status
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_PocketMoneyTransferPeriod
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[Period]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_PocketMoneyTransferPeriod
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_PocketMoneyTransferPeriod
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_PocketMoneyTransferType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [PocketMoneyTransferType]
																					,[Description]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_PocketMoneyTransferType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_PocketMoneyTransferType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_UserType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[UserType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_UserType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_UserType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_FeatureType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[ENG_Name]
																					,[FeatureType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_FeatureType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_FeatureType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_UserCards
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CardLogoType]
																					,[CardType]
																					,[Id]
																					,[UserCardTypeId]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_UserCards
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_UserCards
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_MoneyTransferType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[MoneyTransferType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_MoneyTransferType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_MoneyTransferType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CustomsCardTxType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[CustomsCardTxType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_CustomsCardTxType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CustomsCardTxType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_MerchantFeeOperationType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Description]
																					,[OperationType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_MerchantFeeOperationType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_MerchantFeeOperationType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_MerchantNotes
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CreateDate]
																					,[Id]
																					,[MerchantKey]
																					,[Note]
																					,[OperatorUserKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_MerchantNotes
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_MerchantNotes
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Users
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [AccessFailedCount]
																					,[AccountNumber]
																					,[Age]
																					,[AgeCategory]
																					,[ApprovalType]
																					,[CreateDate]
																					,[CreateDate_DateKey]
																					,[DateOfBirth]
																					,[DeviceType]
																					,[EduStatus]
																					,[Email]
																					,[EmailConfirmed]
																					,[FirstName]
																					,[HasBankDeposit]
																					,[HasMaxAmountOverDeposit]
																					,[Id]
																					,[IsCommercial]
																					,[IsCustomsFamily]
																					,[IsPassiveAccount]
																					,[LastName]
																					,[MailDomain]
																					,[PhoneNumberConfirmed]
																					,[SignUpChannel]
																					,[SignUpMethod]
																					,[User_Key]
																					,[UserType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Users
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Users
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_UserDevices
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CreateDate]
																					,[CreateDate_DateKey]
																					,[Id]
																					,[IpAddress]
																					,[IsApprovedByUser]
																					,[OperatingSystem]
																					,[UniqueDeviceIdentifier]
																					,[UserKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_UserDevices
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_UserDevices
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_AddressNeighborhoods
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [DistrictId]
																					,[NeighborhoodCode]
																					,[NeighborhoodName]
																					,[PostalCode]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_AddressNeighborhoods
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_AddressNeighborhoods
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_AddressDistricts
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CityCode]
																					,[DistrictCode]
																					,[DistrictId]
																					,[DistrictName]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_AddressDistricts
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_AddressDistricts
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_AddressCountries
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Culture]
																					,[Id]
																					,[Name]
																					,[Order]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_AddressCountries
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_AddressCountries
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_PosModels
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CreateDate]
																					,[Description]
																					,[Id]
																					,[IKSCode]
																					,[PinpadType]
																					,[PosBrandId]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_PosModels
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_PosModels
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_PosBrands
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CreateDate]
																					,[Description]
																					,[Id]
																					,[IKSCode]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_PosBrands
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_PosBrands
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_AddressCities
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [CityCode]
																					,[CityName]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_AddressCities
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_AddressCities
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CustomsCards_Details
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[InternetTransactionsEnabled]
																					,[Network]
																					,[OnlyEnabledForEduTerminals]
																					,[SpendRoundingEnabled]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_CustomsCards_Details
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CustomsCards_Details
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_BillType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[IsActive]
																					,[Name]
																					,[Name_ENG]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_BillType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_BillType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Company
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[CreateDatee]
																					,[CreateDatee_DateKey]
																					,[IsActive]
																					,[BillTypeId]
																					,[Name]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Company
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Company
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CompanySubType
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[IsActive]
																					,[BillTypeId]
																					,[Name]
																					,[Name_ENG]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_CompanySubType
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CompanySubType
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Country
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[Name]
																					,[Alpha2Code]
																					,[Alpha3Code]
																					,[Numeric]
																					,[Iso_3166_2]
																					,[Region]
																					,[SubRegion]
																					,[IntermediateRegion]
																					,[RegionCode]
																					,[SubRegionCode]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Country
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Country
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_DonationAssociation
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[CompanyId]
																					,[MinimumAmount]
																					,[ShortName]
																					,[DisplayName]
																					,[ImageUrl]
																					,[AccessToken]
																					,[Order]
																					,[MaximumAmount]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_DonationAssociation
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_DonationAssociation
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_LocationRelation
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[CreateDatee]
																					,[CreateDatee_DateKey]
																					,[CountryId]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_LocationRelation
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_LocationRelation
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Province
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[CreateDatee]
																					,[CreateDatee_DateKey]
																					,[CountryId]
																					,[Name]
																					,[Alpha2Code]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Province
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Province
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_ServiceProvider
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[Name]
																					,[Status]
																					,[ServiceProviderType]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_ServiceProvider
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_ServiceProvider
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_TravelCard
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[CustomsUserKey]
																					,[CardId]
																					,[CompanyId]
																					,[CreatedDate]
																					,[IsActive]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_TravelCard
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_TravelCard
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_DonationTemplate
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[Name]
																					,[Icon]
																					,[BackgroundImage]
																					,[Language]
																					,[IsSelected]
																					,[Sort]
																					,[IsActive]
																					,[CreateDatee]
																					,[UpdateDate]
																					,[Description]
																					,[PreviewImage]
																					,[MailingImage]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_DonationTemplate
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_DonationTemplate
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Product
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[Name]
																					,[CompanyId]
																					,[TypeId]
																					,[CustomsFeeOperationType]
																					,[ProviderId]
																					,[IsActive]
																					,[HasCustomsCCSupport]
																					,[HasInsuranceCompanyCCSupport]
																					,[CreateDatee]
																					,[BranchId]
																					,[HasCancellationFeatureEnabled]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Product
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Product
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Companies
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[ShortName]
																					,[LongName]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Companies
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Companies
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_CellPhoneActivations
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[CreateDatee]
																					,[PolicyNo]
																					,[IMEI]
																					,[DeviceId]
																					,[DeviceOS]
																					,[DeviceInfo]
																					,[Images]
																					,[Test]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_CellPhoneActivations
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_CellPhoneActivations
		UNION ALL
		SELECT*FROM(
					SELECT*FROM(
					  			SELECT
					  				 *
					  				,0 TestType  /*0 = 'Nullity'*/
					  				,0 CheckType /*0= 'Singular Nullity'*/
									,0 HasTimeRange /*TRUE if test has time range*/
									,0 TestTimeRange /*0='All Table'*/
					  			FROM SanitySingularNullityChecks_DIM_Countries
					  		   ) UnpivotedTable
					  			UNPIVOT(InsanityOutputCount FOR TestTableField IN (
					  																 [Id]
																					,[TurkishName]
																					,[EnglishName]
																					,[Code]
																					,[Flag]
																					,[Status]
																					,[IsMaintenanceModeEnabled]
																					,[CreateDate]
																					,[CreateDate_DateKey]
					  															  )
					  				   ) AS UNPIVOTSanitySingularNullityChecks_For_DIM_Countries
					) UnpivotToTableSanitySingularNullityChecks_For_DIM_Countries
		 ) ALLRawDataUnpivoted
@implementation PKCreditBalanceDetailsViewController

- (PKCreditBalanceDetailsViewController)initWithStyle:(int64_t)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 webService:(id)a6 account:(id)a7 accountUserCollection:(id)a8 physicalCards:(id)a9 statement:(id)a10 previousStatements:(id)a11
{
  id v18;
  id v19;
  PKCreditBalanceDetailsViewController *v20;
  id v21;
  id *p_account;
  id *p_accountUserCollection;
  uint64_t v24;
  NSSet *physicalCards;
  id *p_statement;
  id v27;
  uint64_t v28;
  PKDashboardBalanceSummaryItem *accountMergingItem;
  void *v30;
  uint64_t v31;
  PKCreditAccountSummary *accountSummary;
  void *v33;
  void *v34;
  uint64_t v35;
  PKCreditAccountStatement *previousStatement;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  PKDashboardBalanceSummaryItem *installmentBalanceSummaryItem;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  NSArray *spendLimitItems;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  NSArray *sectionMap;
  PKDashboardBalancePresenter *v54;
  PKDashboardBalancePresenter *balancePresenter;
  PKDashboardBalanceSummaryItemPresenter *v56;
  PKDashboardBalanceSummaryItemPresenter *balanceSummaryItemPresenter;
  PKDashboardBalanceItem *v58;
  PKDashboardBalanceItem *balanceItem;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  PKDashboardBalanceItem *v65;
  void *v66;
  void *v67;
  void *v68;
  NSDecimalNumber *v69;
  PKCreditAccountSummary *v70;
  void *v71;
  NSDecimalNumber *v72;
  void *v73;
  void *v74;
  void *v75;
  PKDashboardBalanceItem *v76;
  NSString *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  PKDashboardBalanceItem *v86;
  void *v87;
  NSDecimalNumber *pageTagForAnalyticsReporting;
  NSString *v89;
  void *v90;
  PKDashboardBalanceItem *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void (**v96)(void *, void *, const __CFString *);
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  PKDashboardBalanceItem *v101;
  void *v102;
  uint64_t v103;
  PKDashboardBalanceSummaryItem *statementDownloadSummaryItem;
  uint64_t v105;
  PKDashboardBalanceSummaryItem *exportTransactionDataSummaryItem;
  id v107;
  uint64_t v108;
  NSArray *buttonItems;
  id *p_statements;
  void *v111;
  PKDashboardBalanceItem *v112;
  void *v113;
  PKDashboardBalanceItem *v114;
  void *v115;
  void *v116;
  PKDashboardBalanceItem *v117;
  void *v118;
  void *v119;
  void *v120;
  PKDashboardBalanceItem *v121;
  void *v122;
  int v123;
  int v124;
  NSDecimalNumber *v125;
  NSDecimalNumber *v126;
  void *v127;
  int v128;
  PKDashboardBalanceItem *v129;
  void *v130;
  void *v131;
  NSString *v132;
  uint64_t v133;
  PKDashboardBalanceSummaryItem *lastStatementSummaryItem;
  PKDashboardBalanceSummaryItem *v135;
  void *v136;
  PKDashboardBalanceSummaryItem *v137;
  void *v138;
  uint64_t v139;
  PKDashboardBalanceSummaryItem *currentSpendingSummaryItem;
  uint64_t v141;
  PKDashboardBalanceSummaryItem *interestSummaryItem;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t i;
  void *v152;
  void *v153;
  void *v154;
  int v155;
  void *v156;
  void *v157;
  uint64_t v158;
  NSArray *mergeBalances;
  PKCreditAccountSummary *v160;
  void *v161;
  void *v162;
  int v163;
  NSArray *v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t j;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  NSArray *usageItems;
  void *v177;
  PKDashboardBalanceSummaryItem **v178;
  PKCreditAccountSummary *v179;
  void *v180;
  void *v181;
  uint64_t v182;
  PKDashboardBalanceSummaryItem *v183;
  void *v184;
  void *v185;
  char v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t k;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  NSArray *v198;
  uint64_t v199;
  uint64_t v200;
  PKDashboardBalanceSummaryItem **p_paymentsSummaryItem;
  PKDashboardBalanceSummaryItem *paymentsSummaryItem;
  uint64_t v203;
  PKDashboardBalanceSummaryItem *creditsSummaryItem;
  id *p_usageItems;
  uint64_t v206;
  NSArray *v207;
  uint64_t v208;
  PKDashboardBalanceSummaryItem *paymentsAndCreditsSummaryItem;
  uint64_t v210;
  id v211;
  uint64_t v212;
  PKDashboardBalanceSummaryItem *dailyCashSummaryItem;
  uint64_t v214;
  PKDashboardBalanceSummaryItem *creditLimitSummaryItem;
  uint64_t v216;
  PKDashboardBalanceSummaryItem *totalBalanceSummaryItem;
  uint64_t v218;
  PKDashboardBalanceSummaryItem *availableCreditSummaryItem;
  id v220;
  uint64_t v221;
  NSArray *totalBalanceItems;
  PKDashboardTitleHeaderView *v223;
  double v224;
  double v225;
  double v226;
  double v227;
  uint64_t v228;
  PKDashboardTitleHeaderView *sampleHeaderView;
  PKDashboardFooterTextView *v230;
  PKDashboardFooterTextView *sampleFooterView;
  uint64_t v232;
  PKBalanceSummaryFetcher *fetcher;
  NSDateFormatter *v234;
  NSDateFormatter *monthYearFormatter;
  void *v236;
  void *v237;
  uint64_t v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  NSDecimalNumber *v244;
  void *v245;
  id *v246;
  id v247;
  NSDecimalNumber *v248;
  void *v249;
  id v250;
  _BOOL4 v251;
  id v252;
  id v253;
  id v254;
  id v255;
  id v256;
  id v257;
  id obj;
  id v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  _QWORD aBlock[4];
  id v273;
  objc_super v274;
  _QWORD v275[2];
  _QWORD v276[3];
  _BYTE v277[128];
  PKDashboardBalanceSummaryItem *v278;
  _QWORD v279[2];
  _BYTE v280[128];
  _BYTE v281[128];
  uint64_t v282;

  v282 = *MEMORY[0x1E0C80C00];
  v257 = a4;
  obj = a5;
  v256 = a5;
  v255 = a6;
  v259 = a7;
  v254 = a8;
  v18 = a9;
  v253 = a10;
  v252 = a11;
  v19 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v274.receiver = self;
  v274.super_class = (Class)PKCreditBalanceDetailsViewController;
  v20 = -[PKCreditBalanceDetailsViewController initWithCollectionViewLayout:](&v274, sel_initWithCollectionViewLayout_, v19);

  if (v20)
  {
    v20->_style = a3;
    objc_storeStrong((id *)&v20->_transactionSourceCollection, a4);
    v21 = a7;
    p_account = (id *)&v20->_account;
    objc_storeStrong((id *)&v20->_account, v21);
    p_accountUserCollection = (id *)&v20->_accountUserCollection;
    objc_storeStrong((id *)&v20->_accountUserCollection, a8);
    v24 = objc_msgSend(v18, "copy");
    physicalCards = v20->_physicalCards;
    v20->_physicalCards = (NSSet *)v24;

    p_statement = (id *)&v20->_statement;
    objc_storeStrong((id *)&v20->_statement, a10);
    objc_storeStrong((id *)&v20->_statements, a11);
    objc_storeStrong((id *)&v20->_webService, a6);
    v20->_feature = -[PKAccount feature](v20->_account, "feature");
    objc_storeStrong((id *)&v20->_familyCollection, obj);
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PKAccount stateReason](v20->_account, "stateReason");
    if (!PKAccountStateReasonIsInMerge()
      || *p_statement
      || (-[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 17),
          v28 = objc_claimAutoreleasedReturnValue(),
          accountMergingItem = v20->_accountMergingItem,
          v20->_accountMergingItem = (PKDashboardBalanceSummaryItem *)v28,
          accountMergingItem,
          objc_msgSend(v27, "addObject:", &unk_1E3FAD0A8),
          *p_statement))
    {
      objc_msgSend(v27, "addObject:", &unk_1E3FAD0C0);
    }
    v251 = -[PKCreditBalanceDetailsViewController _statementIsFromMonthOfMerge](v20, "_statementIsFromMonthOfMerge");
    if (v251)
      objc_msgSend(v27, "addObject:", &unk_1E3FAD0D8);
    v250 = v18;
    if (objc_msgSend(*p_account, "accessLevel") == 1)
      objc_msgSend(v27, "addObject:", &unk_1E3FAD0F0);
    v246 = (id *)&v20->_statement;
    if (*p_statement)
    {
      objc_msgSend(v27, "addObjectsFromArray:", &unk_1E3FAE6F8);
    }
    else
    {
      objc_msgSend(*p_account, "creditDetails");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "accountSummary");
      v31 = objc_claimAutoreleasedReturnValue();
      accountSummary = v20->_accountSummary;
      v20->_accountSummary = (PKCreditAccountSummary *)v31;

      objc_msgSend(*p_account, "creditDetails");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "accountSummary");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "currentStatement");
      v35 = objc_claimAutoreleasedReturnValue();
      previousStatement = v20->_previousStatement;
      v20->_previousStatement = (PKCreditAccountStatement *)v35;

      objc_msgSend(*p_account, "creditDetails");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "accountSummary");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "installmentBalance");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v39, "compare:", v40);

        if (v41 == 1)
        {
          objc_msgSend(v27, "addObject:", &unk_1E3FAD108);
          -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 11);
          v42 = objc_claimAutoreleasedReturnValue();
          installmentBalanceSummaryItem = v20->_installmentBalanceSummaryItem;
          v20->_installmentBalanceSummaryItem = (PKDashboardBalanceSummaryItem *)v42;

        }
      }
      -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 15);
      v44 = objc_claimAutoreleasedReturnValue();
      -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 16);
      v45 = objc_claimAutoreleasedReturnValue();
      if (v44 | v45)
      {
        objc_msgSend(v27, "addObject:", &unk_1E3FAD120);
        v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v46, "safelyAddObject:", v45);
        objc_msgSend(v46, "safelyAddObject:", v44);
        v47 = objc_msgSend(v46, "copy");
        spendLimitItems = v20->_spendLimitItems;
        v20->_spendLimitItems = (NSArray *)v47;

      }
      objc_msgSend(*p_accountUserCollection, "currentAccountUser");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*p_account, "accessLevel") == 1
        || (objc_msgSend(v49, "preferences"),
            v50 = (void *)objc_claimAutoreleasedReturnValue(),
            v51 = objc_msgSend(v50, "showAvailableCredit"),
            v50,
            p_account = (id *)&v20->_account,
            v51))
      {
        objc_msgSend(v27, "addObject:", &unk_1E3FAD138);
      }

    }
    v52 = objc_msgSend(v27, "copy");
    sectionMap = v20->_sectionMap;
    v20->_sectionMap = (NSArray *)v52;

    v20->_numberOfStaticSections = -[NSArray count](v20->_sectionMap, "count");
    v54 = objc_alloc_init(PKDashboardBalancePresenter);
    balancePresenter = v20->_balancePresenter;
    v20->_balancePresenter = v54;

    -[PKDashboardBalancePresenter setCellStyle:](v20->_balancePresenter, "setCellStyle:", v20->_style);
    v56 = objc_alloc_init(PKDashboardBalanceSummaryItemPresenter);
    balanceSummaryItemPresenter = v20->_balanceSummaryItemPresenter;
    v20->_balanceSummaryItemPresenter = v56;

    -[PKDashboardBalanceSummaryItemPresenter setCellStyle:](v20->_balanceSummaryItemPresenter, "setCellStyle:", v20->_style);
    v58 = objc_alloc_init(PKDashboardBalanceItem);
    balanceItem = v20->_balanceItem;
    v20->_balanceItem = v58;

    v249 = v27;
    if (!v20->_accountSummary)
    {
      objc_msgSend(*p_statement, "totalBalance");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v67;
      if (v67)
      {
        v69 = v67;
      }
      else
      {
        objc_msgSend(*p_statement, "statementBalance");
        v69 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      }
      pageTagForAnalyticsReporting = v69;

      objc_msgSend(*p_statement, "currencyCode");
      v89 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(pageTagForAnalyticsReporting, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      v91 = v20->_balanceItem;
      objc_msgSend(v90, "formattedStringValue");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardBalanceItem setBalance:](v91, "setBalance:", v92);

      v93 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(*p_account, "creditDetails");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "productTimeZone");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setTimeZone:", v95);

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __183__PKCreditBalanceDetailsViewController_initWithStyle_transactionSourceCollection_familyCollection_webService_account_accountUserCollection_physicalCards_statement_previousStatements___block_invoke;
      aBlock[3] = &unk_1E3E6A7C0;
      v273 = v93;
      v247 = v93;
      v96 = (void (**)(void *, void *, const __CFString *))_Block_copy(aBlock);
      objc_msgSend(*v246, "openingDate");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v96[2](v96, v97, CFSTR("MMM d"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*v246, "closingDate");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v96[2](v96, v99, CFSTR("MMM d yyyy"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      v101 = v20->_balanceItem;
      PKLocalizedFeatureString();
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardBalanceItem setTitle:](v101, "setTitle:", v102, v98, v100);

      -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 6);
      v103 = objc_claimAutoreleasedReturnValue();
      statementDownloadSummaryItem = v20->_statementDownloadSummaryItem;
      v20->_statementDownloadSummaryItem = (PKDashboardBalanceSummaryItem *)v103;

      -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 7);
      v105 = objc_claimAutoreleasedReturnValue();
      exportTransactionDataSummaryItem = v20->_exportTransactionDataSummaryItem;
      v20->_exportTransactionDataSummaryItem = (PKDashboardBalanceSummaryItem *)v105;

      v107 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v107, "safelyAddObject:", v20->_statementDownloadSummaryItem);
      objc_msgSend(v107, "safelyAddObject:", v20->_exportTransactionDataSummaryItem);
      v108 = objc_msgSend(v107, "copy");
      buttonItems = v20->_buttonItems;
      v20->_buttonItems = (NSArray *)v108;

      objc_storeStrong((id *)&v20->_pageTagForAnalyticsReporting, (id)*MEMORY[0x1E0D68A00]);
      p_account = (id *)&v20->_account;

      p_statements = (id *)&v20->_statements;
LABEL_54:

      if (objc_msgSend(*p_statements, "count"))
      {
        -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 1);
        v133 = objc_claimAutoreleasedReturnValue();
        lastStatementSummaryItem = v20->_lastStatementSummaryItem;
        v20->_lastStatementSummaryItem = (PKDashboardBalanceSummaryItem *)v133;

        v135 = v20->_lastStatementSummaryItem;
        objc_msgSend(*p_statements, "objectAtIndex:", 0);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardBalanceSummaryItem setStatement:](v135, "setStatement:", v136);

        if (!objc_msgSend(*p_statements, "count"))
          goto LABEL_58;
        v137 = v20->_lastStatementSummaryItem;
        objc_msgSend(*p_statements, "subarrayWithRange:", 1, objc_msgSend(*p_statements, "count") - 1);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardBalanceSummaryItem setStatements:](v137, "setStatements:", v138);
      }
      else
      {
        v179 = v20->_accountSummary;
        if (!v179)
        {
LABEL_58:
          -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 3);
          v139 = objc_claimAutoreleasedReturnValue();
          currentSpendingSummaryItem = v20->_currentSpendingSummaryItem;
          v20->_currentSpendingSummaryItem = (PKDashboardBalanceSummaryItem *)v139;

          -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 4);
          v141 = objc_claimAutoreleasedReturnValue();
          interestSummaryItem = v20->_interestSummaryItem;
          v20->_interestSummaryItem = (PKDashboardBalanceSummaryItem *)v141;

          if (v251)
          {
            objc_msgSend(*p_account, "creditDetails");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "accountSummary");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v144, "mergeSummary");
            v145 = (void *)objc_claimAutoreleasedReturnValue();

            v146 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v268 = 0u;
            v269 = 0u;
            v270 = 0u;
            v271 = 0u;
            objc_msgSend(v145, "accountDetails");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v268, v281, 16);
            if (v148)
            {
              v149 = v148;
              v150 = *(_QWORD *)v269;
              do
              {
                for (i = 0; i != v149; ++i)
                {
                  if (*(_QWORD *)v269 != v150)
                    objc_enumerationMutation(v147);
                  v152 = *(void **)(*((_QWORD *)&v268 + 1) + 8 * i);
                  -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 18);
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v153, "setMergeSummaryAccountDetails:", v152);
                  objc_msgSend(v152, "ownerAltDSID");
                  v154 = (void *)objc_claimAutoreleasedReturnValue();
                  v155 = PKAltDSIDIsCurrentUser();

                  if (v155)
                    objc_msgSend(v146, "insertObject:atIndex:", v153, 0);
                  else
                    objc_msgSend(v146, "addObject:", v153);

                }
                v149 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v268, v281, 16);
              }
              while (v149);
            }

            -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 18);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "mergeDate");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "setMergeDate:", v157);

            objc_msgSend(v146, "insertObject:atIndex:", v156, 0);
            v158 = objc_msgSend(v146, "copy");
            mergeBalances = v20->_mergeBalances;
            v20->_mergeBalances = (NSArray *)v158;

            p_account = (id *)&v20->_account;
          }
          v160 = v20->_accountSummary;
          if (v160)
          {
            -[PKCreditAccountSummary mergeSummary](v160, "mergeSummary");
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            if (v161)
            {
              objc_msgSend(*p_account, "creditDetails");
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              v163 = objc_msgSend(v162, "isInMonthOfMerge");

              if (v163)
              {
                v164 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v264 = 0u;
                v265 = 0u;
                v266 = 0u;
                v267 = 0u;
                objc_msgSend(v161, "accountDetails");
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v264, v280, 16);
                if (v166)
                {
                  v167 = v166;
                  v168 = *(_QWORD *)v265;
                  do
                  {
                    for (j = 0; j != v167; ++j)
                    {
                      if (*(_QWORD *)v265 != v168)
                        objc_enumerationMutation(v165);
                      v170 = *(void **)(*((_QWORD *)&v264 + 1) + 8 * j);
                      objc_msgSend(v170, "statementBalance");
                      v171 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v171)
                      {
                        -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 0);
                        v172 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v172, "setMergeSummaryAccountDetails:", v170);
                        objc_msgSend(v161, "mergeDate");
                        v173 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v172, "setMergeDate:", v173);

                        objc_msgSend(v170, "ownerAltDSID");
                        v174 = (void *)objc_claimAutoreleasedReturnValue();
                        LODWORD(v173) = PKAltDSIDIsCurrentUser();

                        if ((_DWORD)v173)
                          -[NSArray insertObject:atIndex:](v164, "insertObject:atIndex:", v172, 0);
                        else
                          -[NSArray addObject:](v164, "addObject:", v172);

                      }
                    }
                    v167 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v264, v280, 16);
                  }
                  while (v167);
                }

                -[NSArray addObject:](v164, "addObject:", v20->_currentSpendingSummaryItem);
                v175 = -[NSArray copy](v164, "copy");
                usageItems = v20->_usageItems;
                v20->_usageItems = (NSArray *)v175;
LABEL_115:

                -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 9);
                v200 = objc_claimAutoreleasedReturnValue();
                p_paymentsSummaryItem = &v20->_paymentsSummaryItem;
                paymentsSummaryItem = v20->_paymentsSummaryItem;
                v20->_paymentsSummaryItem = (PKDashboardBalanceSummaryItem *)v200;

                -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 8);
                v203 = objc_claimAutoreleasedReturnValue();
                creditsSummaryItem = v20->_creditsSummaryItem;
                v20->_creditsSummaryItem = (PKDashboardBalanceSummaryItem *)v203;

                if (v20->_paymentsSummaryItem && v20->_creditsSummaryItem)
                {
                  p_usageItems = (id *)&v20->_usageItems;
                  -[NSArray arrayByAddingObject:](v20->_usageItems, "arrayByAddingObject:");
                  v206 = objc_claimAutoreleasedReturnValue();
                  v207 = v20->_usageItems;
                  v20->_usageItems = (NSArray *)v206;

                }
                else
                {
                  -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 5);
                  v208 = objc_claimAutoreleasedReturnValue();
                  p_paymentsSummaryItem = &v20->_paymentsAndCreditsSummaryItem;
                  paymentsAndCreditsSummaryItem = v20->_paymentsAndCreditsSummaryItem;
                  v20->_paymentsAndCreditsSummaryItem = (PKDashboardBalanceSummaryItem *)v208;

                  p_usageItems = (id *)&v20->_usageItems;
                }
                objc_msgSend(*p_usageItems, "arrayByAddingObject:", *p_paymentsSummaryItem);
                v210 = objc_claimAutoreleasedReturnValue();
                v211 = *p_usageItems;
                *p_usageItems = (id)v210;

                -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 10);
                v212 = objc_claimAutoreleasedReturnValue();
                dailyCashSummaryItem = v20->_dailyCashSummaryItem;
                v20->_dailyCashSummaryItem = (PKDashboardBalanceSummaryItem *)v212;

                -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 12);
                v214 = objc_claimAutoreleasedReturnValue();
                creditLimitSummaryItem = v20->_creditLimitSummaryItem;
                v20->_creditLimitSummaryItem = (PKDashboardBalanceSummaryItem *)v214;

                -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 13);
                v216 = objc_claimAutoreleasedReturnValue();
                totalBalanceSummaryItem = v20->_totalBalanceSummaryItem;
                v20->_totalBalanceSummaryItem = (PKDashboardBalanceSummaryItem *)v216;

                -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 14);
                v218 = objc_claimAutoreleasedReturnValue();
                availableCreditSummaryItem = v20->_availableCreditSummaryItem;
                v20->_availableCreditSummaryItem = (PKDashboardBalanceSummaryItem *)v218;

                v220 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v220, "safelyAddObject:", v20->_creditLimitSummaryItem);
                objc_msgSend(v220, "safelyAddObject:", v20->_totalBalanceSummaryItem);
                objc_msgSend(v220, "safelyAddObject:", v20->_availableCreditSummaryItem);
                v221 = objc_msgSend(v220, "copy");
                totalBalanceItems = v20->_totalBalanceItems;
                v20->_totalBalanceItems = (NSArray *)v221;

                v223 = [PKDashboardTitleHeaderView alloc];
                v224 = *MEMORY[0x1E0C9D648];
                v225 = *(double *)(MEMORY[0x1E0C9D648] + 8);
                v226 = *(double *)(MEMORY[0x1E0C9D648] + 16);
                v227 = *(double *)(MEMORY[0x1E0C9D648] + 24);
                v228 = -[PKDashboardTitleHeaderView initWithFrame:](v223, "initWithFrame:", *MEMORY[0x1E0C9D648], v225, v226, v227);
                sampleHeaderView = v20->_sampleHeaderView;
                v20->_sampleHeaderView = (PKDashboardTitleHeaderView *)v228;

                v230 = -[PKDashboardFooterTextView initWithFrame:]([PKDashboardFooterTextView alloc], "initWithFrame:", v224, v225, v226, v227);
                sampleFooterView = v20->_sampleFooterView;
                v20->_sampleFooterView = v230;

                v232 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66BB8]), "initWithTransactionSourceCollection:account:", v20->_transactionSourceCollection, v259);
                fetcher = v20->_fetcher;
                v20->_fetcher = (PKBalanceSummaryFetcher *)v232;

                v234 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
                monthYearFormatter = v20->_monthYearFormatter;
                v20->_monthYearFormatter = v234;

                -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v20->_monthYearFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM yyyy"));
                objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
                v236 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v236, "registerObserver:", v20);

                -[PKCreditBalanceDetailsViewController navigationItem](v20, "navigationItem");
                v237 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v237, "pkui_setupScrollEdgeChromelessAppearance");
                objc_msgSend(v237, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
                if (v20->_style)
                  v238 = 2;
                else
                  v238 = 1;
                objc_msgSend(v237, "setLargeTitleDisplayMode:", v238);
                objc_msgSend(v237, "setBackButtonDisplayMode:", 2);
                if (v20->_accountSummary)
                {
                  PKLocalizedFeatureString();
                  v239 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v237, "setTitle:", v239);
                }
                else
                {
                  if (!*v246)
                  {
LABEL_127:

                    v18 = v250;
                    goto LABEL_128;
                  }
                  objc_msgSend(*v246, "openingDate");
                  v240 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*v246, "closingDate");
                  v241 = (void *)objc_claimAutoreleasedReturnValue();
                  PKDatesMidpoint();
                  v239 = (void *)objc_claimAutoreleasedReturnValue();

                  -[NSDateFormatter stringFromDate:](v20->_monthYearFormatter, "stringFromDate:", v239);
                  v242 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v237, "setTitle:", v242);

                }
                goto LABEL_127;
              }
            }
            if (v20->_lastStatementSummaryItem)
            {
              v279[0] = v20->_lastStatementSummaryItem;
              v279[1] = v20->_currentSpendingSummaryItem;
              v177 = (void *)MEMORY[0x1E0C99D20];
              v178 = (PKDashboardBalanceSummaryItem **)v279;
LABEL_112:
              v199 = 2;
              goto LABEL_113;
            }
            v278 = v20->_currentSpendingSummaryItem;
            v177 = (void *)MEMORY[0x1E0C99D20];
            v178 = &v278;
            v199 = 1;
          }
          else
          {
            objc_msgSend(*p_account, "creditDetails");
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v184, "accountSummary");
            v185 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v185, "mergeSummary");
            v161 = (void *)objc_claimAutoreleasedReturnValue();

            v186 = !v251;
            if (!v161)
              v186 = 1;
            if ((v186 & 1) == 0)
            {
              v164 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v260 = 0u;
              v261 = 0u;
              v262 = 0u;
              v263 = 0u;
              objc_msgSend(v161, "accountDetails");
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              v188 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v260, v277, 16);
              if (v188)
              {
                v189 = v188;
                v190 = *(_QWORD *)v261;
                do
                {
                  for (k = 0; k != v189; ++k)
                  {
                    if (*(_QWORD *)v261 != v190)
                      objc_enumerationMutation(v187);
                    v192 = *(void **)(*((_QWORD *)&v260 + 1) + 8 * k);
                    objc_msgSend(v192, "statementBalance");
                    v193 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v193)
                    {
                      -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 0);
                      v194 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v194, "setMergeSummaryAccountDetails:", v192);
                      objc_msgSend(v161, "mergeDate");
                      v195 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v194, "setMergeDate:", v195);

                      -[NSArray firstObject](v20->_statements, "firstObject");
                      v196 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v194, "setStatement:", v196);

                      objc_msgSend(v192, "ownerAltDSID");
                      v197 = (void *)objc_claimAutoreleasedReturnValue();
                      LODWORD(v196) = PKAltDSIDIsCurrentUser();

                      if ((_DWORD)v196)
                        -[NSArray insertObject:atIndex:](v164, "insertObject:atIndex:", v194, 0);
                      else
                        -[NSArray addObject:](v164, "addObject:", v194);

                    }
                  }
                  v189 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v260, v277, 16);
                }
                while (v189);
              }

              -[NSArray addObject:](v164, "addObject:", v20->_currentSpendingSummaryItem);
              -[NSArray addObject:](v164, "addObject:", v20->_interestSummaryItem);
              v198 = (NSArray *)-[NSArray copy](v164, "copy");
              goto LABEL_114;
            }
            if (!v20->_lastStatementSummaryItem)
            {
              v275[0] = v20->_currentSpendingSummaryItem;
              v275[1] = v20->_interestSummaryItem;
              v177 = (void *)MEMORY[0x1E0C99D20];
              v178 = (PKDashboardBalanceSummaryItem **)v275;
              goto LABEL_112;
            }
            v276[0] = v20->_lastStatementSummaryItem;
            v276[1] = v20->_currentSpendingSummaryItem;
            v276[2] = v20->_interestSummaryItem;
            v177 = (void *)MEMORY[0x1E0C99D20];
            v178 = (PKDashboardBalanceSummaryItem **)v276;
            v199 = 3;
          }
LABEL_113:
          objc_msgSend(v177, "arrayWithObjects:count:", v178, v199);
          v198 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
          v164 = v198;
LABEL_114:
          usageItems = v20->_usageItems;
          v20->_usageItems = v198;
          goto LABEL_115;
        }
        -[PKCreditAccountSummary currentStatement](v179, "currentStatement");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = v180;
        if (v180)
        {
          objc_msgSend(v180, "identifier");
          v181 = (void *)objc_claimAutoreleasedReturnValue();

          if (v181)
          {
            -[PKCreditBalanceDetailsViewController _createSummaryItemOfType:](v20, "_createSummaryItemOfType:", 0);
            v182 = objc_claimAutoreleasedReturnValue();
            v183 = v20->_lastStatementSummaryItem;
            v20->_lastStatementSummaryItem = (PKDashboardBalanceSummaryItem *)v182;

            -[PKDashboardBalanceSummaryItem setStatement:](v20->_lastStatementSummaryItem, "setStatement:", v138);
          }
        }
      }

      goto LABEL_58;
    }
    if (objc_msgSend(*p_account, "accessLevel") == 1)
    {
      objc_msgSend(*p_account, "creditDetails");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "cardBalance");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v61, "amount");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v62, "compare:", v63);

      if (v64 == -1)
      {
        objc_msgSend(v61, "negativeValue");
        v111 = (void *)objc_claimAutoreleasedReturnValue();

        v112 = v20->_balanceItem;
        objc_msgSend(v111, "formattedStringValue");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v66);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardBalanceItem setBalance:](v112, "setBalance:", v113);

        v61 = v111;
      }
      else
      {
        v65 = v20->_balanceItem;
        objc_msgSend(v61, "formattedStringValue");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardBalanceItem setBalance:](v65, "setBalance:", v66);
      }

      v114 = v20->_balanceItem;
      PKLocalizedFeatureString();
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardBalanceItem setTitle:](v114, "setTitle:", v115);

      -[PKCreditAccountSummary availableCredit](v20->_accountSummary, "availableCredit");
      v72 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_account, "creditDetails");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "currencyCode");
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v72 || !v79)
      {
        p_statements = (id *)&v20->_statements;
LABEL_53:

        v132 = (NSString *)(id)*MEMORY[0x1E0D689B8];
        pageTagForAnalyticsReporting = (NSDecimalNumber *)v20->_pageTagForAnalyticsReporting;
        v20->_pageTagForAnalyticsReporting = v132;
        goto LABEL_54;
      }
      PKCurrencyAmountCreate(v72, (NSString *)v79);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = v20->_balanceItem;
      objc_msgSend(v259, "feature");
      objc_msgSend(v81, "formattedStringValue");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardBalanceItem setAvailableCredit:](v117, "setAvailableCredit:", v119, v118);
LABEL_52:

      p_statements = (id *)&v20->_statements;
      p_account = (id *)&v20->_account;
      goto LABEL_53;
    }
    objc_msgSend(*p_accountUserCollection, "currentAccountUser");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v20->_accountSummary;
    objc_msgSend(v61, "altDSID");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCreditAccountSummary accountUserActivityForAccountUserAltDSID:](v70, "accountUserActivityForAccountUserAltDSID:", v71);
    v72 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "components:fromDate:", 8, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "month");

    v76 = v20->_balanceItem;
    PKGregorianMonthSpecificLocalizedStringKeyForKey();
    v77 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardBalanceItem setTitle:](v76, "setTitle:", v78);

    -[NSDecimalNumber totalSpending](v72, "totalSpending");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_account, "creditDetails");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "currencyCode");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (v79 && v81)
    {
      PKCurrencyAmountMake();
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "amount");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v83, "compare:", v84);

      if (v85 == -1)
      {
        objc_msgSend(v82, "negativeValue");
        v120 = (void *)objc_claimAutoreleasedReturnValue();

        v121 = v20->_balanceItem;
        objc_msgSend(v120, "formattedStringValue");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v87);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardBalanceItem setBalance:](v121, "setBalance:", v122);

        v82 = v120;
      }
      else
      {
        v86 = v20->_balanceItem;
        objc_msgSend(v82, "formattedStringValue");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardBalanceItem setBalance:](v86, "setBalance:", v87);
      }

    }
    objc_msgSend(v61, "preferences");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v118, "monthlySpendLimitEnabled");
    objc_msgSend(v118, "monthlySpendLimitAmount");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v118, "showAvailableCredit");
    -[PKCreditAccountSummary availableCredit](v20->_accountSummary, "availableCredit");
    v125 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    if (v123 && v119 && v81)
    {
      v244 = v125;
      v245 = v79;
      v248 = v72;
      -[NSDecimalNumber remainingMonthlySpendWithLimit:](v72, "remainingMonthlySpendWithLimit:", v119);
      v126 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v126, (NSString *)v81);
      v127 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v125)
        v128 = v124;
      else
        v128 = 0;
      if (v128 != 1 || !v81)
        goto LABEL_51;
      v244 = v125;
      v245 = v79;
      v248 = v72;
      PKCurrencyAmountCreate(v125, (NSString *)v81);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v129 = v20->_balanceItem;
    objc_msgSend(v259, "feature");
    objc_msgSend(v127, "formattedStringValue");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardBalanceItem setAvailableCredit:](v129, "setAvailableCredit:", v131, v130);

    v72 = v248;
    v125 = v244;
    v79 = v245;
LABEL_51:

    goto LABEL_52;
  }
LABEL_128:

  return v20;
}

id __183__PKCreditBalanceDetailsViewController_initWithStyle_transactionSourceCollection_familyCollection_webService_account_accountUserCollection_physicalCards_statement_previousStatements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;

  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "setLocalizedDateFormatFromTemplate:", a3);
    objc_msgSend(*(id *)(a1 + 32), "stringFromDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKCreditBalanceDetailsViewController;
  -[PKCreditBalanceDetailsViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKCreditBalanceDetailsViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PKDashboardBalanceSummaryItemPresenterIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PKDashboardStatementSummaryItemPresenterIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PKDashboardStatementDownloadSummaryItemPresenterIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PKDashboardExportStatementDataSummaryItemPresenterIdentifier"));
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("titleIdentifier"));
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A0], CFSTR("footerIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PKDashboardBalancePresenterIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("centeredTextIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PKDashboardTitleMessageSummaryItemPresenterIdentifier"));
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 1);
  objc_msgSend(v3, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v3, "setBounces:", 1);
  +[PKDashboardViewController backgroundColor](PKDashboardViewController, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PKCreditBalanceDetailsViewController _reloadData](self, "_reloadData");
  -[PKCreditBalanceDetailsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67A58]);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKCreditBalanceDetailsViewController;
  -[PKCreditBalanceDetailsViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (!self->_style)
  {
    -[PKCreditBalanceDetailsViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrefersLargeTitles:", 1);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  NSString *pageTagForAnalyticsReporting;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKCreditBalanceDetailsViewController;
  -[PKCreditBalanceDetailsViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  v4 = *MEMORY[0x1E0D68C50];
  v5 = *MEMORY[0x1E0D68F50];
  v11[0] = *MEMORY[0x1E0D68AA0];
  v11[1] = v5;
  pageTagForAnalyticsReporting = self->_pageTagForAnalyticsReporting;
  v12[0] = v4;
  v12[1] = pageTagForAnalyticsReporting;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D66A58];
  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportDashboardEventIfNecessary:forPass:", v7, v9);

}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  NSString *pageTagForAnalyticsReporting;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKCreditBalanceDetailsViewController;
  -[PKCreditBalanceDetailsViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  v4 = *MEMORY[0x1E0D68C58];
  v5 = *MEMORY[0x1E0D68F50];
  v11[0] = *MEMORY[0x1E0D68AA0];
  v11[1] = v5;
  pageTagForAnalyticsReporting = self->_pageTagForAnalyticsReporting;
  v12[0] = v4;
  v12[1] = pageTagForAnalyticsReporting;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D66A58];
  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportDashboardEventIfNecessary:forPass:", v7, v9);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCreditBalanceDetailsViewController;
  -[PKCreditBalanceDetailsViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKCreditBalanceDetailsViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCreditBalanceDetailsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKCreditBalanceDetailsViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return -[NSArray count](self->_sectionMap, "count", a3);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t result;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;

  switch(-[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:", a4))
  {
    case 0uLL:
    case 3uLL:
    case 5uLL:
    case 9uLL:
      return 1;
    case 1uLL:
      v7 = 1240;
      goto LABEL_12;
    case 2uLL:
      v7 = 1248;
      goto LABEL_12;
    case 4uLL:
      v7 = 1216;
      goto LABEL_12;
    case 6uLL:
      if (!-[NSArray count](self->_sortedYears, "count"))
        return 1;
      -[NSArray objectAtIndexedSubscript:](self->_sortedYears, "objectAtIndexedSubscript:", a4 - self->_numberOfStaticSections);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](self->_statementsByYear, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      return v10;
    case 7uLL:
      v7 = 1272;
      goto LABEL_12;
    case 8uLL:
      v7 = 1224;
LABEL_12:
      result = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v7), "count");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *balancePresenter;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;

  v6 = a3;
  v7 = a4;
  v8 = -[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v7, "section"));
  v9 = objc_msgSend(v7, "row");
  switch(v8)
  {
    case 0uLL:
      balancePresenter = self->_balancePresenter;
      v11 = 1120;
      goto LABEL_19;
    case 1uLL:
      v13 = 1240;
      -[NSArray objectAtIndexedSubscript:](self->_mergeBalances, "objectAtIndexedSubscript:", v9);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2uLL:
      v13 = 1248;
      goto LABEL_12;
    case 3uLL:
      v15 = &OBJC_IVAR___PKCreditBalanceDetailsViewController__installmentBalanceSummaryItem;
      goto LABEL_18;
    case 4uLL:
      v13 = 1216;
      goto LABEL_12;
    case 5uLL:
      balancePresenter = self->_balanceSummaryItemPresenter;
      v11 = 1176;
      goto LABEL_19;
    case 6uLL:
      if (-[NSArray count](self->_sortedYears, "count"))
      {
        -[NSArray objectAtIndexedSubscript:](self->_sortedYears, "objectAtIndexedSubscript:", objc_msgSend(v7, "section") - self->_numberOfStaticSections);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_statementsByYear, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKCreditBalanceDetailsViewController _summaryItemForIndexPath:](self, "_summaryItemForIndexPath:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardBalanceSummaryItemPresenter cellForItem:inCollectionView:atIndexPath:](self->_balanceSummaryItemPresenter, "cellForItem:inCollectionView:atIndexPath:", v18, v6, v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v9 == 0;
        v20 = v9 == objc_msgSend(v17, "count") - 1;

LABEL_14:
        if (!v19)
          goto LABEL_24;
      }
      else
      {
        objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("centeredTextIdentifier"), v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKAccount feature](self->_account, "feature");
        PKLocalizedFeatureString();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTitle:", v31);

        objc_msgSend(v12, "setShowsBottomSeparator:", 0);
LABEL_20:
        v20 = 1;
        v19 = 1;
      }
      if (v20)
      {
        v21 = v12;
        v22 = 3;
        goto LABEL_23;
      }
LABEL_24:
      if (!v19)
      {
        if (!v20)
        {
LABEL_28:
          v25 = v12;
          v26 = 0;
          goto LABEL_29;
        }
        v21 = v12;
        v22 = 2;
LABEL_23:
        objc_msgSend(v21, "setMaskType:", v22);
        v23 = v12;
        v24 = 0;
        goto LABEL_30;
      }
      v25 = v12;
      v26 = 1;
LABEL_29:
      objc_msgSend(v25, "setMaskType:", v26);
      v23 = v12;
      v24 = 1;
LABEL_30:
      objc_msgSend(v23, "setShowsBottomSeparator:", v24);
      -[PKCreditBalanceDetailsViewController traitCollection](self, "traitCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "userInterfaceIdiom");

      if ((v28 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        objc_msgSend(v12, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setCornerRadius:", 4.0);

      }
      return v12;
    case 7uLL:
      v13 = 1272;
LABEL_12:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v13), "objectAtIndex:", v9);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v16 = (void *)v14;
      v19 = v9 == 0;
      v20 = v9 == objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v13), "count") - 1;
      -[PKDashboardBalanceSummaryItemPresenter cellForItem:inCollectionView:atIndexPath:](self->_balanceSummaryItemPresenter, "cellForItem:inCollectionView:atIndexPath:", v16, v6, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 8uLL:
      -[NSArray objectAtIndexedSubscript:](self->_spendLimitItems, "objectAtIndexedSubscript:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardBalanceSummaryItemPresenter cellForItem:inCollectionView:atIndexPath:](self->_balanceSummaryItemPresenter, "cellForItem:inCollectionView:atIndexPath:", v16, v6, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v9 == 0;
      v20 = v9 == -[NSArray count](self->_spendLimitItems, "count") - 1;
      goto LABEL_14;
    case 9uLL:
      v15 = &OBJC_IVAR___PKCreditBalanceDetailsViewController__accountMergingItem;
LABEL_18:
      balancePresenter = self->_balanceSummaryItemPresenter;
      v11 = *v15;
LABEL_19:
      objc_msgSend(balancePresenter, "cellForItem:inCollectionView:atIndexPath:", *(Class *)((char *)&self->super.super.super.super.isa + v11), v6, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    default:
      v12 = 0;
      goto LABEL_28;
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  PKDashboardBalanceSummaryItemPresenter *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  PKDashboardBalanceSummaryItemPresenter *balanceSummaryItemPresenter;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v7, "section"));
  if (v8 == 6)
  {
    if (-[NSArray count](self->_sortedYears, "count"))
    {
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      -[PKCreditBalanceDetailsViewController _summaryItemForIndexPath:](self, "_summaryItemForIndexPath:", v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCreditBalanceDetailsViewController navigationController](self, "navigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardBalanceSummaryItemPresenter didSelectItem:inCollectionView:atIndexPath:navigationController:canPresent:](balanceSummaryItemPresenter, "didSelectItem:inCollectionView:atIndexPath:navigationController:canPresent:", v19, v6, v7, v20, 0);

      v21 = *MEMORY[0x1E0D68C08];
      v22 = *MEMORY[0x1E0D69438];
      v28[0] = *MEMORY[0x1E0D68AA0];
      v28[1] = v22;
      v23 = *MEMORY[0x1E0D687E0];
      v29[0] = v21;
      v29[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCreditBalanceDetailsViewController _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v9);
      goto LABEL_10;
    }
  }
  else if (v8 == 7)
  {
    -[NSArray objectAtIndex:](self->_buttonItems, "objectAtIndex:", objc_msgSend(v7, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_balanceSummaryItemPresenter;
    -[PKCreditBalanceDetailsViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardBalanceSummaryItemPresenter didSelectItem:inCollectionView:atIndexPath:navigationController:canPresent:](v10, "didSelectItem:inCollectionView:atIndexPath:navigationController:canPresent:", v9, v6, v7, v11, 0);

    if (objc_msgSend(v9, "type") == 6)
    {
      v12 = *MEMORY[0x1E0D68B18];
      v13 = *MEMORY[0x1E0D68858];
      v32[0] = *MEMORY[0x1E0D68AA0];
      v32[1] = v13;
      v14 = *MEMORY[0x1E0D687D0];
      v33[0] = v12;
      v33[1] = v14;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = v33;
      v17 = v32;
LABEL_9:
      objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCreditBalanceDetailsViewController _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v27);

      goto LABEL_10;
    }
    if (objc_msgSend(v9, "type") == 7)
    {
      v24 = *MEMORY[0x1E0D68B18];
      v25 = *MEMORY[0x1E0D68858];
      v30[0] = *MEMORY[0x1E0D68AA0];
      v30[1] = v25;
      v26 = *MEMORY[0x1E0D687D8];
      v31[0] = v24;
      v31[1] = v26;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = v31;
      v17 = v30;
      goto LABEL_9;
    }
LABEL_10:

  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  char v9;
  PKDashboardBalanceSummaryItemPresenter *balanceSummaryItemPresenter;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v7, "section"));
  if (v8 > 9)
  {
    v9 = 1;
  }
  else
  {
    if (((1 << v8) & 0x33F) != 0)
      goto LABEL_3;
    if (v8 != 6)
    {
      -[NSArray objectAtIndex:](self->_buttonItems, "objectAtIndex:", objc_msgSend(v7, "row"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKDashboardBalanceSummaryItemPresenter canSelectItem:inCollectionView:atIndexPath:](self->_balanceSummaryItemPresenter, "canSelectItem:inCollectionView:atIndexPath:", v13, v6, v7);

      goto LABEL_4;
    }
    if (!-[NSArray count](self->_sortedYears, "count"))
    {
LABEL_3:
      v9 = 0;
    }
    else
    {
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      -[PKCreditBalanceDetailsViewController _summaryItemForIndexPath:](self, "_summaryItemForIndexPath:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKDashboardBalanceSummaryItemPresenter canSelectItem:inCollectionView:atIndexPath:](balanceSummaryItemPresenter, "canSelectItem:inCollectionView:atIndexPath:", v12, v6, v7);

    }
  }
LABEL_4:

  return v9;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t style;
  PKDashboardTitleHeaderView *sampleHeaderView;
  void *v16;
  double v17;
  double v18;
  double v19;
  PKDashboardTitleHeaderView *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  v7 = a3;
  if (-[PKCreditBalanceDetailsViewController _hasHeaderForSectionIndex:](self, "_hasHeaderForSectionIndex:", a5))
  {
    -[PKCreditBalanceDetailsViewController _configureHeaderView:inSectionIndex:](self, "_configureHeaderView:inSectionIndex:", self->_sampleHeaderView, a5);
    -[PKCreditBalanceDetailsViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
    v10 = v9;
    +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
    objc_msgSend(v8, "pkui_readableContentBoundsWithMargins:", 0.0, v10, 0.0, v11);
    v13 = v12;

    style = self->_style;
    sampleHeaderView = self->_sampleHeaderView;
    v16 = (void *)objc_opt_class();
    if (style)
      objc_msgSend(v16, "defaultTableHorizontalInset");
    else
      objc_msgSend(v16, "defaultHorizontalInset");
    -[PKDashboardCollectionViewCell setHorizontalInset:](sampleHeaderView, "setHorizontalInset:", v13 + v17);
    v20 = self->_sampleHeaderView;
    objc_msgSend(v7, "bounds");
    -[PKDashboardTitleHeaderView sizeThatFits:](v20, "sizeThatFits:", v21, 3.40282347e38);
    v18 = v22;
    v19 = v23;
  }
  else
  {
    v18 = *MEMORY[0x1E0C9D820];
    v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v24 = v18;
  v25 = v19;
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  PKDashboardFooterTextView *sampleFooterView;
  double v15;
  PKDashboardFooterTextView *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v7 = a3;
  if (-[PKCreditBalanceDetailsViewController _hasFooterForSectionIndex:](self, "_hasFooterForSectionIndex:", a5))
  {
    -[PKCreditBalanceDetailsViewController _configureFooterView:inSectionIndex:](self, "_configureFooterView:inSectionIndex:", self->_sampleFooterView, a5);
    -[PKCreditBalanceDetailsViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
    v10 = v9;
    +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
    objc_msgSend(v8, "pkui_readableContentBoundsWithMargins:", 0.0, v10, 0.0, v11);
    v13 = v12;

    sampleFooterView = self->_sampleFooterView;
    objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
    -[PKDashboardCollectionViewCell setHorizontalInset:](sampleFooterView, "setHorizontalInset:", v13 + v15);
    v16 = self->_sampleFooterView;
    objc_msgSend(v7, "bounds");
    -[PKDashboardFooterTextView sizeThatFits:](v16, "sizeThatFits:", v17, 3.40282347e38);
    v19 = v18;
    v21 = v20;
  }
  else
  {
    v19 = *MEMORY[0x1E0C9D820];
    v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v22 = v19;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  const __CFString *v11;
  void *v12;

  v8 = a4;
  v9 = a5;
  v10 = (id)*MEMORY[0x1E0DC48A8];
  if ((id)*MEMORY[0x1E0DC48A8] == v8)
    v11 = CFSTR("titleIdentifier");
  else
    v11 = CFSTR("footerIdentifier");
  objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v8)
  {
    -[PKCreditBalanceDetailsViewController _configureHeaderView:inSectionIndex:](self, "_configureHeaderView:inSectionIndex:", v12, objc_msgSend(v9, "section"));
  }
  else if ((id)*MEMORY[0x1E0DC48A0] == v8)
  {
    -[PKCreditBalanceDetailsViewController _configureFooterView:inSectionIndex:](self, "_configureFooterView:inSectionIndex:", v12, objc_msgSend(v9, "section"));
  }

  return v12;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v8 = *MEMORY[0x1E0DC49E8];
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v10 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (objc_msgSend(a3, "numberOfItemsInSection:", a5, a4) >= 1
    && !-[PKCreditBalanceDetailsViewController _hasFooterForSectionIndex:](self, "_hasFooterForSectionIndex:", a5))
  {
    v9 = 0.0;
    v10 = 16.0;
    v7 = 0.0;
    v8 = 0.0;
  }
  v11 = v8;
  v12 = v7;
  v13 = v10;
  v14 = v9;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *balancePresenter;
  uint64_t v12;
  double v13;
  uint64_t v14;
  PKDashboardBalanceSummaryItemPresenter *balanceSummaryItemPresenter;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  NSUInteger v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  CGSize result;

  v7 = a3;
  v8 = a5;
  v9 = -[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v8, "section"));
  v10 = objc_msgSend(v8, "row");
  switch(v9)
  {
    case 0uLL:
      balancePresenter = self->_balancePresenter;
      v12 = 1120;
      goto LABEL_17;
    case 1uLL:
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      -[NSArray objectAtIndexedSubscript:](self->_mergeBalances, "objectAtIndexedSubscript:", v10);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2uLL:
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      v17 = 1248;
      goto LABEL_12;
    case 3uLL:
      v18 = &OBJC_IVAR___PKCreditBalanceDetailsViewController__installmentBalanceSummaryItem;
      goto LABEL_16;
    case 4uLL:
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      v17 = 1216;
      goto LABEL_12;
    case 5uLL:
      balancePresenter = self->_balanceSummaryItemPresenter;
      v12 = 1176;
      goto LABEL_17;
    case 6uLL:
      v19 = -[NSArray count](self->_sortedYears, "count", v10);
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      if (v19)
      {
        -[PKCreditBalanceDetailsViewController _summaryItemForIndexPath:](self, "_summaryItemForIndexPath:", v8);
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v20 = (void *)v16;
        -[PKDashboardBalanceSummaryItemPresenter sizeForItem:inCollectionView:atIndexPath:](balanceSummaryItemPresenter, "sizeForItem:inCollectionView:atIndexPath:", v16, v7, v8);
        v13 = v21;
        v14 = v22;

      }
      else
      {
        -[PKDashboardBalanceSummaryItemPresenter sizeForItem:inCollectionView:atIndexPath:](balanceSummaryItemPresenter, "sizeForItem:inCollectionView:atIndexPath:", self->_dailyCashSummaryItem, v7, v8);
        v13 = v30;
        *(double *)&v14 = 76.0;
      }
LABEL_18:

      v28 = v13;
      v29 = *(double *)&v14;
      result.height = v29;
      result.width = v28;
      return result;
    case 7uLL:
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      v17 = 1272;
LABEL_12:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v17), "objectAtIndex:", v10);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 8uLL:
      -[NSArray objectAtIndexedSubscript:](self->_spendLimitItems, "objectAtIndexedSubscript:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardBalanceSummaryItemPresenter sizeForItem:inCollectionView:atIndexPath:](self->_balanceSummaryItemPresenter, "sizeForItem:inCollectionView:atIndexPath:", v23, v7, v8);
      v13 = v24;
      v14 = v25;

      goto LABEL_18;
    case 9uLL:
      v18 = &OBJC_IVAR___PKCreditBalanceDetailsViewController__accountMergingItem;
LABEL_16:
      balancePresenter = self->_balanceSummaryItemPresenter;
      v12 = *v18;
LABEL_17:
      objc_msgSend(balancePresenter, "sizeForItem:inCollectionView:atIndexPath:", *(Class *)((char *)&self->super.super.super.super.isa + v12), v7, v8);
      v13 = v26;
      v14 = v27;
      goto LABEL_18;
    default:
      v13 = *MEMORY[0x1E0C9D820];
      v14 = *(uint64_t *)(MEMORY[0x1E0C9D820] + 8);
      goto LABEL_18;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKCreditBalanceDetailsViewController;
  -[PKCreditBalanceDetailsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PKCreditBalanceDetailsViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)showStatement:(id)a3 style:(int64_t)a4
{
  id v6;
  void *v7;
  PKCreditBalanceDetailsViewController *v8;

  v6 = a3;
  v8 = -[PKCreditBalanceDetailsViewController initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:]([PKCreditBalanceDetailsViewController alloc], "initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:", a4, self->_transactionSourceCollection, self->_familyCollection, self->_webService, self->_account, self->_accountUserCollection, self->_physicalCards, v6, 0);

  -[PKCreditBalanceDetailsViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (unint64_t)_sectionForIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSArray objectAtIndex:](self->_sectionMap, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)_summaryItemForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PKDashboardBalanceSummaryItem *v9;
  void *v10;
  NSArray *statements;
  void *v12;
  unint64_t v13;
  void *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");

  -[NSArray objectAtIndexedSubscript:](self->_sortedYears, "objectAtIndexedSubscript:", v6 - self->_numberOfStaticSections);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_statementsByYear, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(PKDashboardBalanceSummaryItem);
  -[PKDashboardBalanceSummaryItem setAccount:](v9, "setAccount:", self->_account);
  -[PKDashboardBalanceSummaryItem setAccountUserCollection:](v9, "setAccountUserCollection:", self->_accountUserCollection);
  -[PKDashboardBalanceSummaryItem setPhysicalCards:](v9, "setPhysicalCards:", self->_physicalCards);
  -[PKDashboardBalanceSummaryItem setWebService:](v9, "setWebService:", self->_webService);
  -[PKDashboardBalanceSummaryItem setTransactionSourceCollection:](v9, "setTransactionSourceCollection:", self->_transactionSourceCollection);
  -[PKDashboardBalanceSummaryItem setFamilyCollection:](v9, "setFamilyCollection:", self->_familyCollection);
  objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardBalanceSummaryItem setStatement:](v9, "setStatement:", v10);

  if (-[NSArray count](self->_statements, "count"))
  {
    statements = self->_statements;
    -[PKDashboardBalanceSummaryItem statement](v9, "statement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSArray indexOfObject:](statements, "indexOfObject:", v12) + 1;

    if (v13 < -[NSArray count](self->_statements, "count"))
    {
      -[NSArray subarrayWithRange:](self->_statements, "subarrayWithRange:", v13, -[NSArray count](self->_statements, "count") - v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardBalanceSummaryItem setStatements:](v9, "setStatements:", v14);

    }
  }
  -[PKDashboardBalanceSummaryItem setType:](v9, "setType:", 2);

  return v9;
}

- (BOOL)_hasHeaderForSectionIndex:(unint64_t)a3
{
  return -[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:") == 6
      && self->_numberOfStaticSections == a3;
}

- (BOOL)_hasFooterForSectionIndex:(unint64_t)a3
{
  BOOL v4;
  uint64_t v5;
  PKCreditAccountSummary *accountSummary;
  void *v7;
  void *v8;

  v4 = 0;
  switch(-[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:", a3))
  {
    case 0uLL:
      if ((-[PKCreditAccountSummary requiresDebtCollectionNotices](self->_accountSummary, "requiresDebtCollectionNotices") & 1) != 0)goto LABEL_3;
      accountSummary = self->_accountSummary;
      if (!accountSummary)
        goto LABEL_12;
      -[PKCreditAccountSummary mergeSummary](accountSummary, "mergeSummary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[PKAccount creditDetails](self->_account, "creditDetails");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isInMonthOfMerge") & 1) != 0)
        {
          v4 = 1;
        }
        else if (self->_accountSummary)
        {
          v4 = -[PKAccount accessLevel](self->_account, "accessLevel") == 2;
        }
        else
        {
          v4 = 0;
        }

      }
      else if (self->_accountSummary)
      {
        v4 = -[PKAccount accessLevel](self->_account, "accessLevel") == 2;
      }
      else
      {
        v4 = 0;
      }

      break;
    case 2uLL:
      if (-[NSArray count](self->_usageItems, "count"))
      {
        v5 = 1072;
        goto LABEL_7;
      }
LABEL_12:
      v4 = 0;
      break;
    case 5uLL:
      v5 = 1176;
LABEL_7:
      v4 = *(Class *)((char *)&self->super.super.super.super.isa + v5) != 0;
      break;
    case 8uLL:
LABEL_3:
      v4 = 1;
      break;
    default:
      return v4;
  }
  return v4;
}

- (void)_configureHeaderView:(id)a3 inSectionIndex:(unint64_t)a4
{
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t style;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = -[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:", a4);
  objc_msgSend(v20, "setUseCompactTopInset:", a4 == 0);
  -[PKCreditBalanceDetailsViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  v9 = v8;
  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  objc_msgSend(v7, "pkui_readableContentBoundsWithMargins:", 0.0, v9, 0.0, v10);
  v12 = v11;

  style = self->_style;
  v14 = (void *)objc_opt_class();
  if (style)
    objc_msgSend(v14, "defaultTableHorizontalInset");
  else
    objc_msgSend(v14, "defaultHorizontalInset");
  objc_msgSend(v20, "setHorizontalInset:", v12 + v15);
  switch(v6)
  {
    case 9uLL:
      goto LABEL_7;
    case 6uLL:
      if (self->_numberOfStaticSections == a4)
      {
        if (self->_style)
        {
          objc_msgSend(v20, "setTitleStyle:", 2);
          objc_msgSend(MEMORY[0x1E0DC3D78], "_defaultTextColorForTableViewStyle:isSectionHeader:", objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1), 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setTitleColor:", v16);

          PKLocalizedFeatureString();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "pk_uppercaseStringForPreferredLocale");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "setTitle:", v18);
        }
        else
        {
          objc_msgSend(v20, "setTitleStyle:", 0);
          PKLocalizedFeatureString();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setTitle:", v19);

        }
      }
      break;
    case 0uLL:
LABEL_7:
      objc_msgSend(v20, "setTitle:", 0);
      break;
  }

}

- (void)_configureFooterView:(id)a3 inSectionIndex:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  PKCreditAccountSummary *accountSummary;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  PKFamilyMemberCollection *familyCollection;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  double v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  PKFamilyMemberCollection *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:", a4);
  -[PKCreditBalanceDetailsViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  v10 = v9;
  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  objc_msgSend(v8, "pkui_readableContentBoundsWithMargins:", 0.0, v10, 0.0, v11);
  v13 = v12;

  objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
  objc_msgSend(v6, "setHorizontalInset:", v13 + v14);
  switch(v7)
  {
    case 0uLL:
      if (-[PKCreditAccountSummary requiresDebtCollectionNotices](self->_accountSummary, "requiresDebtCollectionNotices"))goto LABEL_26;
      accountSummary = self->_accountSummary;
      if (accountSummary)
      {
        -[PKCreditAccountSummary mergeSummary](accountSummary, "mergeSummary");
        v32 = objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v33 = (void *)v32;
          -[PKAccount creditDetails](self->_account, "creditDetails");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "isInMonthOfMerge");

          if (v35)
          {
            -[PKCreditAccountSummary mergeSummary](self->_accountSummary, "mergeSummary");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKAccountUserCollection coOwnerAccountUser](self->_accountUserCollection, "coOwnerAccountUser");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKAccountUserCollection currentAccountUser](self->_accountUserCollection, "currentAccountUser");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            familyCollection = self->_familyCollection;
            objc_msgSend(v37, "altDSID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKFamilyMemberCollection familyMemberForAltDSID:](familyCollection, "familyMemberForAltDSID:", v40);
            v41 = objc_claimAutoreleasedReturnValue();

            v42 = (void *)MEMORY[0x1E0D66C60];
            objc_msgSend(v37, "nameComponents");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = (void *)v41;
            objc_msgSend(v42, "contactForFamilyMember:nameComponents:imageData:", v41, v43, 0);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v91 = v44;
            objc_msgSend(v44, "givenName");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (void *)MEMORY[0x1E0CB3578];
            objc_msgSend(v36, "mergeDate");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "localizedStringFromDate:dateStyle:timeStyle:", v46, 2, 0);
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            -[PKAccount creditDetails](self->_account, "creditDetails");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "currencyCode");
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            v88 = v37;
            objc_msgSend(v37, "altDSID");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "accountDetailsForAltDSID:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "currentBalance");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v51;
            if (v51)
            {
              v53 = v51;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3598], "zero");
              v53 = (id)objc_claimAutoreleasedReturnValue();
            }
            v74 = v53;

            v75 = 0;
            if (v74 && v48)
            {
              PKCurrencyAmountMake();
              v75 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v96 = v38;
            objc_msgSend(v38, "altDSID");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = v36;
            objc_msgSend(v36, "accountDetailsForAltDSID:", v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "currentBalance");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = v78;
            if (v78)
            {
              v80 = v78;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3598], "zero");
              v80 = (id)objc_claimAutoreleasedReturnValue();
            }
            v81 = v80;

            v82 = 0;
            if (v81 && v48)
            {
              PKCurrencyAmountMake();
              v82 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v75, "formattedStringValue");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "formattedStringValue");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedFeatureString();
            v84 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "setFooterText:", v84, v87, v83, v89, v86);
            v68 = v88;
            goto LABEL_25;
          }
        }
        if (self->_accountSummary && -[PKAccount accessLevel](self->_account, "accessLevel") == 2)
        {
          objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "components:fromDate:", 8, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "month");

          PKGregorianMonthSpecificLocalizedStringKeyForKey();
          v69 = (NSString *)objc_claimAutoreleasedReturnValue();
          PKLocalizedMadisonString(v69);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setFooterText:", v73);

          goto LABEL_28;
        }
      }
      break;
    case 2uLL:
      -[PKAccount creditDetails](self->_account, "creditDetails");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isInMonthOfMerge");

      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      -[PKCreditAccountSummary mergeSummary](self->_accountSummary, "mergeSummary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accountDetails");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v99;
        LOBYTE(v22) = 1;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v99 != v21)
              objc_enumerationMutation(v18);
            if (v22)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * i), "statementBalance");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v24 != 0;

            }
            else
            {
              v22 = 0;
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
        }
        while (v20);
      }
      else
      {
        v22 = 1;
      }

      if ((v16 & v22) != 1)
      {
LABEL_26:
        PKLocalizedFeatureString();
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      -[PKCreditAccountSummary balanceSummary](self->_accountSummary, "balanceSummary");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "openingDate");
      v54 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "closingDate");
      v94 = (void *)v54;
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "timeIntervalSinceDate:", v54);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v54, v55 * 0.5);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v56, "setMonth:", -1);
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "dateByAddingComponents:toDate:options:", v56, v92, 0);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "components:fromDate:", 8, v90);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "month");

      -[PKAccountUserCollection coOwnerAccountUser](self->_accountUserCollection, "coOwnerAccountUser");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = self->_familyCollection;
      objc_msgSend(v59, "altDSID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKFamilyMemberCollection familyMemberForAltDSID:](v60, "familyMemberForAltDSID:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = (void *)MEMORY[0x1E0D66C60];
      objc_msgSend(v59, "nameComponents");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "contactForFamilyMember:nameComponents:imageData:", v62, v64, 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      PKGregorianMonthSpecificLocalizedStringKeyForKey();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "givenName");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setFooterText:", v67, v85);
      v68 = v94;
LABEL_25:

      break;
    case 5uLL:
      PKLocalizedFeatureString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFooterText:", v26, v25);
      v27 = objc_msgSend(v26, "rangeOfString:", v25);
      objc_msgSend(v6, "setLinkRange:", v27, v28);
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLinkTextColor:", v29);

      objc_msgSend(v6, "setAction:", &__block_literal_global_76);
      break;
    case 8uLL:
      -[PKCreditBalanceDetailsViewController _footerForTransactionLimitSection](self, "_footerForTransactionLimitSection");
      v30 = objc_claimAutoreleasedReturnValue();
LABEL_27:
      v69 = (NSString *)v30;
      objc_msgSend(v6, "setFooterText:", v30);
LABEL_28:

      break;
    default:
      break;
  }

}

void __76__PKCreditBalanceDetailsViewController__configureFooterView_inSectionIndex___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/kb/HT209227"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

- (id)_footerForTransactionLimitSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  int v10;
  int v11;
  void *v12;
  BOOL v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[PKAccountUserCollection currentAccountUser](self->_accountUserCollection, "currentAccountUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currencyCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "transactionSpendLimitAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "transactionSpendLimitEnabled");
  if (v7)
    v9 = v6 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (v8)
    v11 = v10;
  else
    v11 = 0;
  objc_msgSend(v4, "monthlySpendLimitAmount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "monthlySpendLimitEnabled"))
  {
    if (v12)
      v13 = v6 == 0;
    else
      v13 = 1;
    v14 = v13;
    if (!v13 && ((v11 ^ 1) & 1) == 0)
    {
      PKCurrencyAmountMake();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountMake();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "formattedStringValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "formattedStringValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMadisonString(CFSTR("BALANCE_DETAILS_TRANSACTION_AND_MONTHLY_LIMIT_FOOTER"), CFSTR("%1$@%2$@"), v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
      goto LABEL_27;
    }
    if ((v14 & 1) == 0)
    {
      PKCurrencyAmountMake();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "formattedStringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMadisonString(CFSTR("BALANCE_DETAILS_MONTHLY_LIMIT_FOOTER"), CFSTR("%@"), v16);
      goto LABEL_25;
    }
  }
  if (v11)
  {
    PKCurrencyAmountMake();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "formattedStringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("BALANCE_DETAILS_TRANSACTION_LIMIT_FOOTER"), CFSTR("%@"), v16);
LABEL_25:
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  v19 = 0;
LABEL_27:

  return v19;
}

- (BOOL)_statementIsFromMonthOfMerge
{
  void *v3;
  void *v4;
  PKCreditAccountStatement *statement;
  BOOL v6;
  void *v7;
  void *v8;
  char IsBetweenDates;

  -[PKAccount creditDetails](self->_account, "creditDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mergeDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  statement = self->_statement;
  if (statement)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    IsBetweenDates = 0;
  }
  else
  {
    -[PKCreditAccountStatement openingDate](statement, "openingDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCreditAccountStatement closingDate](self->_statement, "closingDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IsBetweenDates = PKDateIsBetweenDates();

  }
  return IsBetweenDates;
}

- (id)_createSummaryItemOfType:(unint64_t)a3
{
  PKDashboardBalanceSummaryItem *v3;
  void *v6;
  uint64_t v7;
  PKCreditAccountStatement *statement;
  PKCreditAccountSummary *accountSummary;
  PKCreditAccountSummary *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  void *v16;

  switch(a3)
  {
    case 6uLL:
      if ((-[PKAccount supportsRequestStatement](self->_account, "supportsRequestStatement") & 1) != 0)
        goto LABEL_27;
      goto LABEL_28;
    case 7uLL:
      if (!-[PKAccount supportsExportTransactionData](self->_account, "supportsExportTransactionData"))
        goto LABEL_28;
      -[PKAccount exportTransactionDataFeatureDescriptor](self->_account, "exportTransactionDataFeatureDescriptor");
      v3 = (PKDashboardBalanceSummaryItem *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardBalanceSummaryItem supportedFileFormatsForTransactionData](v3, "supportedFileFormatsForTransactionData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      goto LABEL_25;
    case 8uLL:
      statement = self->_statement;
      if (!statement)
      {
        accountSummary = self->_accountSummary;
        if (!accountSummary)
          goto LABEL_27;
        goto LABEL_21;
      }
      -[PKCreditAccountStatement credits](self->_statement, "credits");
      v3 = (PKDashboardBalanceSummaryItem *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        return v3;
      accountSummary = self->_accountSummary;
      if (accountSummary)
      {
LABEL_21:
        -[PKCreditAccountSummary balanceSummary](accountSummary, "balanceSummary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "credits");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
LABEL_13:

LABEL_27:
      v3 = objc_alloc_init(PKDashboardBalanceSummaryItem);
      -[PKDashboardBalanceSummaryItem setAccount:](v3, "setAccount:", self->_account);
      -[PKDashboardBalanceSummaryItem setAccountUserCollection:](v3, "setAccountUserCollection:", self->_accountUserCollection);
      -[PKDashboardBalanceSummaryItem setPhysicalCards:](v3, "setPhysicalCards:", self->_physicalCards);
      -[PKDashboardBalanceSummaryItem setWebService:](v3, "setWebService:", self->_webService);
      -[PKDashboardBalanceSummaryItem setTransactionSourceCollection:](v3, "setTransactionSourceCollection:", self->_transactionSourceCollection);
      -[PKDashboardBalanceSummaryItem setFamilyCollection:](v3, "setFamilyCollection:", self->_familyCollection);
      -[PKDashboardBalanceSummaryItem setType:](v3, "setType:", a3);
      -[PKDashboardBalanceSummaryItem setSummary:](v3, "setSummary:", self->_accountSummary);
      -[PKDashboardBalanceSummaryItem setStatement:](v3, "setStatement:", self->_statement);
      return v3;
    case 9uLL:
      statement = self->_statement;
      if (statement)
      {
        -[PKCreditAccountStatement payments](self->_statement, "payments");
        v3 = (PKDashboardBalanceSummaryItem *)objc_claimAutoreleasedReturnValue();
        if (!v3)
          return v3;
        v10 = self->_accountSummary;
        if (!v10)
          goto LABEL_13;
      }
      else
      {
        v10 = self->_accountSummary;
        if (!v10)
          goto LABEL_27;
      }
      -[PKCreditAccountSummary balanceSummary](v10, "balanceSummary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "payments");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      v7 = (uint64_t)v16;

      if (statement)
LABEL_25:

      if (!v7)
      {
LABEL_28:
        v3 = 0;
        return v3;
      }
      goto LABEL_27;
    case 0xFuLL:
      if (-[PKAccount accessLevel](self->_account, "accessLevel") != 2)
        goto LABEL_28;
      -[PKAccountUserCollection currentAccountUser](self->_accountUserCollection, "currentAccountUser");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "preferences");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "transactionSpendLimitEnabled");
      goto LABEL_18;
    case 0x10uLL:
      if (-[PKAccount accessLevel](self->_account, "accessLevel") != 2)
        goto LABEL_28;
      -[PKAccountUserCollection currentAccountUser](self->_accountUserCollection, "currentAccountUser");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "preferences");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "monthlySpendLimitEnabled");
LABEL_18:
      v14 = v13;

      if ((v14 & 1) == 0)
        goto LABEL_28;
      goto LABEL_27;
    default:
      goto LABEL_27;
  }
}

- (void)_reloadData
{
  PKCreditAccountSummary *accountSummary;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PKBalanceSummaryFetcher *fetcher;
  _QWORD v10[5];

  accountSummary = self->_accountSummary;
  if (accountSummary)
  {
    -[PKCreditAccountSummary balanceSummary](accountSummary, "balanceSummary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openingDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKCreditAccountSummary balanceSummary](self->_accountSummary, "balanceSummary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "closingDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
  }
  else
  {
    -[PKCreditAccountStatement openingDate](self->_statement, "openingDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCreditAccountStatement closingDate](self->_statement, "closingDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1;
  }
  fetcher = self->_fetcher;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__PKCreditBalanceDetailsViewController__reloadData__block_invoke;
  v10[3] = &unk_1E3E6A808;
  v10[4] = self;
  -[PKBalanceSummaryFetcher balanceSummaryStartingWithDate:endDate:type:completion:](fetcher, "balanceSummaryStartingWithDate:endDate:type:completion:", v5, v7, v8, v10);
  -[PKCreditBalanceDetailsViewController _updateStatements](self, "_updateStatements");

}

void __51__PKCreditBalanceDetailsViewController__reloadData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PKCreditBalanceDetailsViewController__reloadData__block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __51__PKCreditBalanceDetailsViewController__reloadData__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1280), *(id *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1136);
  objc_msgSend(*(id *)(a1 + 40), "orderedSpendingTransactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransactionGroup:", v3);

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1152);
  objc_msgSend(*(id *)(a1 + 40), "orderedCredits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransactionGroup:", v5);

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1144);
  objc_msgSend(*(id *)(a1 + 40), "orderedInterestCharges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTransactionGroup:", v7);

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (void)_sortStatementsForPresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *statements;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *statementsByYear;
  uint64_t v19;
  NSArray *sortedYears;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *sectionMap;
  uint64_t v28;
  NSArray *v29;
  PKDashboardBalanceSummaryItem *lastStatementSummaryItem;
  void *v31;
  void *v32;
  PKCreditBalanceDetailsViewController *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray sortedArrayUsingComparator:](self->_statements, "sortedArrayUsingComparator:", &__block_literal_global_123);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  statements = self->_statements;
  self->_statements = v5;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v33 = self;
  v7 = self->_statements;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "closingDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v3, "component:fromDate:", 4, v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v15);
        }
        objc_msgSend(v16, "addObject:", v12);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v15);

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v9);
  }

  v17 = objc_msgSend(v4, "copy");
  statementsByYear = v33->_statementsByYear;
  v33->_statementsByYear = (NSDictionary *)v17;

  objc_msgSend(v34, "sortedArrayUsingComparator:", &__block_literal_global_126);
  v19 = objc_claimAutoreleasedReturnValue();
  sortedYears = v33->_sortedYears;
  v33->_sortedYears = (NSArray *)v19;

  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PKAccount accessLevel](v33->_account, "accessLevel") == 1)
  {
    if (objc_msgSend(v34, "count"))
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v22 = v34;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v36;
        while (1)
        {
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(v21, "addObject:", &unk_1E3FAD180);
          if (!--v24)
          {
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (!v24)
              break;
          }
        }
      }

    }
    else
    {
      objc_msgSend(v21, "addObject:", &unk_1E3FAD180);
    }
  }
  -[NSArray subarrayWithRange:](v33->_sectionMap, "subarrayWithRange:", 0, v33->_numberOfStaticSections);
  v26 = objc_claimAutoreleasedReturnValue();
  sectionMap = v33->_sectionMap;
  v33->_sectionMap = (NSArray *)v26;

  -[NSArray arrayByAddingObjectsFromArray:](v33->_sectionMap, "arrayByAddingObjectsFromArray:", v21);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v33->_sectionMap;
  v33->_sectionMap = (NSArray *)v28;

  if (-[NSArray count](v33->_statements, "count"))
  {
    lastStatementSummaryItem = v33->_lastStatementSummaryItem;
    -[NSArray subarrayWithRange:](v33->_statements, "subarrayWithRange:", 1, -[NSArray count](v33->_statements, "count") - 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardBalanceSummaryItem setStatements:](lastStatementSummaryItem, "setStatements:", v31);

  }
  -[PKCreditBalanceDetailsViewController collectionView](v33, "collectionView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "reloadData");

}

uint64_t __70__PKCreditBalanceDetailsViewController__sortStatementsForPresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "closingDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closingDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __70__PKCreditBalanceDetailsViewController__sortStatementsForPresentation__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (void)_updateStatements
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (self->_accountSummary)
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__PKCreditBalanceDetailsViewController__updateStatements__block_invoke;
    v5[3] = &unk_1E3E6A8B0;
    v5[4] = self;
    objc_msgSend(v3, "creditStatementsForAccountIdentifier:completion:", v4, v5);

  }
}

void __57__PKCreditBalanceDetailsViewController__updateStatements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PKCreditBalanceDetailsViewController__updateStatements__block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __57__PKCreditBalanceDetailsViewController__updateStatements__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1288);
  *(_QWORD *)(v3 + 1288) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_sortStatementsForPresentation");
}

- (void)statementsChangedForAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  id v8;

  v4 = a3;
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v6 == v8)
  {

  }
  else
  {
    if (!v8 || !v6)
    {

      goto LABEL_9;
    }
    v7 = objc_msgSend(v8, "isEqualToString:", v6);

    if (!v7)
      goto LABEL_9;
  }
  -[PKCreditBalanceDetailsViewController _updateStatements](self, "_updateStatements");
LABEL_9:

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  PKDashboardTitleHeaderView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PKDashboardTitleHeaderView *v15;
  PKDashboardTitleHeaderView *sampleHeaderView;
  PKDashboardFooterTextView *v17;
  PKDashboardFooterTextView *sampleFooterView;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKCreditBalanceDetailsViewController;
  -[PKCreditBalanceDetailsViewController traitCollectionDidChange:](&v20, sel_traitCollectionDidChange_, v4);
  -[PKCreditBalanceDetailsViewController traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        v10 = [PKDashboardTitleHeaderView alloc];
        v11 = *MEMORY[0x1E0C9D648];
        v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        v15 = -[PKDashboardTitleHeaderView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
        sampleHeaderView = self->_sampleHeaderView;
        self->_sampleHeaderView = v15;

        v17 = -[PKDashboardFooterTextView initWithFrame:]([PKDashboardFooterTextView alloc], "initWithFrame:", v11, v12, v13, v14);
        sampleFooterView = self->_sampleFooterView;
        self->_sampleFooterView = v17;

        -[PKCreditBalanceDetailsViewController collectionView](self, "collectionView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardBalancePresenter traitCollectionDidChangeFromTrait:toTrait:inCollectionView:](self->_balancePresenter, "traitCollectionDidChangeFromTrait:toTrait:inCollectionView:", v4, v6, v19);
        -[PKDashboardBalanceSummaryItemPresenter traitCollectionDidChangeFromTrait:toTrait:inCollectionView:](self->_balanceSummaryItemPresenter, "traitCollectionDidChangeFromTrait:toTrait:inCollectionView:", v4, v6, v19);
        objc_msgSend(v19, "reloadData");

      }
    }
  }

}

- (void)_reportEventForPassIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v7 = (id)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v7, "setObject:forKey:", self->_pageTagForAnalyticsReporting, *MEMORY[0x1E0D68F50]);
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = (void *)objc_msgSend(v7, "copy");
    -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportDashboardEventIfNecessary:forPass:", v5, v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageTagForAnalyticsReporting, 0);
  objc_storeStrong((id *)&self->_sectionMap, 0);
  objc_storeStrong((id *)&self->_sampleFooterView, 0);
  objc_storeStrong((id *)&self->_sampleHeaderView, 0);
  objc_storeStrong((id *)&self->_monthYearFormatter, 0);
  objc_storeStrong((id *)&self->_sortedYears, 0);
  objc_storeStrong((id *)&self->_statementsByYear, 0);
  objc_storeStrong((id *)&self->_statements, 0);
  objc_storeStrong((id *)&self->_balanceSummary, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_exportTransactionDataSummaryItem, 0);
  objc_storeStrong((id *)&self->_statementDownloadSummaryItem, 0);
  objc_storeStrong((id *)&self->_usageItems, 0);
  objc_storeStrong((id *)&self->_mergeBalances, 0);
  objc_storeStrong((id *)&self->_accountMergingItem, 0);
  objc_storeStrong((id *)&self->_spendLimitItems, 0);
  objc_storeStrong((id *)&self->_totalBalanceItems, 0);
  objc_storeStrong((id *)&self->_availableCreditSummaryItem, 0);
  objc_storeStrong((id *)&self->_totalBalanceSummaryItem, 0);
  objc_storeStrong((id *)&self->_creditLimitSummaryItem, 0);
  objc_storeStrong((id *)&self->_installmentBalanceSummaryItem, 0);
  objc_storeStrong((id *)&self->_dailyCashSummaryItem, 0);
  objc_storeStrong((id *)&self->_creditsSummaryItem, 0);
  objc_storeStrong((id *)&self->_paymentsSummaryItem, 0);
  objc_storeStrong((id *)&self->_paymentsAndCreditsSummaryItem, 0);
  objc_storeStrong((id *)&self->_interestSummaryItem, 0);
  objc_storeStrong((id *)&self->_currentSpendingSummaryItem, 0);
  objc_storeStrong((id *)&self->_lastStatementSummaryItem, 0);
  objc_storeStrong((id *)&self->_balanceItem, 0);
  objc_storeStrong((id *)&self->_balanceSummaryItemPresenter, 0);
  objc_storeStrong((id *)&self->_balancePresenter, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_accountSummary, 0);
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_previousStatement, 0);
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end

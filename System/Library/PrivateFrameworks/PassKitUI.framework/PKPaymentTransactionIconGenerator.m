@implementation PKPaymentTransactionIconGenerator

- (PKPaymentTransactionIconGenerator)initWithCache:(BOOL)a3 scale:(double)a4
{
  _BOOL4 v5;
  PKPaymentTransactionIconGenerator *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *iconCache;
  NSMutableArray *v9;
  NSMutableArray *iconCacheKeys;
  NSMutableOrderedSet *v11;
  NSMutableOrderedSet *highPriorityIconRequests;
  NSMutableOrderedSet *v13;
  NSMutableOrderedSet *lowPriorityIconRequests;
  NSMutableArray *v15;
  NSMutableArray *inflightRequests;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queueIcons;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentTransactionIconGenerator;
  v6 = -[PKPaymentTransactionIconGenerator init](&v21, sel_init);
  if (v6)
  {
    v6->_hasNetworkAccess = PKProcessHasNetworkPrivilegies();
    v6->_useCache = v5;
    if (v5)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      iconCache = v6->_iconCache;
      v6->_iconCache = v7;

      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      iconCacheKeys = v6->_iconCacheKeys;
      v6->_iconCacheKeys = v9;

    }
    v6->_scale = a4;
    v6->_lockRequests._os_unfair_lock_opaque = 0;
    v11 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    highPriorityIconRequests = v6->_highPriorityIconRequests;
    v6->_highPriorityIconRequests = v11;

    v13 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    lowPriorityIconRequests = v6->_lowPriorityIconRequests;
    v6->_lowPriorityIconRequests = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    inflightRequests = v6->_inflightRequests;
    v6->_inflightRequests = v15;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.passbook.transaction.icons", v17);
    queueIcons = v6->_queueIcons;
    v6->_queueIcons = (OS_dispatch_queue *)v18;

  }
  return v6;
}

- (id)iconForTransaction:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 requestType:(unint64_t)a6 iconHandler:(id)a7
{
  return -[PKPaymentTransactionIconGenerator _iconForTransaction:merchant:payLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](self, "_iconForTransaction:merchant:payLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", a3, 0, 0, a5, a6, a7, a4.width, a4.height);
}

- (id)iconCacheKeyForTransaction:(id)a3 size:(CGSize)a4
{
  return -[PKPaymentTransactionIconGenerator _iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:", a3, 1, 0, a4.width, a4.height);
}

- (id)iconForMerchant:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 requestType:(unint64_t)a6 iconHandler:(id)a7
{
  return -[PKPaymentTransactionIconGenerator _iconForTransaction:merchant:payLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](self, "_iconForTransaction:merchant:payLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", 0, a3, 0, a5, a6, a7, a4.width, a4.height);
}

- (id)iconForPayLaterMerchant:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 requestType:(unint64_t)a6 iconHandler:(id)a7
{
  return -[PKPaymentTransactionIconGenerator _iconForTransaction:merchant:payLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](self, "_iconForTransaction:merchant:payLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", 0, 0, a3, a5, a6, a7, a4.width, a4.height);
}

- (id)_iconForTransaction:(id)a3 merchant:(id)a4 payLaterMerchant:(id)a5 size:(CGSize)a6 ignoreLogoURL:(BOOL)a7 requestType:(unint64_t)a8 iconHandler:(id)a9
{
  _BOOL8 v11;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  PKPaymentTransactionIconGenerator *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  PKPaymentTransactionIconRequest *v36;
  os_unfair_lock_s *p_lockRequests;
  char v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSMutableOrderedSet **p_highPriorityIconRequests;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *queueIcons;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  _QWORD block[5];
  _QWORD v72[2];

  v11 = a7;
  height = a6.height;
  width = a6.width;
  v72[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a9;
  v21 = v20;
  if (v20 && (v17 || v18 || v19))
  {
    v70 = v20;
    if (v17)
    {
      v23 = v18;
      -[PKPaymentTransactionIconGenerator _iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:", v17, v11, 0, width, height);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = self;
      -[PKPaymentTransactionIconGenerator _iconForCacheKey:](self, "_iconForCacheKey:", v24);
      v26 = a8;
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "merchant");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v29) = CacheKeyIsFinalForMerchant(v24, v28, v11);

      v30 = (void *)v27;
      a8 = v26;
      if (!v30)
        goto LABEL_25;
      goto LABEL_23;
    }
    if (v18)
    {
      -[PKPaymentTransactionIconGenerator _iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:", v18, v11, 0, width, height);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v29 = v18;
      v25 = self;
      -[PKPaymentTransactionIconGenerator _iconForCacheKey:](self, "_iconForCacheKey:", v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v29;
      LODWORD(v29) = CacheKeyIsFinalForMerchant(v24, v29, v11);
      if (!v30)
        goto LABEL_25;
      goto LABEL_23;
    }
    if (!v19)
    {
      -[PKPaymentTransactionIconGenerator _iconForCacheKey:](self, "_iconForCacheKey:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      goto LABEL_26;
    }
    -[PKPaymentTransactionIconGenerator _iconCacheKeyForPayLaterMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPayLaterMerchant:size:ignoreLogoURL:imageOut:", v19, v11, 0, width, height);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionIconGenerator _iconForCacheKey:](self, "_iconForCacheKey:", v31);
    v61 = objc_claimAutoreleasedReturnValue();
    v24 = v31;
    objc_msgSend(v19, "mapsBrand");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "logoURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "absoluteString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = v33;
    if (v33 && !v11)
    {
      v29 = v24;
      v34 = v33;
      if (v34 == v29)
      {

      }
      else
      {
        v35 = v34;
        if (!v29)
        {
          v23 = 0;
          v25 = self;

LABEL_22:
          v30 = (void *)v61;
          if (!v61)
          {
LABEL_25:
            self = v25;
            v18 = v23;
            v21 = v70;
LABEL_26:
            v36 = objc_alloc_init(PKPaymentTransactionIconRequest);
            -[PKPaymentTransactionIconRequest setSize:](v36, "setSize:", width, height);
            -[PKPaymentTransactionIconRequest setTransaction:](v36, "setTransaction:", v17);
            -[PKPaymentTransactionIconRequest setMerchant:](v36, "setMerchant:", v18);
            -[PKPaymentTransactionIconRequest setPayLaterMerchant:](v36, "setPayLaterMerchant:", v19);
            -[PKPaymentTransactionIconRequest setCacheKey:](v36, "setCacheKey:", v24);
            -[PKPaymentTransactionIconRequest setIgnoreLogoURL:](v36, "setIgnoreLogoURL:", v11);
            p_lockRequests = &self->_lockRequests;
            os_unfair_lock_lock(&self->_lockRequests);
            v69 = v19;
            if (a8)
            {
              if (a8 != 1)
              {
                v40 = 0;
                v38 = 0;
LABEL_32:
                v68 = v24;
                v65 = v40;
                if (-[NSMutableArray containsObject:](self->_inflightRequests, "containsObject:", v36))
                {
                  v62 = v30;
                  -[NSMutableArray objectAtIndex:](self->_inflightRequests, "objectAtIndex:", -[NSMutableArray indexOfObject:](self->_inflightRequests, "indexOfObject:", v36));
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "completionHandlers");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = (void *)objc_msgSend(v21, "copy");
                  v44 = _Block_copy(v43);
                  objc_msgSend(v42, "arrayByAddingObject:", v44);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "setCompletionHandlers:", v45);

                  p_lockRequests = &self->_lockRequests;
                  v46 = v65;

                  v30 = v62;
LABEL_42:
                  v24 = v68;
                  v19 = v69;
                  goto LABEL_43;
                }
                p_highPriorityIconRequests = &self->_highPriorityIconRequests;
                if (-[NSMutableOrderedSet containsObject:](self->_highPriorityIconRequests, "containsObject:", v36))
                {
                  if ((v38 & 1) == 0)
                  {
                    objc_msgSend(0, "completionHandlers");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    v49 = (void *)objc_msgSend(v21, "copy");
                    v50 = v30;
                    v51 = _Block_copy(v49);
                    objc_msgSend(v48, "arrayByAddingObject:", v51);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(0, "setCompletionHandlers:", v52);

                    v30 = v50;
                    p_lockRequests = &self->_lockRequests;

                    v24 = v68;
                    v19 = v69;
                    v46 = v65;
LABEL_43:
                    if (self->_processingRequest)
                    {
                      os_unfair_lock_unlock(p_lockRequests);
                    }
                    else
                    {
                      self->_processingRequest = 1;
                      os_unfair_lock_unlock(p_lockRequests);
                      queueIcons = self->_queueIcons;
                      block[0] = MEMORY[0x1E0C809B0];
                      block[1] = 3221225472;
                      block[2] = __126__PKPaymentTransactionIconGenerator__iconForTransaction_merchant_payLaterMerchant_size_ignoreLogoURL_requestType_iconHandler___block_invoke;
                      block[3] = &unk_1E3E612E8;
                      block[4] = self;
                      dispatch_async(queueIcons, block);
                    }
                    v22 = v30;

                    goto LABEL_47;
                  }
                }
                else
                {
                  p_highPriorityIconRequests = &self->_lowPriorityIconRequests;
                  if (!-[NSMutableOrderedSet containsObject:](self->_lowPriorityIconRequests, "containsObject:", v36))goto LABEL_40;
                }
                -[NSMutableOrderedSet objectAtIndex:](*p_highPriorityIconRequests, "objectAtIndex:", -[NSMutableOrderedSet indexOfObject:](*p_highPriorityIconRequests, "indexOfObject:", v36));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableOrderedSet removeObject:](*p_highPriorityIconRequests, "removeObject:", v36);
                if (v53)
                {
                  objc_msgSend(v53, "completionHandlers");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = (void *)objc_msgSend(v21, "copy");
                  v63 = v30;
                  v55 = _Block_copy(v54);
                  objc_msgSend(v60, "arrayByAddingObject:", v55);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PKPaymentTransactionIconRequest setCompletionHandlers:](v36, "setCompletionHandlers:", v56);

                  p_lockRequests = &self->_lockRequests;
                  v30 = v63;

LABEL_41:
                  v46 = v65;
                  objc_msgSend(v65, "addObject:", v36);
                  goto LABEL_42;
                }
LABEL_40:
                v53 = (void *)objc_msgSend(v21, "copy");
                v72[0] = v53;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKPaymentTransactionIconRequest setCompletionHandlers:](v36, "setCompletionHandlers:", v57);

                goto LABEL_41;
              }
              v38 = 0;
              v39 = 48;
            }
            else
            {
              v38 = 1;
              v39 = 40;
            }
            v40 = *(id *)((char *)&self->super.isa + v39);
            goto LABEL_32;
          }
LABEL_23:
          if ((_DWORD)v29)
          {
            v22 = v30;
            v18 = v23;
            v21 = v70;
LABEL_47:

            goto LABEL_48;
          }
          goto LABEL_25;
        }
        v64 = objc_msgSend(v29, "isEqualToString:", v34);

        if (!v64)
        {
          v23 = 0;
          v25 = self;
          LODWORD(v29) = 0;
          goto LABEL_22;
        }
      }
    }
    v23 = 0;
    v25 = self;
    LODWORD(v29) = 1;
    goto LABEL_22;
  }
  v22 = 0;
LABEL_48:

  return v22;
}

uint64_t __126__PKPaymentTransactionIconGenerator__iconForTransaction_merchant_payLaterMerchant_size_ignoreLogoURL_requestType_iconHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_processNextIconRequest");
}

- (void)queue_processNextIconRequest
{
  os_unfair_lock_s *p_lockRequests;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  id v32;
  id v33;
  id *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  uint64_t v45;
  os_unfair_lock_s *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  PKPaymentTransactionIconGenerator *v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  p_lockRequests = &self->_lockRequests;
  os_unfair_lock_lock(&self->_lockRequests);
  -[NSMutableOrderedSet lastObject](self->_highPriorityIconRequests, "lastObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[NSMutableOrderedSet removeObject:](self->_highPriorityIconRequests, "removeObject:", v4);
    os_unfair_lock_unlock(p_lockRequests);
LABEL_4:
    v46 = p_lockRequests;
    while (1)
    {
      v6 = (void *)MEMORY[0x1A1AE621C]();
      objc_msgSend(v5, "transaction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "merchant");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        objc_msgSend(v7, "merchant");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;

      objc_msgSend(v5, "payLaterMerchant");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logoURL");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v5, "ignoreLogoURL");
      v15 = v14;
      v51 = (void *)v13;
      if (v13)
      {
        if ((v14 & 1) == 0)
          break;
      }
      v49 = v12;
      if (objc_msgSend(v7, "transactionType") != 15 || objc_msgSend(v7, "transactionSource") != 2)
        goto LABEL_32;
      objc_msgSend(v7, "releasedData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "application");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
      {

LABEL_32:
        if (v7)
        {
          objc_msgSend(v5, "size");
          v58 = 0;
          v34 = (id *)&v58;
          v35 = -[PKPaymentTransactionIconGenerator _iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:", v7, v15, &v58);
          goto LABEL_38;
        }
        if (v11)
        {
          objc_msgSend(v5, "size");
          v57 = 0;
          v34 = (id *)&v57;
          v36 = -[PKPaymentTransactionIconGenerator _iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:", v11, v15, &v57);
          goto LABEL_38;
        }
        if (v12)
        {
          objc_msgSend(v5, "size");
          v56 = 0;
          v34 = (id *)&v56;
          v37 = -[PKPaymentTransactionIconGenerator _iconCacheKeyForPayLaterMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPayLaterMerchant:size:ignoreLogoURL:imageOut:", v12, v15, &v56);
LABEL_38:
          v38 = v11;
          v24 = *v34;
        }
        else
        {
          v38 = 0;
          v24 = 0;
        }
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        objc_msgSend(v5, "completionHandlers");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v53 != v42)
                objc_enumerationMutation(v39);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i) + 16))();
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
          }
          while (v41);
        }

        p_lockRequests = v46;
        v11 = v38;
        v12 = v49;
        goto LABEL_47;
      }
      v20 = (void *)v19;
      objc_msgSend(v7, "releasedData");
      v48 = v6;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "application");
      v22 = v11;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v23, "client");

      v11 = v22;
      v12 = v49;

      v6 = v48;
      if (v45 != 2)
        goto LABEL_32;
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __65__PKPaymentTransactionIconGenerator_queue_processNextIconRequest__block_invoke_73;
      v59[3] = &unk_1E3E75738;
      v60 = v5;
      -[PKPaymentTransactionIconGenerator _iconForReleasedData:requestToProcess:iconHandler:](self, "_iconForReleasedData:requestToProcess:iconHandler:", v7, v60, v59);
      v24 = v60;
LABEL_47:

      os_unfair_lock_lock(p_lockRequests);
      -[NSMutableOrderedSet lastObject](self->_highPriorityIconRequests, "lastObject");
      v44 = objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        -[NSMutableOrderedSet removeObject:](self->_highPriorityIconRequests, "removeObject:", v44);
        v5 = (void *)v44;
      }
      else
      {
        -[NSMutableOrderedSet lastObject](self->_lowPriorityIconRequests, "lastObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableOrderedSet removeObject:](self->_lowPriorityIconRequests, "removeObject:", v5);
      }
      os_unfair_lock_unlock(p_lockRequests);

      objc_autoreleasePoolPop(v6);
      if (!v5)
        goto LABEL_54;
    }
    v47 = v6;
    if (v7)
    {
      objc_msgSend(v5, "size");
      v72 = 0;
      v16 = (id *)&v72;
      -[PKPaymentTransactionIconGenerator _iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:", v7, 0, &v72);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else if (v11)
    {
      objc_msgSend(v5, "size");
      v71 = 0;
      v16 = (id *)&v71;
      -[PKPaymentTransactionIconGenerator _iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:", v11, 0, &v71);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v12)
      {
        v24 = 0;
        v25 = 0;
LABEL_30:
        os_unfair_lock_lock(p_lockRequests);
        -[NSMutableArray addObject:](self->_inflightRequests, "addObject:", v5);
        os_unfair_lock_unlock(p_lockRequests);
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __65__PKPaymentTransactionIconGenerator_queue_processNextIconRequest__block_invoke;
        v61[3] = &unk_1E3E77618;
        v32 = v51;
        v62 = v32;
        v63 = self;
        v64 = v25;
        v65 = v5;
        v33 = v25;
        -[PKPaymentTransactionIconGenerator _downloadLogoForURL:withCompletionHandler:](self, "_downloadLogoForURL:withCompletionHandler:", v32, v61);

        v6 = v47;
        goto LABEL_47;
      }
      objc_msgSend(v5, "size");
      v70 = 0;
      v16 = (id *)&v70;
      -[PKPaymentTransactionIconGenerator _iconCacheKeyForPayLaterMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPayLaterMerchant:size:ignoreLogoURL:imageOut:", v12, 0, &v70);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v17;
    v24 = *v16;
    if (v24)
    {
      v50 = v12;
      v26 = v11;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      objc_msgSend(v5, "completionHandlers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v67;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v67 != v30)
              objc_enumerationMutation(v27);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j) + 16))();
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
        }
        while (v29);
      }

      p_lockRequests = v46;
      v11 = v26;
      v12 = v50;
    }
    goto LABEL_30;
  }
  -[NSMutableOrderedSet lastObject](self->_lowPriorityIconRequests, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet removeObject:](self->_lowPriorityIconRequests, "removeObject:", v5);
  os_unfair_lock_unlock(p_lockRequests);
  if (v5)
    goto LABEL_4;
LABEL_54:
  os_unfair_lock_lock(p_lockRequests);
  self->_processingRequest = 0;
  os_unfair_lock_unlock(p_lockRequests);
}

void __65__PKPaymentTransactionIconGenerator_queue_processNextIconRequest__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5 && !a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 80));
    if (v6)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (v8)
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v7;
        v24 = 2048;
        v25 = objc_msgSend(v5, "length");
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Downloaded data did not result in an image, key: %@, data length: %lu", buf, 0x16u);
      }

    }
    else
    {
      v10 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(v10 + 24))
      {
        objc_msgSend(*(id *)(v10 + 8), "setObject:forKey:", v6, v7);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v7);
      }
    }
    v11 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(a1 + 48) && *(_BYTE *)(v11 + 24))
    {
      objc_msgSend(*(id *)(v11 + 8), "removeObjectForKey:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", *(_QWORD *)(a1 + 48));
      v11 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend(*(id *)(v11 + 56), "removeObject:", *(_QWORD *)(a1 + 56));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 80));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(*(id *)(a1 + 56), "completionHandlers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++) + 16))();
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

void __65__PKPaymentTransactionIconGenerator_queue_processNextIconRequest__block_invoke_73(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "completionHandlers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_iconForCacheKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4 && self->_useCache)
  {
    os_unfair_lock_lock(&self->_lockRequests);
    -[NSMutableDictionary objectForKey:](self->_iconCache, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](self->_iconCacheKeys, "removeObject:", v4);
    -[NSMutableArray addObject:](self->_iconCacheKeys, "addObject:", v4);
    if ((unint64_t)-[NSMutableArray count](self->_iconCacheKeys, "count") >= 0x12D)
    {
      -[NSMutableArray firstObject](self->_iconCacheKeys, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObject:](self->_iconCacheKeys, "removeObject:", v6);
      -[NSMutableDictionary removeObjectForKey:](self->_iconCache, "removeObjectForKey:", v6);

    }
    os_unfair_lock_unlock(&self->_lockRequests);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_iconCacheKeyForPaymentTransaction:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 imageOut:(id *)a6
{
  _BOOL8 v7;
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  id v46;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;
  CGSize v53;
  CGSize v54;

  v7 = a5;
  height = a4.height;
  width = a4.width;
  v52 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend(v11, "merchant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(MEMORY[0x1E0D67390], "iconTypeForTransaction:ignoreLogoURL:", v11, v7))
  {
    case 0:
      objc_msgSend(v11, "merchant");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransactionIconGenerator _iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:", v13, v7, a6, width, height);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_31;
    case 1:
      v15 = objc_msgSend(v11, "transitType");
      if (v7)
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(v12, "logoImageURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[PKPaymentTransactionIconGenerator _cacheImageFromDownloaderCacheForURL:](self, "_cacheImageFromDownloaderCacheForURL:", v16);
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v21 = (id)v30;
        objc_msgSend(v16, "absoluteString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        goto LABEL_45;
      }
      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "uniqueIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v54.width = width;
      v54.height = height;
      NSStringFromCGSize(v54);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("%lu-%@-%@"), v15, v33, v34);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 == 513)
      {
        PKIconCurrencyCodeForTransaction(v11);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v35;
        if (v35)
        {
          objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("-%@"), v35);
          v37 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v37;
        }

      }
      -[PKPaymentTransactionIconGenerator _iconForCacheKey:](self, "_iconForCacheKey:", v14);
      v38 = objc_claimAutoreleasedReturnValue();
      v21 = (id)v38;
      v31 = 0;
      if (!a6 || v38)
        goto LABEL_45;
      PKGEOFeaturesStyleAttributesFromTransitType(v15);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v39)
      {
        PKIconFromGEOFeatureStyleAttributes(v39, 0, width, height, self->_scale);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        if (v21)
          goto LABEL_44;
        PKLogFacilityTypeGetObject();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v49 = v40;
          v50 = 2048;
          v51 = v15;
          _os_log_impl(&dword_19D178000, v41, OS_LOG_TYPE_DEFAULT, "Missing icon for attributes: %@, transitSubtype: %ld, falling back to default transit icon", buf, 0x16u);
        }

        PKDefaultTransitIcon(0, width, height, self->_scale);
        v42 = objc_claimAutoreleasedReturnValue();
      }
      else if (v15 == 517)
      {
        PKDefaultCardReadIcon(0, width, height, self->_scale);
        v42 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v15 == 513)
          PKDefaultTopUpIconForTransaction(v11, 0, width, height, self->_scale);
        else
          PKIconForMerchant(v12, 0, 0, 1, width, height, self->_scale);
        v42 = objc_claimAutoreleasedReturnValue();
      }
      v21 = (id)v42;
LABEL_44:

      v31 = 1;
LABEL_45:

      v17 = 0;
      goto LABEL_46;
    case 2:
      objc_msgSend(MEMORY[0x1E0D67390], "staticIconNameForTransaction:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v21 = 0;
        v14 = 0;
        goto LABEL_33;
      }
      v18 = (void *)MEMORY[0x1E0CB3940];
      v53.width = width;
      v53.height = height;
      NSStringFromCGSize(v53);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@-%@"), v17, v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a6)
      {
        v21 = 0;
        goto LABEL_33;
      }
      -[PKPaymentTransactionIconGenerator _iconForCacheKey:](self, "_iconForCacheKey:", v14);
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (id)v20;
LABEL_33:
        v43 = v21 != 0;
        goto LABEL_51;
      }
      PKPassKitUIBundle();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "URLForResource:withExtension:", v17, CFSTR("pdf"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      PKUIImageFromPDF(v45, width, height, self->_scale);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        PKUIImageNamed(v17);
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      v31 = 1;
LABEL_46:
      v43 = v21 != 0;
      if (v21 && v14 && v31 && self->_useCache)
      {
        os_unfair_lock_lock(&self->_lockRequests);
        -[NSMutableDictionary setObject:forKey:](self->_iconCache, "setObject:forKey:", v21, v14);
        -[NSMutableArray addObject:](self->_iconCacheKeys, "addObject:", v14);
        os_unfair_lock_unlock(&self->_lockRequests);
      }
LABEL_51:
      if (a6 && v43)
      {
        v21 = objc_retainAutorelease(v21);
        *a6 = v21;
      }
LABEL_54:
      v46 = v14;

      return v46;
    case 3:
      objc_msgSend(v11, "releasedData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "application");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "client");

      if (v24 != 2)
        goto LABEL_13;
      objc_msgSend(v11, "releasedData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "application");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "merchant");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "adamIdentifier");

      if (v29 > 0 || v27)
      {
        -[PKPaymentTransactionIconGenerator _iconCacheKeyForApp:bundleIdentifier:size:](self, "_iconCacheKeyForApp:bundleIdentifier:size:", v29, v27, width, height);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

LABEL_31:
      v17 = 0;
      v21 = 0;
      goto LABEL_54;
    default:
LABEL_13:
      v17 = 0;
      v21 = 0;
      v14 = 0;
      goto LABEL_54;
  }
}

- (id)_iconCacheKeyForMerchant:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 imageOut:(id *)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  CGSize v23;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = v11;
  if (a5)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v11, "logoImageURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PKPaymentTransactionIconGenerator _cacheImageFromDownloaderCacheForURL:](self, "_cacheImageFromDownloaderCacheForURL:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(v13, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = a6 != 0;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23.width = width;
    v23.height = height;
    NSStringFromCGSize(v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@-%@"), v20, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentTransactionIconGenerator _iconForCacheKey:](self, "_iconForCacheKey:", v16);
    v22 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v22;
    v17 = a6 != 0;
    if (a6)
    {
      if (!v22)
      {
        v17 = 1;
        PKIconForMerchant(v12, 0, 0, 1, width, height, self->_scale);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          if (v16 && self->_useCache)
          {
            os_unfair_lock_lock(&self->_lockRequests);
            -[NSMutableDictionary setObject:forKey:](self->_iconCache, "setObject:forKey:", v15, v16);
            -[NSMutableArray addObject:](self->_iconCacheKeys, "addObject:", v16);
            os_unfair_lock_unlock(&self->_lockRequests);
            v17 = 1;
          }
        }
      }
    }
  }
  if (v17 && v15)
    *a6 = objc_retainAutorelease(v15);

  return v16;
}

- (id)_iconCacheKeyForPayLaterMerchant:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 imageOut:(id *)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CGSize v23;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = v11;
  if (a5)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v11, "mapsBrand");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logoURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PKPaymentTransactionIconGenerator _cacheImageFromDownloaderCacheForURL:](self, "_cacheImageFromDownloaderCacheForURL:", v13);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v13, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23.width = width;
    v23.height = height;
    NSStringFromCGSize(v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@-%@"), v19, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentTransactionIconGenerator _iconForCacheKey:](self, "_iconForCacheKey:", v17);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v16 = (void *)v21;
    }
    else
    {
      PKIconForPayLaterMerchant(v12, 0, 0, width, height, self->_scale);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 && v17 && self->_useCache)
      {
        os_unfair_lock_lock(&self->_lockRequests);
        -[NSMutableDictionary setObject:forKey:](self->_iconCache, "setObject:forKey:", v16, v17);
        -[NSMutableArray addObject:](self->_iconCacheKeys, "addObject:", v17);
        os_unfair_lock_unlock(&self->_lockRequests);
      }
    }
  }
  if (a6 && v16)
    *a6 = objc_retainAutorelease(v16);

  return v17;
}

- (id)_cacheImageFromDownloaderCacheForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PKPaymentTransactionIconGenerator _iconForCacheKey:](self, "_iconForCacheKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[PKPaymentTransactionIconGenerator fileDownloader](self, "fileDownloader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cachedDataForURL:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 && self->_useCache)
        {
          os_unfair_lock_lock(&self->_lockRequests);
          -[NSMutableDictionary setObject:forKey:](self->_iconCache, "setObject:forKey:", v6, v5);
          -[NSMutableArray addObject:](self->_iconCacheKeys, "addObject:", v5);
          os_unfair_lock_unlock(&self->_lockRequests);
        }
      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_downloadLogoForURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKPaymentService *paymentService;
  PKPaymentService *v10;
  PKPaymentService *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (self->_hasNetworkAccess)
  {
    -[PKPaymentTransactionIconGenerator fileDownloader](self, "fileDownloader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__PKPaymentTransactionIconGenerator__downloadLogoForURL_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E3E65260;
    v13 = v7;
    objc_msgSend(v8, "downloadFromUrl:completionHandler:", v6, v12);

  }
  else
  {
    paymentService = self->_paymentService;
    if (!paymentService)
    {
      v10 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E0D672B0]);
      v11 = self->_paymentService;
      self->_paymentService = v10;

      paymentService = self->_paymentService;
    }
    -[PKPaymentService logoImageDataForURL:completion:](paymentService, "logoImageDataForURL:completion:", v6, v7);
  }

}

uint64_t __79__PKPaymentTransactionIconGenerator__downloadLogoForURL_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fileDownloader
{
  PKObjectDownloader *fileDownloader;
  PKObjectDownloader *v3;
  void *v5;
  void *v6;
  PKObjectDownloader *v7;
  PKObjectDownloader *v8;

  fileDownloader = self->_fileDownloader;
  if (fileDownloader || !self->_hasNetworkAccess)
  {
    v3 = fileDownloader;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeoutIntervalForResource:", 15.0);
    objc_msgSend(v5, "setRequestCachePolicy:", 0);
    objc_msgSend(v5, "setHTTPMaximumConnectionsPerHost:", 10);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PKObjectDownloader *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66EA8]), "initWithSession:", v6);
    v8 = self->_fileDownloader;
    self->_fileDownloader = v7;

    v3 = self->_fileDownloader;
  }
  return v3;
}

- (id)_iconCacheKeyForApp:(int64_t)a3 bundleIdentifier:(id)a4 size:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGSize v15;
  CGSize v16;

  height = a5.height;
  width = a5.width;
  v8 = a4;
  v9 = v8;
  if (a3 < 1)
  {
    if (!v8)
    {
      v13 = 0;
      goto LABEL_6;
    }
    v12 = (void *)MEMORY[0x1E0CB3940];
    v16.width = width;
    v16.height = height;
    NSStringFromCGSize(v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("app-%@-%@"), v9, v11);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v15.width = width;
    v15.height = height;
    NSStringFromCGSize(v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("app-%lu-%@"), a3, v11);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v13;
}

- (void)_iconForReleasedData:(id)a3 requestToProcess:(id)a4 iconHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v18, "releasedData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "application");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "client");

  if (v12 == 2)
  {
    objc_msgSend(v18, "merchant");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "adamIdentifier");
    objc_msgSend(v18, "releasedData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "application");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionIconGenerator _iconForApplication:applicationIdentifier:requestToProcess:iconHandler:](self, "_iconForApplication:applicationIdentifier:requestToProcess:iconHandler:", v14, v17, v8, v9);

  }
}

- (void)_iconForApplication:(int64_t)a3 applicationIdentifier:(id)a4 requestToProcess:(id)a5 iconHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, uint64_t);
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PKLinkedApplication *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  void *v28;
  PKLinkedApplication *v29;
  _QWORD v30[4];
  PKLinkedApplication *v31;
  PKPaymentTransactionIconGenerator *v32;
  id v33;
  id v34;
  void (**v35)(id, void *, uint64_t);
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *, uint64_t))a6;
  objc_msgSend(v11, "size");
  if (a3 > 0 || v10)
  {
    -[PKPaymentTransactionIconGenerator _iconCacheKeyForApp:bundleIdentifier:size:](self, "_iconCacheKeyForApp:bundleIdentifier:size:", a3, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionIconGenerator _iconForCacheKey:](self, "_iconForCacheKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v12[2](v12, v19, 1);
    }
    else
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
        a3 = objc_claimAutoreleasedReturnValue();

      }
      if (v10)
      {
        v36 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      v22 = -[PKLinkedApplication initWithApplicationIdentifiers:storeIDs:defaultLaunchURL:]([PKLinkedApplication alloc], "initWithApplicationIdentifiers:storeIDs:defaultLaunchURL:", v21, a3, 0);
      -[PKLinkedApplication setShouldApplyMask:](v22, "setShouldApplyMask:", 0);
      -[PKLinkedApplication setShouldApplyBorder:](v22, "setShouldApplyBorder:", 0);
      objc_msgSend(v11, "size");
      v24 = v23;
      v26 = v25;
      v27 = PKUIScreenScale();
      PKIconForMerchant(0, 0, 0, 1, v24, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v28, 0);
      os_unfair_lock_lock(&self->_lockRequests);
      -[NSMutableArray addObject:](self->_inflightRequests, "addObject:", v11);
      os_unfair_lock_unlock(&self->_lockRequests);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __108__PKPaymentTransactionIconGenerator__iconForApplication_applicationIdentifier_requestToProcess_iconHandler___block_invoke;
      v30[3] = &unk_1E3E669B8;
      v31 = v22;
      v32 = self;
      v33 = v18;
      v34 = v11;
      v35 = v12;
      v29 = v22;
      -[PKLinkedApplication reloadApplicationStateIfNecessaryWithCompletion:](v29, "reloadApplicationStateIfNecessaryWithCompletion:", v30);

    }
  }
  else
  {
    objc_msgSend(v11, "size");
    v14 = v13;
    v16 = v15;
    v17 = PKUIScreenScale();
    PKIconForMerchant(0, 0, 0, 1, v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v18, 1);
  }

}

void __108__PKPaymentTransactionIconGenerator__iconForApplication_applicationIdentifier_requestToProcess_iconHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "iconImage");
  v5 = objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 80));
  v2 = *(_QWORD *)(a1 + 40);
  if (v5 && *(_BYTE *)(v2 + 24) && *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(v2 + 8), "setObject:forKey:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", *(_QWORD *)(a1 + 48));
    v2 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend(*(id *)(v2 + 56), "removeObject:", *(_QWORD *)(a1 + 56));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 80));
  v3 = *(_QWORD *)(a1 + 64);
  v4 = (void *)v5;
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, v5, 1);
    v4 = (void *)v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_fileDownloader, 0);
  objc_storeStrong((id *)&self->_queueIcons, 0);
  objc_storeStrong((id *)&self->_inflightRequests, 0);
  objc_storeStrong((id *)&self->_lowPriorityIconRequests, 0);
  objc_storeStrong((id *)&self->_highPriorityIconRequests, 0);
  objc_storeStrong((id *)&self->_iconCacheKeys, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
}

@end

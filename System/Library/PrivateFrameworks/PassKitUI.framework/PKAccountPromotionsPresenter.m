@implementation PKAccountPromotionsPresenter

- (PKAccountPromotionsPresenter)initWithRemoteImagePreparer:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PKAccountPromotionsPresenter *v9;
  PKAccountPromotionsPresenter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountPromotionsPresenter;
  v9 = -[PKAccountPromotionsPresenter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_remoteImagePreparer, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)configureCell:(id)a3 withPromotion:(id)a4
{
  id v6;
  id v7;
  id v8;
  SEL v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  char v14;
  _QWORD aBlock[4];
  id v16;
  id v17;
  id v18;
  id location;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v20 = v7;
  if (v6 && v7)
  {
    v9 = NSSelectorFromString(CFSTR("configureWithPromotion:remoteImagePreparer:actionHandler:"));
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PKAccountPromotionsPresenter_configureCell_withPromotion___block_invoke;
    aBlock[3] = &unk_1E3E743F0;
    objc_copyWeak(&v17, &location);
    v16 = v8;
    v18 = _Block_copy(aBlock);
    objc_msgSend(v11, "setSelector:", v9);
    objc_msgSend(v11, "setArgument:atIndex:", &v20, 2);
    objc_msgSend(v11, "setArgument:atIndex:", &self->_remoteImagePreparer, 3);
    objc_msgSend(v11, "setArgument:atIndex:", &v18, 4);
    objc_msgSend(v11, "invokeWithTarget:", v6);
    v14 = 0;
    objc_msgSend(v11, "getReturnValue:", &v14);
    if (!v14)
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v20, "programIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Encountered error configuring account promotion view. Suppressing the view for identifier: %@", buf, 0xCu);

      }
    }
    objc_msgSend(v6, "setNeedsUpdateConfiguration");

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

    v8 = v20;
  }

}

void __60__PKAccountPromotionsPresenter_configureCell_withPromotion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "dispatchActionForLink:linkedApplication:promotion:", v7, v6, *(_QWORD *)(a1 + 32));

}

- (void)dispatchActionForLink:(id)a3 linkedApplication:(id)a4 promotion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  int v17;
  int v18;
  id *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  char v35;
  id *v36;
  id v37;
  id v38;
  void *v39;
  char v40;
  id *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  char v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  char v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  char v60;
  uint64_t v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  char v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[3];

  v80[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)*MEMORY[0x1E0D68230];
    v15 = v12;
    v16 = v15;
    if (v15 == v14)
    {
      v17 = 1;
    }
    else
    {
      if (!v15 || !v14)
      {

        goto LABEL_13;
      }
      v17 = objc_msgSend(v15, "isEqualToString:", v14);
    }

    if (v9 && v17)
    {
      v18 = objc_msgSend(v9, "isInstalled");
      v19 = (id *)MEMORY[0x1E0D68EC8];
      if (!v18)
        v19 = (id *)MEMORY[0x1E0D68CE8];
      v20 = *v19;
      v21 = *MEMORY[0x1E0D68B18];
      v22 = *MEMORY[0x1E0D68858];
      v79[0] = *MEMORY[0x1E0D68AA0];
      v79[1] = v22;
      v80[0] = v21;
      v80[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "reportEventIfNecessary:", v23);

      objc_msgSend(WeakRetained, "openLinkedApplication:", v9);
      goto LABEL_79;
    }
LABEL_13:
    v24 = (void *)*MEMORY[0x1E0D68238];
    v25 = v16;
    v26 = v24;
    if (v25 == v26)
    {

    }
    else
    {
      v27 = v26;
      if (!v25 || !v26)
      {

        goto LABEL_25;
      }
      v28 = objc_msgSend(v25, "isEqualToString:", v26);

      if (!v28)
      {
LABEL_25:
        v37 = v25;
        v38 = v14;
        if (v16 == v14)
        {
          v41 = (id *)MEMORY[0x1E0D68CE8];
        }
        else
        {
          v39 = v38;
          if (v25 && v38)
          {
            v40 = objc_msgSend(v37, "isEqualToString:", v38);

            if ((v40 & 1) != 0)
            {
              v41 = (id *)MEMORY[0x1E0D68CE8];
              goto LABEL_47;
            }
          }
          else
          {

          }
          v47 = (void *)*MEMORY[0x1E0D68228];
          v48 = v37;
          v49 = v47;
          if (v48 != v49)
          {
            v50 = v49;
            if (v25 && v49)
            {
              v51 = objc_msgSend(v48, "isEqualToString:", v49);

              if ((v51 & 1) != 0)
              {
                v41 = (id *)MEMORY[0x1E0D68EE0];
                goto LABEL_47;
              }
            }
            else
            {

            }
            v20 = 0;
LABEL_57:
            v61 = 0;
LABEL_78:
            objc_msgSend(WeakRetained, "openURL:sensitive:preferInApp:", v13, 0, v61);
LABEL_79:

            goto LABEL_80;
          }
          v41 = (id *)MEMORY[0x1E0D68EE0];
        }

LABEL_47:
        v52 = *v41;
        v20 = v52;
        if (v52)
        {
          v53 = *MEMORY[0x1E0D68B18];
          v54 = *MEMORY[0x1E0D68858];
          v77[0] = *MEMORY[0x1E0D68AA0];
          v77[1] = v54;
          v78[0] = v53;
          v78[1] = v52;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "reportEventIfNecessary:", v55);

        }
        goto LABEL_57;
      }
    }
    objc_msgSend(v10, "layout");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "templateIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)*MEMORY[0x1E0D68278];
    v32 = v30;
    v33 = v31;
    if (v32 == v33)
    {
      v36 = (id *)MEMORY[0x1E0D687B0];
    }
    else
    {
      v34 = v33;
      if (v32 && v33)
      {
        v35 = objc_msgSend(v32, "isEqualToString:", v33);

        if ((v35 & 1) != 0)
        {
          v36 = (id *)MEMORY[0x1E0D687B0];
          goto LABEL_74;
        }
      }
      else
      {

      }
      v42 = (void *)*MEMORY[0x1E0D68258];
      v43 = v32;
      v44 = v42;
      if (v43 == v44)
      {
        v36 = (id *)MEMORY[0x1E0D68798];
      }
      else
      {
        v45 = v44;
        if (v32 && v44)
        {
          v46 = objc_msgSend(v43, "isEqualToString:", v44);

          if ((v46 & 1) != 0)
          {
            v36 = (id *)MEMORY[0x1E0D68798];
            goto LABEL_74;
          }
        }
        else
        {

        }
        v56 = (void *)*MEMORY[0x1E0D68270];
        v57 = v43;
        v58 = v56;
        if (v57 == v58)
        {
          v36 = (id *)MEMORY[0x1E0D687B8];
        }
        else
        {
          v59 = v58;
          if (v32 && v58)
          {
            v60 = objc_msgSend(v57, "isEqualToString:", v58);

            if ((v60 & 1) != 0)
            {
              v36 = (id *)MEMORY[0x1E0D687B8];
              goto LABEL_74;
            }
          }
          else
          {

          }
          v62 = (void *)*MEMORY[0x1E0D68268];
          v63 = v57;
          v64 = v62;
          if (v63 == v64)
          {
            v36 = (id *)MEMORY[0x1E0D687A8];
          }
          else
          {
            v65 = v64;
            if (v32 && v64)
            {
              v66 = objc_msgSend(v63, "isEqualToString:", v64);

              if ((v66 & 1) != 0)
              {
                v36 = (id *)MEMORY[0x1E0D687A8];
                goto LABEL_74;
              }
            }
            else
            {

            }
            v67 = (void *)*MEMORY[0x1E0D68260];
            v68 = v63;
            v69 = v67;
            if (v68 != v69)
            {
              v70 = v69;
              if (!v32 || !v69)
              {

                goto LABEL_76;
              }
              v71 = objc_msgSend(v68, "isEqualToString:", v69);

              if ((v71 & 1) == 0)
              {
LABEL_76:

                goto LABEL_77;
              }
              v36 = (id *)MEMORY[0x1E0D687A0];
LABEL_74:
              v68 = *v36;

              if (!v68)
              {
LABEL_77:
                v20 = 0;
                v61 = 1;
                goto LABEL_78;
              }
              v72 = *MEMORY[0x1E0D68C08];
              v73 = *MEMORY[0x1E0D69438];
              v75[0] = *MEMORY[0x1E0D68AA0];
              v75[1] = v73;
              v76[0] = v72;
              v76[1] = v68;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "reportEventIfNecessary:", v74);

              goto LABEL_76;
            }
            v36 = (id *)MEMORY[0x1E0D687A0];
          }
        }
      }
    }

    goto LABEL_74;
  }
LABEL_80:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteImagePreparer, 0);
}

@end

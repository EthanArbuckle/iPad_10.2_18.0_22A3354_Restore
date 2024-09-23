@implementation PKPassDeleteAnimationController

+ (void)performPassbookDeleteWithView:(id)a3 inSuperview:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
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
  void *v53;
  void *v54;
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  dispatch_time_t v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  _QWORD block[4];
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;

  v7 = a3;
  v89 = a5;
  v8 = a4;
  objc_msgSend(v7, "frame");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v9, v10, v11, v12);
  objc_msgSend(v13, "setClipsToBounds:", 1);
  objc_msgSend(v8, "addSubview:", v13);

  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v90 = v7;
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v13, "addSubview:", v7);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = 1.0 / v19;

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, v15, v20);
  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBackgroundColor:", v22);

  objc_msgSend(v21, "setAlpha:", 0.83);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, v17, v15, v20);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.07, 0.07, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v24);

  objc_msgSend(v23, "setAlpha:", 0.83);
  objc_msgSend(v13, "addSubview:", v21);
  objc_msgSend(v13, "addSubview:", v23);
  v25 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v26) = 1046809695;
  LODWORD(v27) = 990250344;
  LODWORD(v28) = 1057860847;
  LODWORD(v29) = 1064564184;
  v30 = objc_msgSend(v25, "initWithControlPoints::::", v26, v27, v28, v29);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("bounds"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F10], "_setAnimationAttributes:", v31);
  objc_msgSend(v31, "setMass:", 2.0);
  objc_msgSend(v31, "setStiffness:", 300.0);
  objc_msgSend(v31, "setDamping:", 400.0);
  v84 = v31;
  objc_msgSend(v31, "setTimingFunction:", v30);
  objc_msgSend(v13, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "valueForKey:", CFSTR("bounds"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFromValue:", v33);

  v34 = *MEMORY[0x1E0CD2B50];
  v83 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v31, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v31, "setDuration:", 0.91);
  LODWORD(v35) = 1068708659;
  objc_msgSend(v31, "setSpeed:", v35);
  v85 = v13;
  objc_msgSend(v13, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addAnimation:forKey:", v31, CFSTR("bounds"));

  objc_msgSend(v13, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBounds:", 0.0, 0.0, v15, 0.5);

  v38 = v15 * 0.5;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F10], "_setAnimationAttributes:", v39);
  objc_msgSend(v39, "setMass:", 2.0);
  objc_msgSend(v39, "setStiffness:", 300.0);
  objc_msgSend(v39, "setDamping:", 400.0);
  v40 = (void *)v30;
  objc_msgSend(v39, "setTimingFunction:", v30);
  objc_msgSend(v39, "setFillMode:", v34);
  objc_msgSend(v39, "setDuration:", 0.91);
  LODWORD(v41) = 1068708659;
  objc_msgSend(v39, "setSpeed:", v41);
  v42 = (void *)objc_msgSend(v39, "copy");
  objc_msgSend(MEMORY[0x1E0DC3F10], "_setAnimationAttributes:", v42);
  objc_msgSend(v90, "valueForKey:", CFSTR("position"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v42;
  objc_msgSend(v42, "setFromValue:", v43);

  objc_msgSend(v90, "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addAnimation:forKey:", v42, CFSTR("position"));

  objc_msgSend(v90, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setPosition:", v38, 0.0);

  v46 = (void *)objc_msgSend(v39, "copy");
  objc_msgSend(MEMORY[0x1E0DC3F10], "_setAnimationAttributes:", v46);
  objc_msgSend(v21, "valueForKey:", CFSTR("position"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v46;
  objc_msgSend(v46, "setFromValue:", v47);

  v48 = v21;
  objc_msgSend(v21, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addAnimation:forKey:", v46, CFSTR("position"));

  v50 = (void *)objc_msgSend(v39, "copy");
  objc_msgSend(MEMORY[0x1E0DC3F10], "_setAnimationAttributes:");
  objc_msgSend(v23, "valueForKey:", CFSTR("position"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v50;
  objc_msgSend(v50, "setFromValue:", v51);

  objc_msgSend(v23, "layer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addAnimation:forKey:", v50, CFSTR("position"));

  objc_msgSend(v21, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setPosition:", v38, 0.0);

  objc_msgSend(v23, "layer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setPosition:", v38, 0.0);

  v55 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v56) = 1036831949;
  LODWORD(v57) = 0.25;
  LODWORD(v58) = 0.25;
  LODWORD(v59) = 1.0;
  v60 = objc_msgSend(v55, "initWithControlPoints::::", v57, v56, v58, v59);

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F10], "_setAnimationAttributes:", v61);
  objc_msgSend(v61, "setDuration:", 0.41);
  objc_msgSend(v48, "layer");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "valueForKey:", CFSTR("opacity"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setFromValue:", v63);

  objc_msgSend(v61, "setFillMode:", v83);
  objc_msgSend(v61, "setBeginTime:", CACurrentMediaTime() + 0.5);
  v82 = (void *)v60;
  objc_msgSend(v61, "setTimingFunction:", v60);
  objc_msgSend(v48, "layer");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addAnimation:forKey:", v61, CFSTR("opacity"));

  objc_msgSend(v23, "layer");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addAnimation:forKey:", v61, CFSTR("opacity"));

  objc_msgSend(v48, "layer");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v67) = 0;
  objc_msgSend(v66, "setOpacity:", v67);

  objc_msgSend(v23, "layer");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v69) = 0;
  objc_msgSend(v68, "setOpacity:", v69);

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F10], "_setAnimationAttributes:", v70);
  objc_msgSend(v70, "setDuration:", 0.115);
  objc_msgSend(v90, "layer");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "valueForKey:", CFSTR("opacity"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setFromValue:", v72);

  objc_msgSend(v70, "setFillMode:", v83);
  objc_msgSend(v70, "setBeginTime:", CACurrentMediaTime() + 0.28);
  objc_msgSend(v70, "setTimingFunction:", v60);
  objc_msgSend(v90, "layer");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addAnimation:forKey:", v70, CFSTR("opacity"));

  objc_msgSend(v90, "layer");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v75) = 0;
  objc_msgSend(v74, "setOpacity:", v75);

  v76 = dispatch_time(0, 740000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PKPassDeleteAnimationController_performPassbookDeleteWithView_inSuperview_completion___block_invoke;
  block[3] = &unk_1E3E669B8;
  v92 = v90;
  v93 = v48;
  v94 = v23;
  v95 = v85;
  v96 = v89;
  v77 = v89;
  v78 = v85;
  v79 = v23;
  v80 = v48;
  v81 = v90;
  dispatch_after(v76, MEMORY[0x1E0C80D38], block);

}

uint64_t __88__PKPassDeleteAnimationController_performPassbookDeleteWithView_inSuperview_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (PKPassDeleteAnimationController)initWithPassView:(id)a3 groupView:(id)a4
{
  id v7;
  id v8;
  PKPassDeleteAnimationController *v9;
  PKPassDeleteAnimationController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPassDeleteAnimationController;
  v9 = -[PKPassDeleteAnimationController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passView, a3);
    objc_storeStrong((id *)&v10->_groupView, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPassDeleteAnimationController _unregisterForEnterBackgroundNotification](self, "_unregisterForEnterBackgroundNotification");
  v3.receiver = self;
  v3.super_class = (Class)PKPassDeleteAnimationController;
  -[PKPassDeleteAnimationController dealloc](&v3, sel_dealloc);
}

- (void)showInViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __CFString *v13;
  NSString *v14;
  void *v15;
  UIAlertController *v16;
  UIAlertController *alertController;
  UIAlertController *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  UIAlertController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;

  v4 = a3;
  -[PKPassView pass](self->_passView, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v5;
  v27 = v4;
  if (objc_msgSend(v5, "passType") == 1)
  {
    objc_msgSend(v5, "paymentPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isAccessPass"))
    {
      objc_msgSend(v6, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("DELETE_CARD_SHEET_TITLE"), CFSTR("%@"), v7, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

      PKLocalizedPaymentString(CFSTR("DELETE_CARD_SHEET_CANCEL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("DELETE_CARD_SHEET_CONFIRM"));
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (objc_msgSend(v6, "supportsBarcodePayment"))
    {
      PKLocalizedAquamanString(CFSTR("DELETE_ACCOUNT_SHEET_MESSAGE"));
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v6, "isIdentityPass"))
      {
        v12 = objc_msgSend(v6, "identityType");
        if (v12 < 2)
        {
          v13 = CFSTR("DELETE_DL_SHEET_MESSAGE");
        }
        else if (v12 == 3)
        {
          v13 = CFSTR("DELETE_NID_SHEET_MESSAGE");
        }
        else
        {
          if (v12 != 2)
          {
            v7 = 0;
            goto LABEL_18;
          }
          v13 = CFSTR("DELETE_STATE_ID_SHEET_MESSAGE");
        }
        PKDeviceSpecificLocalizedStringKeyForKey(v13, 0);
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        PKLocalizedIdentityString(v14);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
        objc_msgSend(v6, "localizedDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        PKStringWithValidatedFormat();
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
      PKLocalizedPaymentString(CFSTR("DELETE_CARD_SHEET_MESSAGE"));
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v11;
    goto LABEL_18;
  }
  PKLocalizedString(CFSTR("REMOVE_SHEET_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("REMOVE_SHEET_CANCEL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("REMOVE_SHEET_CONFIRM"));
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_20:
  v15 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, 0, 0, v25);
  v16 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alertController = self->_alertController;
  self->_alertController = v16;

  objc_initWeak(&location, self);
  v18 = self->_alertController;
  v19 = (void *)MEMORY[0x1E0DC3448];
  v20 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __56__PKPassDeleteAnimationController_showInViewController___block_invoke;
  v30[3] = &unk_1E3E63F88;
  objc_copyWeak(&v31, &location);
  objc_msgSend(v19, "actionWithTitle:style:handler:", v9, 1, v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v18, "addAction:", v21);

  v22 = self->_alertController;
  v23 = (void *)MEMORY[0x1E0DC3448];
  v28[0] = v20;
  v28[1] = 3221225472;
  v28[2] = __56__PKPassDeleteAnimationController_showInViewController___block_invoke_2;
  v28[3] = &unk_1E3E63F88;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v23, "actionWithTitle:style:handler:", v15, 2, v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v22, "addAction:", v24);

  objc_msgSend(v27, "presentViewController:animated:completion:", self->_alertController, 1, 0);
  -[PKPassDeleteAnimationController _registerForEnterBackgroundNotification](self, "_registerForEnterBackgroundNotification");
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

void __56__PKPassDeleteAnimationController_showInViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_unregisterForEnterBackgroundNotification");
    objc_msgSend(v2, "finished:", 0);
    WeakRetained = v2;
  }

}

void __56__PKPassDeleteAnimationController_showInViewController___block_invoke_2(uint64_t a1)
{
  id *v1;
  id *WeakRetained;
  id *v3;
  void *v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_unregisterForEnterBackgroundNotification");
    objc_msgSend(v3[4], "beginSuppressingPageControl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = dispatch_time(0, 710000000);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__PKPassDeleteAnimationController_showInViewController___block_invoke_3;
    v7[3] = &unk_1E3E61C80;
    objc_copyWeak(&v9, v1);
    v8 = v4;
    v6 = v4;
    dispatch_after(v5, MEMORY[0x1E0C80D38], v7);

    objc_destroyWeak(&v9);
  }

}

void __56__PKPassDeleteAnimationController_showInViewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_startAnimationWithCompletion:", v3);
LABEL_5:
    WeakRetained = v4;
    goto LABEL_6;
  }
  if (v3)
  {
    v4 = 0;
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)forceDeleteAnimation
{
  id v3;

  -[PKPassGroupView beginSuppressingPageControl](self->_groupView, "beginSuppressingPageControl");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassDeleteAnimationController _startAnimationWithCompletion:](self, "_startAnimationWithCompletion:", v3);

}

- (void)finished:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "deleteAnimationController:didComplete:", self, v3);

}

- (void)_startAnimationWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "deleteAnimationControllerWillBeginDeleteAnimation:", self);
  -[PKPassView sizeToFit](self->_passView, "sizeToFit");
  -[PKPassView snapshotViewOfVisibleFaceAfterScreenUpdates:](self->_passView, "snapshotViewOfVisibleFaceAfterScreenUpdates:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassView superview](self->_passView, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassView removeFromSuperview](self->_passView, "removeFromSuperview");
  v8 = (void *)objc_opt_class();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PKPassDeleteAnimationController__startAnimationWithCompletion___block_invoke;
  v10[3] = &unk_1E3E669E0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "performPassbookDeleteWithView:inSuperview:completion:", v6, v7, v10);

}

uint64_t __65__PKPassDeleteAnimationController__startAnimationWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "finished:", a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_registerForEnterBackgroundNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

}

- (void)_unregisterForEnterBackgroundNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);

}

- (void)_applicationDidEnterBackground:(id)a3
{
  -[PKPassDeleteAnimationController _unregisterForEnterBackgroundNotification](self, "_unregisterForEnterBackgroundNotification", a3);
  -[PKPassDeleteAnimationController finished:](self, "finished:", 0);
  -[UIAlertController dismissViewControllerAnimated:completion:](self->_alertController, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (PKPassDeleteAnimationControllerDelegate)delegate
{
  return (PKPassDeleteAnimationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPassView)passView
{
  return self->_passView;
}

- (PKPassGroupView)groupView
{
  return self->_groupView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupView, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end

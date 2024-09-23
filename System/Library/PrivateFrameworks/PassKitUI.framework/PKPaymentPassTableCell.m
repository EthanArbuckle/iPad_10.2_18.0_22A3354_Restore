@implementation PKPaymentPassTableCell

- (PKPaymentPassTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PKPaymentPassTableCell *v9;
  PKPaymentPassTableCell *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPassTableCell;
  v9 = -[PKPaymentPassTableCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v10 = v9;
  if (v9)
  {
    -[PKPaymentPassTableCell setSpecifier:](v9, "setSpecifier:", v8);
    -[PKPaymentPassTableCell setAutoresizingMask:](v10, "setAutoresizingMask:", 18);
  }

  return v10;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentPassTableCell;
  -[PSTableCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UILabel setText:](self->_subTextLabel, "setText:", 0);
  self->_showActionButton = 0;
  self->_showSpinner = 0;
  self->_showSnapshotSpinner = 0;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentPassTableCell;
  -[PSTableCell dealloc](&v2, sel_dealloc);
}

+ (id)titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (id)subTitleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (double)heightForCellWithMinimum:(double)a3 hasSubTitle:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double result;

  v4 = a4;
  objc_msgSend(a1, "titleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineHeight");
  v9 = v8;

  if (v4)
  {
    objc_msgSend(a1, "subTitleFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lineHeight");
    v9 = v9 + v11;

  }
  result = v9 + 16.0;
  if (v9 + 16.0 <= a3)
    return a3;
  return result;
}

- (PKPassFaceViewRendererState)rendererState
{
  return -[PKPassView rendererState](self->_passView, "rendererState");
}

- (void)setPass:(id)a3 passView:(id)a4
{
  PKPaymentPass *v7;
  PKPassView *v8;
  PKPassView *v9;
  PKPaymentPass **p_pass;
  unsigned int v11;
  PKPaymentApplication *v12;
  PKPaymentApplication *paymentApplication;
  PKPassView **p_passView;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  void *v22;
  UIActivityIndicatorView *snapshotSpinner;
  UIActivityIndicatorView *v24;
  UIActivityIndicatorView *v25;
  void *v26;
  PKPaymentPass *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  PKPaymentPassTableCell *v33;
  id v34;
  id v35;
  unsigned int v36;
  CATransform3D v37;

  v7 = (PKPaymentPass *)a3;
  v8 = (PKPassView *)a4;
  v9 = v8;
  p_pass = &self->_pass;
  if (self->_pass != v7 || self->_passView != v8)
  {
    v11 = self->_snapshotCounter + 1;
    self->_snapshotCounter = v11;
    objc_storeStrong((id *)&self->_pass, a3);
    -[PKPaymentPass devicePrimaryPaymentApplication](*p_pass, "devicePrimaryPaymentApplication");
    v12 = (PKPaymentApplication *)objc_claimAutoreleasedReturnValue();
    paymentApplication = self->_paymentApplication;
    self->_paymentApplication = v12;

    p_passView = &self->_passView;
    -[PKPassView removeFromSuperview](self->_passView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_passView, a4);
    if (*p_pass)
      -[PKPaymentPass style](*p_pass, "style");
    PKPassFrontFaceContentSize();
    PKSizeAspectFit();
    v16 = v15;
    v18 = v17;
    -[PKPaymentPassTableCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (*p_passView)
    {
      -[PKPassView sizeOfFrontFace](*p_passView, "sizeOfFrontFace");
      v21 = v16 / v20;
      -[PKPassView layer](*p_passView, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CATransform3DMakeScale(&v37, v21, v21, 1.0);
      objc_msgSend(v22, "setTransform:", &v37);

      -[PKPassView setUserInteractionEnabled:](*p_passView, "setUserInteractionEnabled:", 0);
      -[PKPassView setAccessibilityElementsHidden:](*p_passView, "setAccessibilityElementsHidden:", 1);
      objc_msgSend(v19, "addSubview:", *p_passView);
    }
    else
    {
      self->_showSnapshotSpinner = 1;
      snapshotSpinner = self->_snapshotSpinner;
      if (!snapshotSpinner)
      {
        v24 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        v25 = self->_snapshotSpinner;
        self->_snapshotSpinner = v24;

        -[UIActivityIndicatorView startAnimating](self->_snapshotSpinner, "startAnimating");
        snapshotSpinner = self->_snapshotSpinner;
      }
      objc_msgSend(v19, "addSubview:", snapshotSpinner);
      -[UIImageView setImage:](self->_cardSnapshotView, "setImage:", 0);
      +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *p_pass;
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __43__PKPaymentPassTableCell_setPass_passView___block_invoke;
      v32 = &unk_1E3E71708;
      v33 = self;
      v36 = v11;
      v34 = v19;
      v35 = v26;
      v28 = v26;
      objc_msgSend(v28, "snapshotWithPass:size:completion:", v27, &v29, v16, v18);

    }
    -[PKPaymentPassTableCell setNeedsLayout](self, "setNeedsLayout", v29, v30, v31, v32, v33);
    -[PKPaymentPassTableCell updateSubtitleForTransitProperties](self, "updateSubtitleForTransitProperties");

  }
}

void __43__PKPaymentPassTableCell_setPass_passView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  int v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PKPaymentPassTableCell_setPass_passView___block_invoke_2;
  v6[3] = &unk_1E3E716E0;
  v9 = *(_DWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __43__PKPaymentPassTableCell_setPass_passView___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  id *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;

  v1 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(v1 + 1216) == *(_DWORD *)(result + 56))
  {
    v2 = (id *)result;
    v3 = *(void **)(v1 + 1240);
    if (v3)
    {
      objc_msgSend(v3, "setImage:", v2[5]);
      objc_msgSend(*((id *)v2[4] + 155), "sizeToFit");
    }
    else
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v2[5]);
      v5 = v2[4];
      v6 = (void *)v5[155];
      v5[155] = v4;

      objc_msgSend(*((id *)v2[4] + 155), "setAccessibilityIgnoresInvertColors:", 1);
      objc_msgSend(*((id *)v2[4] + 155), "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2[5], "size");
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "CGColor");
      PKPaymentStyleApplyCorners();

      objc_msgSend(v2[6], "addSubview:", *((_QWORD *)v2[4] + 155));
    }
    objc_msgSend(*((id *)v2[4] + 153), "removeFromSuperview");
    *((_BYTE *)v2[4] + 1290) = 0;
    return objc_msgSend(v2[4], "setNeedsLayout");
  }
  return result;
}

- (void)layoutSubviews
{
  int v3;
  CGRectEdge v4;
  CGRectEdge v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  UIControl *actionButton;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  UIActivityIndicatorView *spinner;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  UIActivityIndicatorView *snapshotSpinner;
  PKPassView *passView;
  UIImageView *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  CALayer *v41;
  CALayer *cardSnapshotMask;
  CALayer *v43;
  CALayer *v44;
  CALayer *v45;
  id v46;
  void *v47;
  CALayer *v48;
  CGFloat x;
  double y;
  CGFloat height;
  CGFloat width;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double MaxY;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  CGFloat v72;
  CGRect slice;
  CGRect v74;
  CGRect remainder;
  objc_super v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v76.receiver = self;
  v76.super_class = (Class)PKPaymentPassTableCell;
  -[PSTableCell layoutSubviews](&v76, sel_layoutSubviews);
  v3 = -[PKPaymentPassTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v3)
    v4 = CGRectMaxXEdge;
  else
    v4 = CGRectMinXEdge;
  if (v3)
    v5 = CGRectMinXEdge;
  else
    v5 = CGRectMaxXEdge;
  -[PKPaymentPassTableCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  memset(&remainder, 0, sizeof(remainder));
  memset(&v74, 0, sizeof(v74));
  v15 = 0.0;
  if (self->_showActionButton)
  {
    actionButton = self->_actionButton;
    if (actionButton)
    {
      memset(&slice, 0, sizeof(slice));
      -[UIControl frame](actionButton, "frame");
      v18 = v17 + 16.0;
      v77.origin.x = v8;
      v77.origin.y = v10;
      v77.size.width = v12;
      v77.size.height = v14;
      CGRectDivide(v77, &slice, &remainder, v18, v5);
      -[UIControl frame](self->_actionButton, "frame");
      UIRectCenteredIntegralRect();
      slice.origin.x = v19;
      slice.origin.y = v20;
      slice.size.width = v21;
      slice.size.height = v22;
      -[UIControl setFrame:](self->_actionButton, "setFrame:");
      v78.origin.x = v8;
      v78.origin.y = v10;
      v78.size.width = v12;
      v78.size.height = v14;
      v15 = fmax(CGRectGetMaxX(v78) - slice.origin.x + 8.0, 0.0);
    }
  }
  if (self->_showSpinner)
  {
    spinner = self->_spinner;
    if (spinner)
    {
      memset(&slice, 0, sizeof(slice));
      -[UIActivityIndicatorView frame](spinner, "frame");
      v25 = v24 + 16.0;
      v79.origin.x = v8;
      v79.origin.y = v10;
      v79.size.width = v12;
      v79.size.height = v14;
      CGRectDivide(v79, &slice, &remainder, v25, v5);
      -[UIActivityIndicatorView frame](self->_spinner, "frame");
      UIRectCenteredIntegralRect();
      slice.origin.x = v26;
      slice.origin.y = v27;
      slice.size.width = v28;
      slice.size.height = v29;
      -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
      v80.origin.x = v8;
      v80.origin.y = v10;
      v80.size.width = v12;
      v80.size.height = v14;
      v15 = fmax(v15, CGRectGetMaxX(v80) - slice.origin.x + 8.0);
    }
  }
  remainder.origin.x = v8;
  remainder.origin.y = v10;
  remainder.size.width = v12;
  remainder.size.height = v14;
  v81.origin.x = v8;
  v81.origin.y = v10;
  v81.size.width = v12;
  v81.size.height = v14;
  CGRectDivide(v81, &v74, &remainder, 16.0, v4);
  CGRectDivide(remainder, &v74, &remainder, v15, v5);
  CGRectDivide(remainder, &v74, &remainder, 66.0, v4);
  if (self->_showSnapshotSpinner)
  {
    snapshotSpinner = self->_snapshotSpinner;
    if (snapshotSpinner)
    {
      -[UIActivityIndicatorView frame](self->_snapshotSpinner, "frame");
      PKSizeAlignedInRect();
      -[UIActivityIndicatorView setFrame:](snapshotSpinner, "setFrame:");
    }
  }
  passView = self->_passView;
  if (passView)
  {
    v32 = passView;
  }
  else
  {
    v32 = self->_cardSnapshotView;
    if (!v32)
      goto LABEL_27;
  }
  -[UIImageView frame](v32, "frame");
  PKSizeAlignedInRect();
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = fmax(v39, v74.origin.y + 8.0);
  -[UIImageView setFrame:](v32, "setFrame:", v33, v40, v35);
  v82.origin.x = v34;
  v82.origin.y = v40;
  v82.size.width = v36;
  v82.size.height = v38;
  v88.origin.x = v8;
  v88.origin.y = v10;
  v88.size.width = v12;
  v88.size.height = v14;
  v83 = CGRectUnion(v82, v88);
  v89.origin.x = v8;
  v89.origin.y = v10;
  v89.size.width = v12;
  v89.size.height = v14;
  if (CGRectEqualToRect(v83, v89))
  {
    v41 = 0;
  }
  else
  {
    cardSnapshotMask = self->_cardSnapshotMask;
    if (!cardSnapshotMask)
    {
      v43 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      v44 = self->_cardSnapshotMask;
      self->_cardSnapshotMask = v43;

      v45 = self->_cardSnapshotMask;
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setBackgroundColor:](v45, "setBackgroundColor:", objc_msgSend(v46, "CGColor"));

      cardSnapshotMask = self->_cardSnapshotMask;
    }
    v84.origin.x = v8;
    v84.origin.y = v10;
    v84.size.width = v12;
    v84.size.height = v14;
    v90.origin.x = v34;
    v90.origin.y = v40;
    v90.size.width = v36;
    v90.size.height = v38;
    v85 = CGRectIntersection(v84, v90);
    -[UIImageView convertRect:fromView:](v32, "convertRect:fromView:", v6, v85.origin.x, v85.origin.y, v85.size.width, v85.size.height);
    -[CALayer setFrame:](cardSnapshotMask, "setFrame:");
    v41 = self->_cardSnapshotMask;
  }
  -[UIImageView layer](v32, "layer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "mask");
  v48 = (CALayer *)objc_claimAutoreleasedReturnValue();

  if (v41 != v48)
    objc_msgSend(v47, "setMask:", v41);

LABEL_27:
  CGRectDivide(remainder, &v74, &remainder, 10.0, v4);
  x = remainder.origin.x;
  y = remainder.origin.y;
  width = remainder.size.width;
  height = remainder.size.height;
  -[UILabel frame](self->_mainLabel, "frame");
  PKSizeAlignedInRect();
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  -[UILabel text](self->_subTextLabel, "text");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "length");

  if (v62)
  {
    v71 = width;
    v72 = x;
    -[UILabel frame](self->_subTextLabel, "frame");
    v64 = v63;
    PKFloatRoundToPixel();
    v66 = y + fmax(v65, 0.0);
    v56 = 8.0;
    if (v66 <= 8.0)
    {
      v87.origin.x = v54;
      v87.origin.y = v66;
      v87.size.width = v58;
      v87.size.height = v60;
      MaxY = CGRectGetMaxY(v87);
      v56 = v66;
    }
    else
    {
      v86.size.width = v71;
      v86.origin.x = v72;
      v86.origin.y = y;
      v86.size.height = height;
      MaxY = CGRectGetMaxY(v86) + -8.0 - v64;
    }
    -[UILabel setFrame:](self->_subTextLabel, "setFrame:", v54, MaxY, v58, v64);
  }
  -[UILabel setFrame:](self->_mainLabel, "setFrame:", v54, v56, v58, v60);
  if (self->_showFullSeparatorInset)
  {
    v68 = *MEMORY[0x1E0DC49E8];
    v54 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v69 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v70 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    v68 = 0.0;
    v69 = 0.0;
    v70 = 0.0;
  }
  -[PKPaymentPassTableCell setSeparatorInset:](self, "setSeparatorInset:", v68, v54, v69, v70);

}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  -[PKPaymentPassTableCell tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIControl setTintColor:](self->_actionButton, "setTintColor:", v3);
  if (self->_showState
    && -[PKPaymentPass activationState](self->_pass, "activationState") != PKPaymentPassActivationStateRequiresActivation
    && -[PKPaymentPass activationState](self->_pass, "activationState"))
  {
    -[UILabel setColor:](self->_subTextLabel, "setColor:", v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPassTableCell;
  -[PKPaymentPassTableCell tintColorDidChange](&v4, sel_tintColorDidChange);

}

- (void)presentVerificationViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id WeakRetained;

  if (a3)
  {
    if (self->_verificationController)
    {
      v6 = a4;
      v8 = a5;
      v9 = a3;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "requestPresentationOfViewController:animated:completion:", v9, v6, v8);

      objc_storeWeak((id *)&self->_verificationViewController, v9);
    }
  }
}

- (void)dismissVerificationViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UIViewController **p_verificationViewController;
  id WeakRetained;

  v3 = a3;
  p_verificationViewController = &self->_verificationViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_verificationViewController);
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", v3, 0);

  objc_storeWeak((id *)p_verificationViewController, 0);
}

- (void)didChangeVerificationPresentation
{
  if (self->_verificationController)
    -[UIControl setEnabled:](self->_actionButton, "setEnabled:", -[PKPaymentVerificationController shouldDisabledVerificationButton](self->_verificationController, "shouldDisabledVerificationButton") ^ 1);
}

- (id)_stringForPassState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v6;
  void *v7;

  v6 = CFSTR("PAYMENT_CARD_STATE_VERIFY");
  switch(a3)
  {
    case 1uLL:
      goto LABEL_9;
    case 2uLL:
      v6 = CFSTR("PAYMENT_CARD_STATE_ACTIVATING");
      goto LABEL_9;
    case 3uLL:
      if (-[PKPaymentApplication state](self->_paymentApplication, "state", v3, v4) == 7)
        v6 = CFSTR("PAYMENT_CARD_STATE_SUSPENDED_LOSTMODE");
      else
        v6 = CFSTR("PAYMENT_CARD_STATE_SUSPENDED");
      goto LABEL_9;
    case 4uLL:
      v6 = CFSTR("PAYMENT_CARD_STATE_DEACTIVATED");
LABEL_9:
      PKLocalizedPaymentString(&v6->isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

- (void)_verifyButtonPressed:(id)a3
{
  id v4;
  PKPaymentSetupDismissibleNavigationController *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PKPaymentPass *pass;
  PKPaymentVerificationController *verificationController;
  PKPaymentSetupDismissibleNavigationController *v12;
  _QWORD v13[4];
  PKPaymentSetupDismissibleNavigationController *v14;
  id v15;
  id location;

  v4 = a3;
  v5 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", -[PKPaymentVerificationController context](self->_verificationController, "context"));
  -[PKPaymentSetupDismissibleNavigationController useStandardPlatformPresentationStyle](v5, "useStandardPlatformPresentationStyle");
  v6 = objc_alloc(MEMORY[0x1E0D67230]);
  -[PKPaymentVerificationController webService](self->_verificationController, "webService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithWebService:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 4, v8, 0);
  objc_msgSend(v9, "setIsFollowupProvisioning:", 1);
  objc_initWeak(&location, self);
  pass = self->_pass;
  verificationController = self->_verificationController;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__PKPaymentPassTableCell__verifyButtonPressed___block_invoke;
  v13[3] = &unk_1E3E61B68;
  objc_copyWeak(&v15, &location);
  v12 = v5;
  v14 = v12;
  +[PKProvisioningFlowBridge startVerificationFlowWithNavController:context:pass:verificationController:presentNavController:](PKProvisioningFlowBridge, "startVerificationFlowWithNavController:context:pass:verificationController:presentNavController:", v12, v9, pass, verificationController, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __47__PKPaymentPassTableCell__verifyButtonPressed___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 163);
    objc_msgSend(v3, "requestPresentationOfViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);

    WeakRetained = v4;
  }

}

- (void)_addButtonPressed:(id)a3
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "addButtonPressedForPaymentPass:", self->_pass);
    WeakRetained = v5;
  }

}

- (void)_configureMainLabelWithText:(id)a3
{
  id v4;
  UILabel *mainLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  mainLabel = self->_mainLabel;
  v11 = v4;
  if (!mainLabel)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v7 = self->_mainLabel;
    self->_mainLabel = v6;

    v8 = self->_mainLabel;
    objc_msgSend((id)objc_opt_class(), "titleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    v4 = v11;
    mainLabel = self->_mainLabel;
  }
  -[UILabel setText:](mainLabel, "setText:", v4);
  -[UILabel sizeToFit](self->_mainLabel, "sizeToFit");
  -[PKPaymentPassTableCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_mainLabel);

}

- (void)_configureActionButtonWithTitle:(id)a3
{
  id v4;
  UIControl *actionButton;
  UIControl *v6;
  UIControl *v7;
  UIControl *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  self->_showActionButton = 1;
  actionButton = self->_actionButton;
  v11 = v4;
  if (!actionButton)
  {
    v6 = (UIControl *)objc_alloc_init(getSKUIItemOfferButtonClass());
    v7 = self->_actionButton;
    self->_actionButton = v6;

    v8 = self->_actionButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIControl setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v4 = v11;
    actionButton = self->_actionButton;
  }
  -[UIControl setTitle:](actionButton, "setTitle:", v4);
  -[UIControl sizeToFit](self->_actionButton, "sizeToFit");
  -[UIControl _setTouchInsets:](self->_actionButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  -[PKPaymentPassTableCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_actionButton);

}

- (void)_configureSubTextLabelWithText:(id)a3 textColor:(id)a4
{
  id v6;
  UILabel *subTextLabel;
  void *v8;
  UILabel *v9;
  UILabel *v10;
  UILabel *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  subTextLabel = self->_subTextLabel;
  if (!subTextLabel)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v10 = self->_subTextLabel;
    self->_subTextLabel = v9;

    v11 = self->_subTextLabel;
    objc_msgSend((id)objc_opt_class(), "subTitleFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    subTextLabel = self->_subTextLabel;
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    -[UILabel setColor:](subTextLabel, "setColor:", v6);
    subTextLabel = self->_subTextLabel;
  }
LABEL_4:
  -[UILabel setText:](subTextLabel, "setText:", v13);
  -[UILabel sizeToFit](self->_subTextLabel, "sizeToFit");
  -[PKPaymentPassTableCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_subTextLabel);

}

- (void)_configureCellWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIControl *actionButton;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[PKPaymentPass localizedDescription](self->_pass, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassTableCell _configureMainLabelWithText:](self, "_configureMainLabelWithText:", v4);

  -[PKPaymentPassTableCell setAccessoryType:](self, "setAccessoryType:", 1);
  if (self->_showSubTitle)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("pkCustomSubTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("pkCustomSubTitle"));
    else
      PKSanitizedPrimaryAccountRepresentationForPass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("pkCustomSubTitleColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassTableCell _configureSubTextLabelWithText:textColor:](self, "_configureSubTextLabelWithText:textColor:", v7, v8);

    -[PKPaymentPassTableCell updateSubtitleForTransitProperties](self, "updateSubtitleForTransitProperties");
  }
  if (self->_showAddButton)
  {
    PKLocalizedString(CFSTR("INGESTION_ADD"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pk_uppercaseStringForPreferredLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassTableCell _configureActionButtonWithTitle:](self, "_configureActionButtonWithTitle:", v10);

    actionButton = self->_actionButton;
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("pkActionButtonEnabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIControl setEnabled:](actionButton, "setEnabled:", objc_msgSend(v12, "BOOLValue"));

    -[UIControl addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, sel__addButtonPressed_, 64);
    -[PKPaymentPassTableCell setAccessoryType:](self, "setAccessoryType:", 0);
  }
  if (self->_showState)
  {
    -[PKPaymentPassTableCell _stringForPassState:](self, "_stringForPassState:", -[PKPaymentPass activationState](self->_pass, "activationState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (self->_verificationController)
    {
      -[PKPaymentPassTableCell _configureActionButtonWithTitle:](self, "_configureActionButtonWithTitle:", v13);
      -[UIControl addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, sel__verifyButtonPressed_, 64);
      -[PKPaymentPassTableCell setAccessoryType:](self, "setAccessoryType:", 0);
      -[UIControl setEnabled:](self->_actionButton, "setEnabled:", -[PKPaymentVerificationController shouldDisabledVerificationButton](self->_verificationController, "shouldDisabledVerificationButton") ^ 1);
    }
    else if (objc_msgSend(v13, "length"))
    {
      -[PKPaymentPassTableCell tintColor](self, "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassTableCell _configureSubTextLabelWithText:textColor:](self, "_configureSubTextLabelWithText:textColor:", v14, v15);

    }
  }
  if (self->_settingsContext == 1)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v16, self);

  }
}

- (void)showActivitySpinner:(BOOL)a3
{
  UIActivityIndicatorView *spinner;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;
  void *v7;
  void *v8;

  if (self->_showAddButton)
  {
    self->_showSpinner = a3;
    self->_showActionButton = !a3;
    spinner = self->_spinner;
    if (!a3)
    {
      -[UIActivityIndicatorView removeFromSuperview](spinner, "removeFromSuperview");
      -[PKPaymentPassTableCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_actionButton);

    }
    else
    {
      if (!spinner)
      {
        v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        v6 = self->_spinner;
        self->_spinner = v5;

      }
      -[PKPaymentPassTableCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_spinner);

      -[UIControl removeFromSuperview](self->_actionButton, "removeFromSuperview");
      -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    }
    -[PKPaymentPassTableCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)disableAddButton
{
  UIControl *actionButton;

  if (self->_showAddButton)
  {
    actionButton = self->_actionButton;
    if (actionButton)
      -[UIControl setEnabled:](actionButton, "setEnabled:", 0);
  }
}

- (void)updateSubtitleForTransitProperties
{
  id *v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  int v8;
  UILabel *subTextLabel;
  void *v10;
  id v11;

  v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80600]);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "objectForKeyedSubscript:", CFSTR("pkTransitServerBalance"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "hasBalanceContent")
    && (!self->_showState
     || -[PKPaymentPass activationState](self->_pass, "activationState") == PKPaymentPassActivationStateActivated)
    && self->_showSubTitle)
  {
    v5 = objc_loadWeakRetained(v3);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pkCustomSubTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {

    }
    else
    {
      -[PKPaymentPass paymentPass](self->_pass, "paymentPass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isStoredValuePass");

      if (v8)
      {
        subTextLabel = self->_subTextLabel;
        objc_msgSend(v11, "primaryDisplayableBalance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](subTextLabel, "setText:", v10);

        -[UILabel sizeToFit](self->_subTextLabel, "sizeToFit");
        -[PKPaymentPassTableCell setNeedsLayout](self, "setNeedsLayout");
      }
    }
  }

}

- (void)updateSubtitle
{
  id *v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;

  v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80600]);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "objectForKeyedSubscript:", CFSTR("pkCustomSubTitle"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pkCustomSubTitleColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    -[UILabel setText:](self->_subTextLabel, "setText:", v7);
    if (v6)
      -[UILabel setTextColor:](self->_subTextLabel, "setTextColor:", v6);
    -[UILabel sizeToFit](self->_subTextLabel, "sizeToFit");
    -[PKPaymentPassTableCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSpecifier:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKPaymentVerificationController *v15;
  PKPaymentVerificationController *verificationController;
  objc_super v17;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E0D80600]));
  v6 = objc_msgSend(WeakRetained, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)PKPaymentPassTableCell;
    -[PSTableCell setSpecifier:](&v17, sel_setSpecifier_, v4);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pkPass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pkSnapshotPassView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pkShowAddButton"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_showAddButton = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pkShowState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_showState = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pkShowSubTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_showSubTitle = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pkShowFullSeparatorInset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self->_showFullSeparatorInset = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "target");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_delegate, v13);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pkSettingsContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_settingsContext = (int)objc_msgSend(v14, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pkVerificationController"));
    v15 = (PKPaymentVerificationController *)objc_claimAutoreleasedReturnValue();
    verificationController = self->_verificationController;
    self->_verificationController = v15;

    -[PKPaymentVerificationController setDelegate:](self->_verificationController, "setDelegate:", self);
    -[PKPaymentPassTableCell setPass:passView:](self, "setPass:passView:", v7, v8);
    -[PKPaymentPassTableCell _configureCellWithSpecifier:](self, "_configureCellWithSpecifier:", v4);

  }
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (BOOL)showSubTitle
{
  return self->_showSubTitle;
}

- (void)setShowSubTitle:(BOOL)a3
{
  self->_showSubTitle = a3;
}

- (BOOL)showAddButton
{
  return self->_showAddButton;
}

- (void)setShowAddButton:(BOOL)a3
{
  self->_showAddButton = a3;
}

- (PKPaymentPassTableCellDelegate)delegate
{
  return (PKPaymentPassTableCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (UILabel)subTextLabel
{
  return self->_subTextLabel;
}

- (UIControl)actionButton
{
  return self->_actionButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subTextLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_destroyWeak((id *)&self->_verificationViewController);
  objc_storeStrong((id *)&self->_verificationController, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cardSnapshotMask, 0);
  objc_storeStrong((id *)&self->_cardSnapshotView, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_snapshotSpinner, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
}

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)pk_applyAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PKPaymentPassTableCell mainLabel](self, "mainLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

  -[PKPaymentPassTableCell subTextLabel](self, "subTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v8);

  objc_msgSend(v4, "buttonTextColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPassTableCell setTintColor:](self, "setTintColor:", v9);
}

@end

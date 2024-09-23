@implementation PKLiveRenderedCardFaceView

- (void)setMotionEnabled:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    -[PKTexturedCardView setMotionEnabled:](self->_texturedCardView, "setMotionEnabled:");
    -[PKPayLaterCardView setMotionEnabled:](self->_payLaterCardView, "setMotionEnabled:", v3);
  }
}

- (BOOL)requiresFaceImage
{
  return self->_requiresFaceImage;
}

- (PKLiveRenderedCardFaceView)initWithFrame:(CGRect)a3 pass:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PKLiveRenderedCardFaceView *v11;
  id *p_pass;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t type;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id cardView;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  PKTexturedCardView *v35;
  PKTexturedCardView *texturedCardView;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  PKTexturedCardView *v56;
  PKTexturedCardView *v57;
  UIView *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  PKPayLaterCardView *v68;
  PKPayLaterCardView *payLaterCardView;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  PKTexturedCardView *v79;
  PKTexturedCardView *v80;
  UIView *v81;
  UIImageView *v82;
  UIImageView *logoImageView;
  UIImageView *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  PKLiveRenderedCardFaceView *v89;
  PKLiveRenderedCardFaceView *result;
  unint64_t v91;
  void *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  objc_super v102;
  uint8_t buf[4];
  unint64_t v104;
  __int16 v105;
  void *v106;
  uint64_t v107;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v107 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (v10)
  {
    v102.receiver = self;
    v102.super_class = (Class)PKLiveRenderedCardFaceView;
    v11 = -[PKLiveRenderedCardFaceView initWithFrame:](&v102, sel_initWithFrame_, x, y, width, height);
    self = v11;
    if (v11)
    {
      p_pass = (id *)&v11->_pass;
      objc_storeStrong((id *)&v11->_pass, a4);
      self->_type = objc_msgSend(*p_pass, "liveRenderType");
      self->_state = 0;
      +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        v15 = (objc_msgSend(v13, "registerObserver:", self) >> 8) & 1;
      else
        LOBYTE(v15) = 1;
      self->_foregroundActive = v15;
      objc_msgSend(*p_pass, "displayProfile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(v16, "backgroundColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pkui_colorWithPKColor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKLiveRenderedCardFaceView setBackgroundColor:](self, "setBackgroundColor:", v19);

      objc_msgSend(*p_pass, "liveRenderedImageSet");
      v20 = objc_claimAutoreleasedReturnValue();
      type = self->_type;
      v22 = (void *)v20;
      v99 = (void *)v20;
      v100 = v16;
      v101 = v14;
      switch(type)
      {
        case 1uLL:
          objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithTraits:", &__block_literal_global_138);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v23)
          {
            objc_msgSend(v24, "resolvedColorWithTraitCollection:", v23);
            v26 = objc_claimAutoreleasedReturnValue();

            v25 = (void *)v26;
          }
          objc_msgSend(v25, "colorWithAlphaComponent:", 0.6);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = objc_alloc(MEMORY[0x1E0D6BFC8]);
          objc_msgSend(v22, "diffuseMaterialPropertyImage");
          cardView = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v30 = objc_msgSend(cardView, "imageRef");
          objc_msgSend(v22, "metalnessMaterialPropertyImage");
          v31 = v22;
          v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v33 = objc_msgSend(v32, "imageRef");
          objc_msgSend(v31, "normalMaterialPropertyImage");
          v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v35 = (PKTexturedCardView *)objc_msgSend(v28, "initWithDiffuse:metalness:normal:", v30, v33, objc_msgSend(v34, "imageRef"));
          texturedCardView = self->_texturedCardView;
          self->_texturedCardView = v35;

          objc_storeStrong((id *)&self->_cardView, v35);
          goto LABEL_38;
        case 2uLL:
          objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B58]);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "fontDescriptorWithSymbolicTraits:", 2);
          v38 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v38, 22.0);
          v98 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "frontFieldBuckets");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "firstObject");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "value");
          v97 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = (void *)MEMORY[0x1E0DC3658];
          objc_msgSend(v10, "displayProfile");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "foregroundColor");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "pkui_colorWithPKColor:", v44);
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          v95 = (void *)v38;
          switch(objc_msgSend(v10, "homeKeyLiveRenderType"))
          {
            case 0:
              PKLogFacilityTypeGetObject();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19D178000, v45, OS_LOG_TYPE_DEFAULT, "Attempting to show PKAppleHomeKeyCardView, but unknown type provided, falling back to silver", buf, 2u);
              }

              goto LABEL_14;
            case 1:
LABEL_14:
              objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithTraits:", &__block_literal_global_139, v38);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v47;
              v49 = (void *)v98;
              if (v46)
              {
                objc_msgSend(v47, "resolvedColorWithTraitCollection:", v46);
                v50 = objc_claimAutoreleasedReturnValue();

                v48 = (void *)v50;
              }
              objc_msgSend(v48, "colorWithAlphaComponent:", 0.15);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              v51 = 2;
              goto LABEL_33;
            case 2:
              v51 = 1;
              v74 = LightBorderColor();
              goto LABEL_31;
            case 3:
              v27 = (void *)LightBorderColor();
              v51 = 0;
              goto LABEL_32;
            case 4:
              v51 = 3;
              v74 = DarkBorderColor();
LABEL_31:
              v27 = (void *)v74;
LABEL_32:
              v49 = (void *)v98;
LABEL_33:
              if (!v27)
                goto LABEL_34;
              goto LABEL_37;
            default:
              v49 = (void *)v98;
              v51 = 2;
LABEL_34:
              objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithTraits:", &__block_literal_global_139, v95);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = v76;
              if (v75)
              {
                objc_msgSend(v76, "resolvedColorWithTraitCollection:", v75);
                v78 = objc_claimAutoreleasedReturnValue();

                v77 = (void *)v78;
              }
              objc_msgSend(v77, "colorWithAlphaComponent:", 0.15);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_37:
              v79 = (PKTexturedCardView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFD0]), "initWithStyle:text:font:textColor:", v51, v97, v49, v96);
              v80 = self->_texturedCardView;
              self->_texturedCardView = v79;

              objc_storeStrong((id *)&self->_cardView, v79);
              cardView = v95;
              break;
          }
          goto LABEL_38;
        case 3uLL:
          objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithTraits:", &__block_literal_global_139);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v53;
          if (v52)
          {
            objc_msgSend(v53, "resolvedColorWithTraitCollection:", v52);
            v55 = objc_claimAutoreleasedReturnValue();

            v54 = (void *)v55;
          }
          objc_msgSend(v54, "colorWithAlphaComponent:", 0.15);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v56 = (PKTexturedCardView *)objc_alloc_init(MEMORY[0x1E0D6BFC0]);
          v57 = self->_texturedCardView;
          self->_texturedCardView = v56;

          v58 = v56;
          goto LABEL_26;
        case 4uLL:
          objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithTraits:", &__block_literal_global_138);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v60;
          if (v59)
          {
            objc_msgSend(v60, "resolvedColorWithTraitCollection:", v59);
            v62 = objc_claimAutoreleasedReturnValue();

            v61 = (void *)v62;
          }
          objc_msgSend(v61, "colorWithAlphaComponent:", 0.6);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*p_pass, "paymentPass");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "associatedAccountServiceAccountIdentifier");
          cardView = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66878]), "initWithAccountIdentifier:accountService:", cardView, v64);
          v66 = objc_alloc(MEMORY[0x1E0D6BFF8]);
          objc_msgSend(v22, "overlayMaterialPropertyImage");
          v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v68 = (PKPayLaterCardView *)objc_msgSend(v66, "initWithOverlay:magnitudesProvider:", objc_msgSend(v67, "imageRef"), v65);
          payLaterCardView = self->_payLaterCardView;
          self->_payLaterCardView = v68;

          objc_storeStrong((id *)&self->_cardView, v68);
          goto LABEL_38;
        case 5uLL:
          self->_requiresFaceImage = 1;
          objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithTraits:", &__block_literal_global_139);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v71;
          if (v70)
          {
            objc_msgSend(v71, "resolvedColorWithTraitCollection:", v70);
            v73 = objc_claimAutoreleasedReturnValue();

            v72 = (void *)v73;
          }
          objc_msgSend(v72, "colorWithAlphaComponent:", 0.15);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v58 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
LABEL_26:
          cardView = self->_cardView;
          self->_cardView = v58;
LABEL_38:

          v81 = self->_cardView;
          if (v81)
          {
            -[PKLiveRenderedCardFaceView addSubview:](self, "addSubview:", self->_cardView);
            v82 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
            logoImageView = self->_logoImageView;
            self->_logoImageView = v82;

            v84 = self->_logoImageView;
            v85 = (void *)MEMORY[0x1E0DC3870];
            objc_msgSend(*p_pass, "logoImage");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "imageWithPKImage:", v86);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIImageView setImage:](v84, "setImage:", v87);

            -[UIImageView sizeToFit](self->_logoImageView, "sizeToFit");
            -[PKLiveRenderedCardFaceView addSubview:](self, "addSubview:", self->_logoImageView);
            -[PKLiveRenderedCardFaceView layer](self, "layer");
            v88 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*p_pass, "style");
            PKPassFrontFaceContentSize();
            objc_msgSend(objc_retainAutorelease(v27), "CGColor");
            PKPaymentStyleApplyCorners();
          }
          else
          {
            PKLogFacilityTypeGetObject();
            v88 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              v91 = self->_type;
              objc_msgSend(*p_pass, "uniqueID");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v104 = v91;
              v105 = 2112;
              v106 = v92;
              _os_log_impl(&dword_19D178000, v88, OS_LOG_TYPE_DEFAULT, "PKLiveRenderedCardFaceView: live render type %lu recognized but failed to initialize for pass %@.", buf, 0x16u);

            }
          }

          if (v81)
            break;
          goto LABEL_42;
        default:
          PKLogFacilityTypeGetObject();
          v93 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*p_pass, "uniqueID");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v104 = type;
            v105 = 2112;
            v106 = v94;
            _os_log_impl(&dword_19D178000, v93, OS_LOG_TYPE_DEFAULT, "PKLiveRenderedCardFaceView: invalid live render type %lu for pass %@.", buf, 0x16u);

          }
          __break(1u);
          return result;
      }
    }
    self = self;
    v89 = self;
  }
  else
  {
LABEL_42:
    v89 = 0;
  }

  return v89;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double top;
  double left;
  UIImageView *logoImageView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKLiveRenderedCardFaceView;
  -[PKLiveRenderedCardFaceView layoutSubviews](&v12, sel_layoutSubviews);
  -[PKLiveRenderedCardFaceView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  if (self->_usingFaceImage)
  {
    top = self->_faceImageContentInsets.top;
    left = self->_faceImageContentInsets.left;
    v3 = v3 + left;
    v4 = v4 + top;
    v5 = v5 - (left + self->_faceImageContentInsets.right);
    v6 = v6 - (top + self->_faceImageContentInsets.bottom);
  }
  -[UIView setFrame:](self->_cardView, "setFrame:", v3, v4, v5, v6);
  logoImageView = self->_logoImageView;
  -[UIImageView frame](logoImageView, "frame");
  -[UIImageView setFrame:](logoImageView, "setFrame:", v7, v8);
}

+ (BOOL)replacesContentForType:(unint64_t)a3
{
  return a3 == 2;
}

- (PKLiveRenderedCardFaceView)init
{

  return 0;
}

- (PKLiveRenderedCardFaceView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[PKLiveRenderedCardFaceView invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKLiveRenderedCardFaceView;
  -[PKLiveRenderedCardFaceView dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[PKTexturedCardView invalidate](self->_texturedCardView, "invalidate");
    -[PKPayLaterCardView invalidate](self->_payLaterCardView, "invalidate");
  }
}

- (void)didAuthenticate
{
  -[PKLiveRenderedCardFaceView _showState:animated:](self, "_showState:animated:", 1, 1);
}

- (void)didPresent
{
  -[PKPayLaterCardView setPresented:](self->_payLaterCardView, "setPresented:", 1);
}

- (void)didDismiss
{
  -[PKLiveRenderedCardFaceView _showState:animated:](self, "_showState:animated:", 0, 1);
  -[PKPayLaterCardView setPresented:](self->_payLaterCardView, "setPresented:", 0);
}

- (void)clearFaceImage
{
  UIImage *faceImage;
  UIColor *faceImageAverageColor;

  faceImage = self->_faceImage;
  if (faceImage)
  {
    self->_faceImage = 0;

    faceImageAverageColor = self->_faceImageAverageColor;
    self->_faceImageAverageColor = 0;

    self->_usingFaceImage = 0;
    -[PKLiveRenderedCardFaceView _updateFaceImage](self, "_updateFaceImage");
  }
}

- (void)setFaceImage:(id)a3 withAverageColor:(id)a4 alignmentInsets:(UIEdgeInsets)a5 contentInsets:(UIEdgeInsets)a6
{
  double right;
  double bottom;
  double left;
  double top;
  double v10;
  double v11;
  double v12;
  double v13;
  id v17;
  void *v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  double v22;
  UIImage *v26;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  v10 = a5.right;
  v11 = a5.bottom;
  v12 = a5.left;
  v13 = a5.top;
  v26 = (UIImage *)a3;
  v17 = a4;
  if (v26)
  {
    v18 = v17;
    if (self->_faceImage == v26
      && (self->_faceImageAlignmentInsets.left == v12 ? (v19 = self->_faceImageAlignmentInsets.top == v13) : (v19 = 0),
          v19 ? (v20 = self->_faceImageAlignmentInsets.right == v10) : (v20 = 0),
          v20 ? (v21 = self->_faceImageAlignmentInsets.bottom == v11) : (v21 = 0),
          v21))
    {
      v22 = self->_faceImageContentInsets.top;
      if (self->_faceImageContentInsets.left != left
        || v22 != top
        || self->_faceImageContentInsets.right != right
        || self->_faceImageContentInsets.bottom != bottom)
      {
        self->_faceImageContentInsets.top = top;
        self->_faceImageContentInsets.left = left;
        self->_faceImageContentInsets.bottom = bottom;
        self->_faceImageContentInsets.right = right;
        -[PKLiveRenderedCardFaceView setNeedsLayout](self, "setNeedsLayout", v22);
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_faceImage, a3);
      objc_storeStrong((id *)&self->_faceImageAverageColor, a4);
      self->_faceImageAlignmentInsets.top = v13;
      self->_faceImageAlignmentInsets.left = v12;
      self->_faceImageAlignmentInsets.bottom = v11;
      self->_faceImageAlignmentInsets.right = v10;
      self->_faceImageContentInsets.top = top;
      self->_faceImageContentInsets.left = left;
      self->_faceImageContentInsets.bottom = bottom;
      self->_faceImageContentInsets.right = right;
      -[PKLiveRenderedCardFaceView _updateFaceImage](self, "_updateFaceImage");
    }

  }
  else
  {
    __break(1u);
  }
}

- (void)_updateFaceImage
{
  UIView *v3;
  double top;
  double left;
  double bottom;
  double right;
  double v8;
  double v9;
  void *v10;
  id v11;
  PKSpotlightCardView *v12;
  PKSpotlightCardView *spotlightCardView;
  int v14;
  PKSpotlightCardView *v15;
  objc_class *v16;
  PKSpotlightCardView *v17;
  UIView *v18;
  UIView *cardView;
  PKSpotlightCardView *v20;
  PKTexturedCardView *texturedCardView;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  _QWORD v32[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  if (self->_type == 5 && !self->_invalidated)
  {
    -[PKPass style](self->_pass, "style");
    self->_usingFaceImage = self->_faceImage != 0;
    if (self->_faceImage)
    {
      v3 = self->_cardView;
      top = self->_faceImageAlignmentInsets.top;
      left = self->_faceImageAlignmentInsets.left;
      bottom = self->_faceImageAlignmentInsets.bottom;
      right = self->_faceImageAlignmentInsets.right;
      -[UIImage scale](self->_faceImage, "scale");
      v9 = v8;
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithTraits:", &__block_literal_global_73);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0;
      v33 = 0;
      v34 = &v33;
      v35 = 0x2020000000;
      v36 = 0;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __46__PKLiveRenderedCardFaceView__updateFaceImage__block_invoke_2;
      v32[3] = &unk_1E3E6A608;
      v32[4] = self;
      v32[5] = &v37;
      v32[6] = &v33;
      PKUIPerformWithEffectiveTraitCollection(v10, v32);
      v11 = objc_alloc(MEMORY[0x1E0D6C030]);
      v12 = (PKSpotlightCardView *)objc_msgSend(v11, "initWithDiffuse:contentInsets:averageColor:", v38[3], v34[3], top * v9, left * v9, bottom * v9, right * v9);
      spotlightCardView = self->_spotlightCardView;
      self->_spotlightCardView = v12;

      objc_storeStrong((id *)&self->_texturedCardView, v12);
      objc_storeStrong((id *)&self->_cardView, v12);
      -[PKTexturedCardView setMotionEnabled:](self->_texturedCardView, "setMotionEnabled:", self->_enabled);
      CGImageRelease((CGImageRef)v38[3]);
      CGColorRelease((CGColorRef)v34[3]);
      -[PKLiveRenderedCardFaceView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_cardView, v3);
      -[UIView removeFromSuperview](v3, "removeFromSuperview");
      -[PKLiveRenderedCardFaceView setNeedsLayout](self, "setNeedsLayout");
      v14 = -[PKSpotlightCardView isLight](self->_spotlightCardView, "isLight");
      _Block_object_dispose(&v33, 8);
      _Block_object_dispose(&v37, 8);

    }
    else
    {
      v15 = self->_spotlightCardView;
      if (v15)
      {
        v16 = (objc_class *)MEMORY[0x1E0DC3F10];
        v17 = v15;
        v18 = (UIView *)objc_alloc_init(v16);
        cardView = self->_cardView;
        self->_cardView = v18;

        v20 = self->_spotlightCardView;
        self->_spotlightCardView = 0;

        texturedCardView = self->_texturedCardView;
        self->_texturedCardView = 0;

        -[PKLiveRenderedCardFaceView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_cardView, v17);
        -[PKSpotlightCardView removeFromSuperview](v17, "removeFromSuperview");
        -[PKSpotlightCardView invalidate](v17, "invalidate");
        -[PKLiveRenderedCardFaceView setNeedsLayout](self, "setNeedsLayout");

      }
      v14 = 1;
    }
    -[PKLiveRenderedCardFaceView layer](self, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PKPassFrontFaceContentSize();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithTraits:", &__block_literal_global_139);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v23)
      {
        objc_msgSend(v24, "resolvedColorWithTraitCollection:", v23);
        v26 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v26;
      }
      v27 = 0.15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithTraits:", &__block_literal_global_138);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v28;
      if (v23)
      {
        objc_msgSend(v28, "resolvedColorWithTraitCollection:", v23);
        v29 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v29;
      }
      v27 = 0.6;
    }
    objc_msgSend(v25, "colorWithAlphaComponent:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_retainAutorelease(v30);
    objc_msgSend(v31, "CGColor");
    PKPaymentStyleApplyCorners();

  }
}

uint64_t __46__PKLiveRenderedCardFaceView__updateFaceImage__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserInterfaceStyle:", 1);
}

CGColorRef __46__PKLiveRenderedCardFaceView__updateFaceImage__block_invoke_2(_QWORD *a1)
{
  CGColorRef result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = CGImageRetain((CGImageRef)objc_msgSend(*(id *)(a1[4] + 488), "CGImage"));
  result = CGColorRetain((CGColorRef)objc_msgSend(*(id *)(a1[4] + 496), "CGColor"));
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  if (self->_foregroundActive != ((*(_QWORD *)&a4.var0 >> 8) & 1))
  {
    self->_foregroundActive = (unsigned __int16)(*(_WORD *)&a4 & 0x100) >> 8;
    if ((*(_WORD *)&a4 & 0x100) != 0)
      -[PKPayLaterCardView refreshMagnitudes](self->_payLaterCardView, "refreshMagnitudes", a3);
  }
}

- (void)_showState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  UIView **p_cardView;
  void *v16;
  uint64_t v17;
  PKTexturedCardView **p_texturedCardView;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  PKLiveRenderedCardFaceView *v23;

  if (self->_type == 1 && !self->_invalidated && self->_state != a3)
  {
    v5 = a4;
    self->_state = a3;
    if (a3 == 1)
    {
      -[PKPass liveRenderedArmedStateImageSet](self->_pass, "liveRenderedArmedStateImageSet");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3)
        return;
      -[PKPass liveRenderedImageSet](self->_pass, "liveRenderedImageSet");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
    if (v6)
    {
      v8 = objc_alloc(MEMORY[0x1E0D6BFC8]);
      objc_msgSend(v7, "diffuseMaterialPropertyImage");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v9, "imageRef");
      objc_msgSend(v7, "metalnessMaterialPropertyImage");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "imageRef");
      objc_msgSend(v7, "normalMaterialPropertyImage");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = (void *)objc_msgSend(v8, "initWithDiffuse:metalness:normal:", v10, v12, objc_msgSend(v13, "imageRef"));

      objc_msgSend(v14, "setMotionEnabled:", self->_enabled);
      objc_msgSend(v14, "setAlpha:", 0.0);
      p_cardView = &self->_cardView;
      -[UIView frame](self->_cardView, "frame");
      objc_msgSend(v14, "setFrame:");
      -[PKLiveRenderedCardFaceView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v14, self->_cardView);
      if (v5)
      {
        v16 = (void *)MEMORY[0x1E0DC3F10];
        v17 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __50__PKLiveRenderedCardFaceView__showState_animated___block_invoke;
        v21[3] = &unk_1E3E61388;
        v22 = v14;
        v23 = self;
        v19[0] = v17;
        v19[1] = 3221225472;
        v19[2] = __50__PKLiveRenderedCardFaceView__showState_animated___block_invoke_2;
        v19[3] = &unk_1E3E619E0;
        v19[4] = self;
        v20 = v22;
        objc_msgSend(v16, "pkui_animateUsingOptions:animations:completion:", 4, v21, v19);

      }
      else
      {
        objc_msgSend(v14, "setAlpha:", 1.0);
        -[UIView removeFromSuperview](*p_cardView, "removeFromSuperview");
        p_texturedCardView = &self->_texturedCardView;
        -[PKTexturedCardView invalidate](*p_texturedCardView, "invalidate");
        objc_storeStrong((id *)p_texturedCardView, v14);
        objc_storeStrong((id *)p_cardView, v14);
      }

    }
  }
}

uint64_t __50__PKLiveRenderedCardFaceView__showState_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 440), "setAlpha:", 0.0);
}

uint64_t __50__PKLiveRenderedCardFaceView__showState_animated___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "removeFromSuperview");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "invalidate");
    v3 = *(void **)(a1 + 40);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 456), v3);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 440), v3);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setMotionEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 482));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
  }
}

- (UIImage)faceImage
{
  return self->_faceImage;
}

- (UIColor)faceImageAverageColor
{
  return self->_faceImageAverageColor;
}

- (UIEdgeInsets)faceImageAlignmentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_faceImageAlignmentInsets.top;
  left = self->_faceImageAlignmentInsets.left;
  bottom = self->_faceImageAlignmentInsets.bottom;
  right = self->_faceImageAlignmentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)faceImageContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_faceImageContentInsets.top;
  left = self->_faceImageContentInsets.left;
  bottom = self->_faceImageContentInsets.bottom;
  right = self->_faceImageContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceImageAverageColor, 0);
  objc_storeStrong((id *)&self->_faceImage, 0);
  objc_storeStrong((id *)&self->_payLaterCardView, 0);
  objc_storeStrong((id *)&self->_spotlightCardView, 0);
  objc_storeStrong((id *)&self->_texturedCardView, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end

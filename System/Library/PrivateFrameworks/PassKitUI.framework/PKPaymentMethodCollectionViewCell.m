@implementation PKPaymentMethodCollectionViewCell

- (void)configureWithItem:(id)a3
{
  -[PKPaymentMethodCollectionViewCell configureWithItem:style:delegate:](self, "configureWithItem:style:delegate:", a3, 0, 0);
}

- (void)configureWithItem:(id)a3 style:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  NSString *v39;
  void *v40;
  PKPassView *v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[3];
  _QWORD v57[3];
  id v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v13);

  if (v10)
  {
    objc_msgSend(v10, "localizedDescription");
  }
  else
  {
    objc_msgSend(v11, "textProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setColor:", v15);

    objc_msgSend(v8, "paymentMethodName");
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v16);

  if (a4)
  {
    if (a4 != 1)
      goto LABEL_11;
    objc_msgSend(v11, "setDirectionalLayoutMargins:", 16.0, 0.0, 16.0, 0.0);
    v17 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    v18 = (void *)MEMORY[0x1E0DC3428];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __70__PKPaymentMethodCollectionViewCell_configureWithItem_style_delegate___block_invoke;
    v50[3] = &unk_1E3E6EA68;
    v19 = v8;
    v51 = v19;
    v52 = v17;
    v53 = v9;
    v20 = v17;
    objc_msgSend(v18, "actionWithHandler:", v50);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:forControlEvents:", v21, 4096);

    objc_msgSend(v20, "setOn:", objc_msgSend(v19, "isSelected"));
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v20, 1);
    objc_msgSend(v22, "setMaintainsFixedSize:", 1);
    v59[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMethodCollectionViewCell setAccessories:](self, "setAccessories:", v23);

    goto LABEL_9;
  }
  objc_msgSend(v11, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  if (objc_msgSend(v8, "isSelected"))
  {
    v20 = objc_alloc_init(MEMORY[0x1E0DC3548]);
    v58 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMethodCollectionViewCell setAccessories:](self, "setAccessories:", v24);

LABEL_9:
    goto LABEL_11;
  }
  -[PKPaymentMethodCollectionViewCell setAccessories:](self, "setAccessories:", MEMORY[0x1E0C9AA60]);
LABEL_11:
  objc_msgSend(v8, "balance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA80F0]), "initWithShape:", 0);
    objc_msgSend(v26, "setScale:", 2);
    objc_msgSend(v26, "setStyle:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setColor:", v27);

    v28 = *MEMORY[0x1E0CA80D0];
    v57[0] = v26;
    v29 = *MEMORY[0x1E0DC1140];
    v56[0] = v28;
    v56[1] = v29;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v30;
    v56[2] = *MEMORY[0x1E0DC1138];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "formattedStringValue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v33, v32);
    objc_msgSend(v11, "setSecondaryAttributedText:", v34);

  }
  else
  {
    v54[0] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = *MEMORY[0x1E0DC1138];
    v55[0] = v35;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v36;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v10)
    {
      PKSanitizedPrimaryAccountRepresentationForPass();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v37, "initWithString:attributes:", v38, v26);

      objc_msgSend(v11, "setSecondaryAttributedText:", v32);
    }
    else
    {
      PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("PASS_DETAILS_AUTO_RELOAD_PAYMENT_METHOD_NOT_ON_THIS_DEVICE"), 0);
      v39 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v37, "initWithString:attributes:", v40, v26);

      objc_msgSend(v11, "setSecondaryAttributedText:", v32);
      -[PKPaymentMethodCollectionViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    }
  }

  PKPassFrontFaceContentSize();
  if (v10)
  {
    v41 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", v10, 4, 1911);
    -[PKPassView setModallyPresented:](v41, "setModallyPresented:", 1);
    -[PKPassView setPaused:](v41, "setPaused:", 1);
    PKFloatRoundToPixel();
    -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v41, "snapshotOfFrontFaceWithRequestedSize:", 60.0, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v43);
  }
  else
  {
    v44 = (void *)MEMORY[0x1E0D66E08];
    PKFloatRoundToPixel();
    objc_msgSend(v44, "constraintsWithMaxSize:", 60.0, v45);
    v41 = (PKPassView *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)MEMORY[0x1E0D66DF8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "imageNamed:inBundle:", CFSTR("PlaceholderCardArt_Large"), v47);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "resizedImageWithConstraints:", v41);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v49);

  }
  -[PKPaymentMethodCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v11);

}

uint64_t __70__PKPaymentMethodCollectionViewCell_configureWithItem_style_delegate___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "setSelected:", objc_msgSend(a1[5], "isOn"));
  return objc_msgSend(a1[6], "paymentMethodCellDidToggleItem:", a1[4]);
}

@end

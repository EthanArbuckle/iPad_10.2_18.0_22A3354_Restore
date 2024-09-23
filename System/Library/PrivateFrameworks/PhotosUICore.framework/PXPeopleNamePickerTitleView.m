@implementation PXPeopleNamePickerTitleView

- (PXPeopleNamePickerTitleView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerTitleView.m"), 39, CFSTR("invalid initializer"));

  return 0;
}

- (PXPeopleNamePickerTitleView)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerTitleView.m"), 46, CFSTR("invalid initializer"));

  return 0;
}

- (PXPeopleNamePickerTitleView)initWithFrame:(CGRect)a3 person:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PXPeopleNamePickerTitleView *v11;
  void *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerTitleView.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  v11 = -[PXPeopleNamePickerTitleView initWithFrame:person:face:](self, "initWithFrame:person:face:", v10, 0, x, y, width, height);

  return v11;
}

- (PXPeopleNamePickerTitleView)initWithFrame:(CGRect)a3 face:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PXPeopleNamePickerTitleView *v11;
  void *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerTitleView.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("face"));

  }
  v11 = -[PXPeopleNamePickerTitleView initWithFrame:person:face:](self, "initWithFrame:person:face:", 0, v10, x, y, width, height);

  return v11;
}

- (PXPeopleNamePickerTitleView)initWithFrame:(CGRect)a3 person:(id)a4 face:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  unint64_t v12;
  unint64_t v13;
  PXPeopleNamePickerTitleView *v14;
  PXPeopleNamePickerTitleView *v15;
  uint64_t v16;
  NSString *localizedName;
  int *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  UIFont *nameFont;
  PXPeopleScalableAvatarView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSMutableArray *fetchResults;
  PXPeopleScalableAvatarView *avatarView;
  PXPeopleScalableAvatarView *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  unint64_t v63;
  objc_super v64;
  _QWORD v65[7];
  _QWORD v66[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v66[1] = *MEMORY[0x1E0C80C00];
  v12 = (unint64_t)a4;
  v13 = (unint64_t)a5;
  if (!(v12 | v13))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerTitleView.m"), 62, CFSTR("Both person and face are nil"));

  }
  v64.receiver = self;
  v64.super_class = (Class)PXPeopleNamePickerTitleView;
  v14 = -[PXPeopleNamePickerTitleView initWithFrame:](&v64, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    if (v12)
    {
      +[PXPeopleUtilities titleStringForPerson:](PXPeopleUtilities, "titleStringForPerson:", v12);
      v16 = objc_claimAutoreleasedReturnValue();
      localizedName = v15->_localizedName;
      v15->_localizedName = (NSString *)v16;
      v18 = &OBJC_IVAR___PXPeopleNamePickerTitleView__person;
      v19 = (void *)v12;
    }
    else
    {
      localizedName = v14->_localizedName;
      v14->_localizedName = (NSString *)&stru_1E5149688;
      v18 = &OBJC_IVAR___PXPeopleNamePickerTitleView__face;
      v19 = (void *)v13;
    }

    v20 = *v18;
    v21 = v19;
    v22 = *(Class *)((char *)&v15->super.super.super.isa + v20);
    *(Class *)((char *)&v15->super.super.super.isa + v20) = v21;

    v23 = objc_alloc(MEMORY[0x1E0DC3DB8]);
    -[PXPeopleNamePickerTitleView bounds](v15, "bounds");
    v24 = (void *)objc_msgSend(v23, "initWithFrame:");
    objc_msgSend(v24, "setText:", v15->_localizedName);
    objc_msgSend(v24, "setBorderStyle:", 0);
    objc_msgSend(v24, "setReturnKeyType:", 9);
    objc_msgSend(v24, "setAutocorrectionType:", 1);
    objc_msgSend(v24, "setAutocapitalizationType:", 1);
    objc_msgSend(v24, "font");
    v25 = objc_claimAutoreleasedReturnValue();
    nameFont = v15->_nameFont;
    v15->_nameFont = (UIFont *)v25;

    objc_storeStrong((id *)&v15->_placeholderFont, v15->_nameFont);
    objc_storeStrong((id *)&v15->_nameField, v24);
    -[PXPeopleNamePickerTitleView addSubview:](v15, "addSubview:", v24);
    objc_msgSend(v24, "setTextAlignment:", 4);
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v27 = objc_alloc_init(PXPeopleScalableAvatarView);
    -[PXPeopleScalableAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXPeopleScalableAvatarView setAccessibilityIgnoresInvertColors:](v27, "setAccessibilityIgnoresInvertColors:", 1);
    v62 = v13;
    v63 = v12;
    if (v12)
    {
      -[PXPeopleScalableAvatarView setPerson:](v27, "setPerson:", v12);
      objc_msgSend((id)v12, "photoLibrary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "librarySpecificFetchOptions");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "setFetchLimit:", 1);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend((id)v12, "detectionType"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setIncludedDetectionTypes:", v31);

      objc_msgSend(v29, "setIncludeTorsoAndFaceDetectionData:", 1);
      objc_msgSend(MEMORY[0x1E0CD1528], "px_fetchKeyFaceForPerson:options:", v12, v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v33 = objc_claimAutoreleasedReturnValue();
      fetchResults = v15->_fetchResults;
      v15->_fetchResults = (NSMutableArray *)v33;

      -[NSMutableArray addObject:](v15->_fetchResults, "addObject:", v32);
      v61 = (void *)v12;
    }
    else
    {
      -[PXPeopleScalableAvatarView setFace:](v27, "setFace:", v13);
      v61 = (void *)v13;
    }
    avatarView = v15->_avatarView;
    v15->_avatarView = v27;
    v36 = v27;

    -[PXPeopleNamePickerTitleView addSubview:](v15, "addSubview:", v36);
    v52 = (void *)MEMORY[0x1E0CB3718];
    -[PXPeopleScalableAvatarView leadingAnchor](v36, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleNamePickerTitleView leadingAnchor](v15, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 10.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v58;
    -[PXPeopleScalableAvatarView centerYAnchor](v36, "centerYAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleNamePickerTitleView centerYAnchor](v15, "centerYAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v55;
    -[PXPeopleScalableAvatarView widthAnchor](v36, "widthAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToConstant:", 50.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v53;
    -[PXPeopleScalableAvatarView heightAnchor](v36, "heightAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToConstant:", 50.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v65[3] = v50;
    objc_msgSend(v24, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleScalableAvatarView trailingAnchor](v36, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 10.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v65[4] = v47;
    objc_msgSend(v24, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleNamePickerTitleView trailingAnchor](v15, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, -10.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v65[5] = v39;
    objc_msgSend(v24, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleNamePickerTitleView centerYAnchor](v15, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v65[6] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 7);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "activateConstraints:", v43);

    objc_msgSend(v61, "photoLibrary");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "px_registerChangeObserver:", v15);

    v13 = v62;
    v12 = v63;
  }

  return v15;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[PXPeopleNamePickerTitleView nameField](self, "nameField", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:fromView:", self, x, y);
  v9 = v8;
  v11 = v10;

  -[PXPeopleNamePickerTitleView nameField](self, "nameField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14.x = v9;
  v14.y = v11;
  LOBYTE(v7) = CGRectContainsPoint(v15, v14);

  return (char)v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[PXPeopleNamePickerTitleView person](self, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[PXPeopleNamePickerTitleView person](self, "person");
  else
    -[PXPeopleNamePickerTitleView face](self, "face");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_unregisterChangeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)PXPeopleNamePickerTitleView;
  -[PXPeopleNamePickerTitleView dealloc](&v6, sel_dealloc);
}

- (void)finishEditing
{
  id v3;

  -[PXPeopleNamePickerTitleView _updateFieldText](self, "_updateFieldText");
  -[PXPeopleNamePickerTitleView nameField](self, "nameField");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)resetImages
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PXPeopleNamePickerTitleView avatarView](self, "avatarView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleNamePickerTitleView person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXPeopleNamePickerTitleView person](self, "person");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPerson:", v5);
  }
  else
  {
    -[PXPeopleNamePickerTitleView face](self, "face");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerTitleView.m"), 150, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXPeopleNamePickerTitleView face](self, "face");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFace:", v5);
  }

}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
  -[PXPeopleNamePickerTitleView _updateFieldText](self, "_updateFieldText");
}

- (void)setPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_placeholder, a3);
  -[PXPeopleNamePickerTitleView _updateFieldPlaceholder](self, "_updateFieldPlaceholder");
}

- (void)setNameFont:(id)a3
{
  objc_storeStrong((id *)&self->_nameFont, a3);
  -[PXPeopleNamePickerTitleView _updateFieldText](self, "_updateFieldText");
}

- (void)setPlaceholderFont:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderFont, a3);
  -[PXPeopleNamePickerTitleView _updateFieldPlaceholder](self, "_updateFieldPlaceholder");
}

- (void)_updateFieldText
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[PXPeopleNamePickerTitleView localizedName](self, "localizedName");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E5149688;
  v11 = *MEMORY[0x1E0DC1138];
  -[PXPeopleNamePickerTitleView nameFont](self, "nameFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithString:attributes:", v6, v8);

  -[PXPeopleNamePickerTitleView nameField](self, "nameField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v9);

}

- (void)_updateFieldPlaceholder
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[PXPeopleNamePickerTitleView placeholder](self, "placeholder");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E5149688;
  v11 = *MEMORY[0x1E0DC1138];
  -[PXPeopleNamePickerTitleView placeholderFont](self, "placeholderFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithString:attributes:", v6, v8);

  -[PXPeopleNamePickerTitleView nameField](self, "nameField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedPlaceholder:", v9);

}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PXPeopleNamePickerTitleView fetchResults](self, "fetchResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "changeDetailsForFetchResult:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = v9;
          objc_msgSend(v9, "removedObjects");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12)
          {
            LODWORD(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  -[PXPeopleNamePickerTitleView face](self, "face");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (!(_DWORD)v6)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(v4, "changeDetailsForObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    LOBYTE(v6) = 1;

  if ((v6 & 1) != 0)
  {
LABEL_16:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PXPeopleNamePickerTitleView_prepareForPhotoLibraryChange___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
LABEL_17:

  return 0;
}

- (UITextField)nameField
{
  return self->_nameField;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (UIFont)nameFont
{
  return self->_nameFont;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (UIFont)placeholderFont
{
  return self->_placeholderFont;
}

- (NSMutableArray)fetchResults
{
  return self->_fetchResults;
}

- (PXPeopleScalableAvatarView)avatarView
{
  return self->_avatarView;
}

- (PHPerson)person
{
  return self->_person;
}

- (PHFace)face
{
  return self->_face;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_fetchResults, 0);
  objc_storeStrong((id *)&self->_placeholderFont, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_nameFont, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_nameField, 0);
}

uint64_t __60__PXPeopleNamePickerTitleView_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetImages");
}

@end

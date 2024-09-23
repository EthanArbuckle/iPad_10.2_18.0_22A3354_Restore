@implementation SBSRemoteContentPreferences

- (SBSRemoteContentPreferences)init
{
  return -[SBSRemoteContentPreferences initWithConfiguration:](self, "initWithConfiguration:", MEMORY[0x1E0C9AA70]);
}

- (SBSRemoteContentPreferences)initWithConfiguration:(id)a3
{
  id v4;
  SBSRemoteContentPreferences *v5;
  SBSRemoteContentPreferences *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SBSRemoteContentPreferences;
  v5 = -[SBSRemoteContentPreferences init](&v29, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("dateTimeStyle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
      v7 = &unk_1E28BFEA0;
    v6->_dateTimeStyle = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("backgroundStyle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
      v9 = &unk_1E28BFEA0;
    v6->_backgroundStyle = objc_msgSend(v9, "integerValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("homeGestureMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
      v11 = &unk_1E28BFEB8;
    v6->_homeGestureMode = objc_msgSend(v11, "integerValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("preferredNotificationListMode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
      v13 = &unk_1E28BFEA0;
    v6->_preferredNotificationListMode = objc_msgSend(v13, "integerValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("preferredLayout"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15)
      v15 = &unk_1E28BFEA0;
    v6->_preferredLayout = objc_msgSend(v15, "integerValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("reducesWhitePoint"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = (void *)MEMORY[0x1E0C9AAA0];
    if (!v17)
      v17 = (void *)MEMORY[0x1E0C9AAA0];
    v6->_reducesWhitePoint = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("suppressesNotifications"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20)
      v20 = (void *)MEMORY[0x1E0C9AAB0];
    v6->_suppressesNotifications = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("suppressesBottomEdgeContent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22)
      v22 = v19;
    v6->_suppressesBottomEdgeContent = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("dismissesOnTap"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (!v24)
      v24 = v19;
    v6->_dismissesOnTap = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("prefersInlinePresentation"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (!v26)
      v26 = v19;
    v6->_prefersInlinePresentation = objc_msgSend(v26, "BOOLValue");

  }
  return v6;
}

- (SBSRemoteContentPreferences)initWithCoder:(id)a3
{
  id v4;
  SBSRemoteContentPreferences *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSRemoteContentPreferences;
  v5 = -[SBSRemoteContentPreferences init](&v7, sel_init);
  if (v5)
  {
    v5->_dateTimeStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dateTimeStyle"));
    v5->_backgroundStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backgroundStyle"));
    v5->_homeGestureMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("homeGestureMode"));
    v5->_preferredNotificationListMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredNotificationListMode"));
    v5->_preferredLayout = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredLayout"));
    v5->_reducesWhitePoint = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("reducesWhitePoint"));
    v5->_suppressesNotifications = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suppressesNotifications"));
    v5->_suppressesBottomEdgeContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suppressesBottomEdgeContent"));
    v5->_dismissesOnTap = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dismissesOnTap"));
    v5->_prefersInlinePresentation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prefersInlinePresentation"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t dateTimeStyle;
  id v5;

  dateTimeStyle = self->_dateTimeStyle;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", dateTimeStyle, CFSTR("dateTimeStyle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_backgroundStyle, CFSTR("backgroundStyle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_homeGestureMode, CFSTR("homeGestureMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredNotificationListMode, CFSTR("preferredNotificationListMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredLayout, CFSTR("preferredLayout"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_reducesWhitePoint, CFSTR("reducesWhitePoint"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_suppressesNotifications, CFSTR("suppressesNotifications"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_suppressesBottomEdgeContent, CFSTR("suppressesBottomEdgeContent"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_dismissesOnTap, CFSTR("dismissesOnTap"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_prefersInlinePresentation, CFSTR("prefersInlinePresentation"));

}

- (int64_t)dateTimeStyle
{
  return self->_dateTimeStyle;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (int64_t)homeGestureMode
{
  return self->_homeGestureMode;
}

- (int64_t)preferredNotificationListMode
{
  return self->_preferredNotificationListMode;
}

- (int64_t)preferredLayout
{
  return self->_preferredLayout;
}

- (BOOL)reducesWhitePoint
{
  return self->_reducesWhitePoint;
}

- (BOOL)suppressesNotifications
{
  return self->_suppressesNotifications;
}

- (BOOL)suppressesBottomEdgeContent
{
  return self->_suppressesBottomEdgeContent;
}

- (BOOL)dismissesOnTap
{
  return self->_dismissesOnTap;
}

- (BOOL)prefersInlinePresentation
{
  return self->_prefersInlinePresentation;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t dateTimeStyle;
  uint64_t v7;
  id v8;
  id v9;
  int64_t backgroundStyle;
  id v11;
  id v12;
  int64_t homeGestureMode;
  id v14;
  id v15;
  int64_t preferredNotificationListMode;
  id v17;
  id v18;
  _BOOL8 reducesWhitePoint;
  id v20;
  id v21;
  _BOOL8 suppressesNotifications;
  id v23;
  id v24;
  _BOOL8 suppressesBottomEdgeContent;
  id v26;
  id v27;
  _BOOL8 dismissesOnTap;
  id v29;
  id v30;
  _BOOL8 prefersInlinePresentation;
  id v32;
  id v33;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dateTimeStyle = self->_dateTimeStyle;
  v7 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke;
  v51[3] = &unk_1E288F2A0;
  v8 = v4;
  v52 = v8;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", dateTimeStyle, v51);
  backgroundStyle = self->_backgroundStyle;
  v49[0] = v7;
  v49[1] = 3221225472;
  v49[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_2;
  v49[3] = &unk_1E288F2A0;
  v11 = v8;
  v50 = v11;
  v12 = (id)objc_msgSend(v5, "appendInteger:counterpart:", backgroundStyle, v49);
  homeGestureMode = self->_homeGestureMode;
  v47[0] = v7;
  v47[1] = 3221225472;
  v47[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_3;
  v47[3] = &unk_1E288F2A0;
  v14 = v11;
  v48 = v14;
  v15 = (id)objc_msgSend(v5, "appendInteger:counterpart:", homeGestureMode, v47);
  preferredNotificationListMode = self->_preferredNotificationListMode;
  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_4;
  v45[3] = &unk_1E288F2A0;
  v17 = v14;
  v46 = v17;
  v18 = (id)objc_msgSend(v5, "appendInteger:counterpart:", preferredNotificationListMode, v45);
  reducesWhitePoint = self->_reducesWhitePoint;
  v43[0] = v7;
  v43[1] = 3221225472;
  v43[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_5;
  v43[3] = &unk_1E288F2C8;
  v20 = v17;
  v44 = v20;
  v21 = (id)objc_msgSend(v5, "appendBool:counterpart:", reducesWhitePoint, v43);
  suppressesNotifications = self->_suppressesNotifications;
  v41[0] = v7;
  v41[1] = 3221225472;
  v41[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_6;
  v41[3] = &unk_1E288F2C8;
  v23 = v20;
  v42 = v23;
  v24 = (id)objc_msgSend(v5, "appendBool:counterpart:", suppressesNotifications, v41);
  suppressesBottomEdgeContent = self->_suppressesBottomEdgeContent;
  v39[0] = v7;
  v39[1] = 3221225472;
  v39[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_7;
  v39[3] = &unk_1E288F2C8;
  v26 = v23;
  v40 = v26;
  v27 = (id)objc_msgSend(v5, "appendBool:counterpart:", suppressesBottomEdgeContent, v39);
  dismissesOnTap = self->_dismissesOnTap;
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_8;
  v37[3] = &unk_1E288F2C8;
  v29 = v26;
  v38 = v29;
  v30 = (id)objc_msgSend(v5, "appendBool:counterpart:", dismissesOnTap, v37);
  prefersInlinePresentation = self->_prefersInlinePresentation;
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __39__SBSRemoteContentPreferences_isEqual___block_invoke_9;
  v35[3] = &unk_1E288F2C8;
  v36 = v29;
  v32 = v29;
  v33 = (id)objc_msgSend(v5, "appendBool:counterpart:", prefersInlinePresentation, v35);
  LOBYTE(v29) = objc_msgSend(v5, "isEqual");

  return (char)v29;
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dateTimeStyle");
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "backgroundStyle");
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeGestureMode");
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "preferredNotificationListMode");
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reducesWhitePoint");
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "suppressesNotifications");
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "suppressesBottomEdgeContent");
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissesOnTap");
}

uint64_t __39__SBSRemoteContentPreferences_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prefersInlinePresentation");
}

@end

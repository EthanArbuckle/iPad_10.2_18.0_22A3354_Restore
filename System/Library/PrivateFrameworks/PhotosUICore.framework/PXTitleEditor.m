@implementation PXTitleEditor

- (PXTitleEditor)init
{
  PXTitleEditor *v2;
  uint64_t v3;
  NSString *cancelButtonTitle;
  uint64_t v5;
  NSString *confirmButtonTitle;
  id completionHandler;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXTitleEditor;
  v2 = -[PXTitleEditor init](&v9, sel_init);
  if (v2)
  {
    PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
    v3 = objc_claimAutoreleasedReturnValue();
    cancelButtonTitle = v2->_cancelButtonTitle;
    v2->_cancelButtonTitle = (NSString *)v3;

    PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
    v5 = objc_claimAutoreleasedReturnValue();
    confirmButtonTitle = v2->_confirmButtonTitle;
    v2->_confirmButtonTitle = (NSString *)v5;

    completionHandler = v2->_completionHandler;
    v2->_completionHandler = &__block_literal_global_784;

  }
  return v2;
}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v4;

  -[PXTitleEditor setIncludesSubtitle:](self, "setIncludesSubtitle:", 1);
}

- (void)setSubtitlePlaceholder:(id)a3
{
  NSString *v4;
  NSString *subtitlePlaceholder;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subtitlePlaceholder = self->_subtitlePlaceholder;
  self->_subtitlePlaceholder = v4;

  -[PXTitleEditor setIncludesSubtitle:](self, "setIncludesSubtitle:", 1);
}

- (void)_updateExposedProperties
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXTitleEditor titleTextField](self, "titleTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTitleEditor setTitle:](self, "setTitle:", v4);

  -[PXTitleEditor subtitleTextField](self, "subtitleTextField");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTitleEditor setSubtitle:](self, "setSubtitle:", v5);

}

- (void)_handleSuccess:(BOOL)a3
{
  _BOOL8 v3;
  void (**v5)(id, PXTitleEditor *, _BOOL8);

  v3 = a3;
  -[PXTitleEditor _updateExposedProperties](self, "_updateExposedProperties");
  -[PXTitleEditor completionHandler](self, "completionHandler");
  v5 = (void (**)(id, PXTitleEditor *, _BOOL8))objc_claimAutoreleasedReturnValue();
  v5[2](v5, self, v3);

}

- (void)setConfirmAction:(id)a3
{
  UIAlertAction *v5;
  UIAlertAction *v6;

  v5 = (UIAlertAction *)a3;
  if (self->_confirmAction != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_confirmAction, a3);
    -[PXTitleEditor _invalidateConfirmAction](self, "_invalidateConfirmAction");
    v5 = v6;
  }

}

- (void)presentFromViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXTitleEditor createAlertController](self, "createAlertController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);

}

- (id)createAlertController
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  -[PXTitleEditor message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__PXTitleEditor_createAlertController__block_invoke;
  aBlock[3] = &unk_1E5115B20;
  aBlock[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __38__PXTitleEditor_createAlertController__block_invoke_2;
  v19[3] = &unk_1E5115B48;
  v7 = _Block_copy(aBlock);
  v19[4] = self;
  v20 = v7;
  objc_msgSend(v5, "addTextFieldWithConfigurationHandler:", v19);
  if (-[PXTitleEditor includesSubtitle](self, "includesSubtitle"))
  {
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __38__PXTitleEditor_createAlertController__block_invoke_3;
    v17[3] = &unk_1E5115B48;
    v17[4] = self;
    v18 = v7;
    objc_msgSend(v5, "addTextFieldWithConfigurationHandler:", v17);

  }
  v8 = (void *)MEMORY[0x1E0DC3448];
  -[PXTitleEditor confirmButtonTitle](self, "confirmButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __38__PXTitleEditor_createAlertController__block_invoke_4;
  v16[3] = &unk_1E5144530;
  v16[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v10);
  -[PXTitleEditor setConfirmAction:](self, "setConfirmAction:", v10);
  v11 = (void *)MEMORY[0x1E0DC3448];
  -[PXTitleEditor cancelButtonTitle](self, "cancelButtonTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __38__PXTitleEditor_createAlertController__block_invoke_5;
  v15[3] = &unk_1E5144530;
  v15[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v13);

  return v5;
}

- (void)_updateConfirmAction
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[PXTitleEditor _updateExposedProperties](self, "_updateExposedProperties");
  -[PXTitleEditor validation](self, "validation");
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v3;
  if (v3)
    v4 = (*(uint64_t (**)(uint64_t, PXTitleEditor *))(v3 + 16))(v3, self);
  else
    v4 = 1;
  -[PXTitleEditor confirmAction](self, "confirmAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)titlePlaceholder
{
  return self->_titlePlaceholder;
}

- (void)setTitlePlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)includesSubtitle
{
  return self->_includesSubtitle;
}

- (void)setIncludesSubtitle:(BOOL)a3
{
  self->_includesSubtitle = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)subtitlePlaceholder
{
  return self->_subtitlePlaceholder;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)confirmButtonTitle
{
  return self->_confirmButtonTitle;
}

- (void)setConfirmButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)validation
{
  return self->_validation;
}

- (void)setValidation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UITextField)titleTextField
{
  return self->_titleTextField;
}

- (void)setTitleTextField:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextField, a3);
}

- (UITextField)subtitleTextField
{
  return self->_subtitleTextField;
}

- (void)setSubtitleTextField:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleTextField, a3);
}

- (UIAlertAction)confirmAction
{
  return self->_confirmAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmAction, 0);
  objc_storeStrong((id *)&self->_subtitleTextField, 0);
  objc_storeStrong((id *)&self->_titleTextField, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_validation, 0);
  objc_storeStrong((id *)&self->_confirmButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_subtitlePlaceholder, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titlePlaceholder, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

void __38__PXTitleEditor_createAlertController__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setAutocapitalizationType:", 2);
  objc_msgSend(v3, "setAutocorrectionType:", 0);
  objc_msgSend(v3, "setClearButtonMode:", 1);
  objc_msgSend(v3, "setReturnKeyType:", 9);
  objc_msgSend(v3, "setEnablesReturnKeyAutomatically:", 1);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__textFieldDidChange_, 0x20000);

}

void __38__PXTitleEditor_createAlertController__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v7 = a2;
  v4(v3, v7);
  objc_msgSend(*(id *)(a1 + 32), "titlePlaceholder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaceholder:", v5);

  objc_msgSend(*(id *)(a1 + 32), "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setTitleTextField:", v7);
}

void __38__PXTitleEditor_createAlertController__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v7 = a2;
  v4(v3, v7);
  objc_msgSend(*(id *)(a1 + 32), "subtitlePlaceholder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaceholder:", v5);

  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setSubtitleTextField:", v7);
}

uint64_t __38__PXTitleEditor_createAlertController__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSuccess:", 1);
}

uint64_t __38__PXTitleEditor_createAlertController__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSuccess:", 0);
}

@end

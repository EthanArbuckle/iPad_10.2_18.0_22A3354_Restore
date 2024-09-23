@implementation _UITextAttachmentInteractionHandler

- (_UITextAttachmentInteractionHandler)initWithAttachmentItem:(id)a3 textContentView:(id)a4
{
  id v6;
  _UITextAttachmentInteractionHandler *v7;
  uint64_t v8;
  NSTextAttachment *textAttachment;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UITextAttachmentInteractionHandler;
  v7 = -[_UITextItemInteractionHandler initWithItem:textContentView:](&v11, sel_initWithItem_textContentView_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "attachment");
    v8 = objc_claimAutoreleasedReturnValue();
    textAttachment = v7->_textAttachment;
    v7->_textAttachment = (NSTextAttachment *)v8;

  }
  return v7;
}

- (id)_defaultMenuForInteractableItem
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];

  v20[2] = *MEMORY[0x1E0C80C00];
  -[NSTextAttachment image](self->_textAttachment, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _UIKitBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Copy Image"), CFSTR("Copy Image"), CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("doc.on.doc"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70___UITextAttachmentInteractionHandler__defaultMenuForInteractableItem__block_invoke;
    v18[3] = &unk_1E16B2C10;
    v4 = v2;
    v19 = v4;
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v14, v13, 0, v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v5;
    _UIKitBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Save to Camera Roll"), CFSTR("Save to Camera Roll"), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.down"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v3;
    v16[1] = 3221225472;
    v16[2] = __70___UITextAttachmentInteractionHandler__defaultMenuForInteractableItem__block_invoke_2;
    v16[3] = &unk_1E16B2C10;
    v17 = v4;
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v7, v8, 0, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, CFSTR("UITextItemDefaultMenuIdentifier"), 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_canPresentMenuWithoutPrimaryAction
{
  return 0;
}

- (NSTextAttachment)textAttachment
{
  return self->_textAttachment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textAttachment, 0);
}

@end

@implementation ICShowIdentifierActivity

- (ICShowIdentifierActivity)initWithIdentifier:(id)a3
{
  id v4;
  ICShowIdentifierActivity *v5;
  ICShowIdentifierActivity *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICShowIdentifierActivity;
  v5 = -[UIActivity init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICShowIdentifierActivity setIdentifier:](v5, "setIdentifier:", v4);

  return v6;
}

- (id)activityViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  -[ICShowIdentifierActivity identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, CFSTR("Copy this identifier to the clipboard?"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__ICShowIdentifierActivity_activityViewController__block_invoke;
  v9[3] = &unk_1E5C21BD0;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Copy"), 0, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v6);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v7);

  return v5;
}

void __50__ICShowIdentifierActivity_activityViewController__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStrings:", v4);

}

- (id)activityType
{
  return CFSTR("com.apple.notes.show-identifier");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

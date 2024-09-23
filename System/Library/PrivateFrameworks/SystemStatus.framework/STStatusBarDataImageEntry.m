@implementation STStatusBarDataImageEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
}

+ (id)entryWithImageNamed:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataImageEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageName, CFSTR("imageName"), v5.receiver, v5.super_class);

}

- (STStatusBarDataImageEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataImageEntry *v4;
  uint64_t v5;
  NSString *imageName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataImageEntry;
  v3 = a3;
  v4 = -[STStatusBarDataEntry initWithCoder:](&v8, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageName"), v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();

  imageName = v4->_imageName;
  v4->_imageName = (NSString *)v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataImageEntry;
  -[STStatusBarDataEntry succinctDescriptionBuilder](&v6, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarDataImageEntry imageName](self, "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("imageName"));

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STStatusBarDataImageEntry;
  -[STStatusBarDataEntry _equalsBuilderWithObject:](&v12, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarDataImageEntry imageName](self, "imageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__STStatusBarDataImageEntry__equalsBuilderWithObject___block_invoke;
  v10[3] = &unk_1E91E4B00;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendString:counterpart:", v6, v10);

  return v5;
}

uint64_t __54__STStatusBarDataImageEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "imageName");
}

- (id)_hashBuilder
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataImageEntry;
  -[STStatusBarDataEntry _hashBuilder](&v7, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarDataImageEntry imageName](self, "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataImageEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageName, CFSTR("imageName"), v5.receiver, v5.super_class);

}

- (STStatusBarDataImageEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataImageEntry *v5;
  uint64_t v6;
  NSString *imageName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataImageEntry;
  v5 = -[STStatusBarDataEntry initWithBSXPCCoder:](&v9, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("imageName"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v6;

  }
  return v5;
}

- (NSString)imageName
{
  return self->_imageName;
}

@end

@implementation SFLateSectionsAppendedFeedback

- (SFLateSectionsAppendedFeedback)initWithSections:(id)a3
{
  id v4;
  SFLateSectionsAppendedFeedback *v5;
  uint64_t v6;
  NSArray *sections;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFLateSectionsAppendedFeedback;
  v5 = -[SFFeedback init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sections = v5->_sections;
    v5->_sections = (NSArray *)v6;

    -[NSArray firstObject](v5->_sections, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->super._queryId = objc_msgSend(v10, "queryId");

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFLateSectionsAppendedFeedback;
  v4 = -[SFFeedback copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[SFLateSectionsAppendedFeedback sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[3];
  v4[3] = v6;

  return v4;
}

- (SFLateSectionsAppendedFeedback)initWithCoder:(id)a3
{
  id v4;
  SFLateSectionsAppendedFeedback *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *sections;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFLateSectionsAppendedFeedback;
  v5 = -[SFFeedback initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_sections"));
    v10 = objc_claimAutoreleasedReturnValue();
    sections = v5->_sections;
    v5->_sections = (NSArray *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFLateSectionsAppendedFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sections, CFSTR("_sections"), v5.receiver, v5.super_class);

}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

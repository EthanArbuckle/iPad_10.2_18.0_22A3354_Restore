@implementation SFVisibleSectionHeaderFeedback

- (SFVisibleSectionHeaderFeedback)initWithSection:(id)a3 headerType:(unint64_t)a4
{
  id v6;
  SFVisibleSectionHeaderFeedback *v7;
  uint64_t v8;
  SFResultSection *section;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFVisibleSectionHeaderFeedback;
  v7 = -[SFFeedback init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    section = v7->_section;
    v7->_section = (SFResultSection *)v8;

    v7->_headerType = a4;
    -[SFResultSection results](v7->_section, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7->super._queryId = objc_msgSend(v11, "queryId");

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
}

- (SFResultSection)section
{
  return self->_section;
}

- (unint64_t)headerType
{
  return self->_headerType;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFVisibleSectionHeaderFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_section, CFSTR("_section"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_headerType, CFSTR("_headerType"));

}

- (SFVisibleSectionHeaderFeedback)initWithCoder:(id)a3
{
  id v4;
  SFVisibleSectionHeaderFeedback *v5;
  uint64_t v6;
  SFResultSection *section;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFVisibleSectionHeaderFeedback;
  v5 = -[SFFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_section"));
    v6 = objc_claimAutoreleasedReturnValue();
    section = v5->_section;
    v5->_section = (SFResultSection *)v6;

    v5->_headerType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_headerType"));
  }

  return v5;
}

- (void)setSection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHeaderType:(unint64_t)a3
{
  self->_headerType = a3;
}

@end

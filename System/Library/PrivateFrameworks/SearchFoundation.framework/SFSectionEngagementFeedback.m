@implementation SFSectionEngagementFeedback

- (SFSectionEngagementFeedback)initWithSection:(id)a3 triggerEvent:(unint64_t)a4
{
  id v6;
  SFSectionEngagementFeedback *v7;
  uint64_t v8;
  SFResultSection *section;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFSectionEngagementFeedback;
  v7 = -[SFFeedback init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    section = v7->_section;
    v7->_section = (SFResultSection *)v8;

    v7->_triggerEvent = a4;
    -[SFResultSection results](v7->_section, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7->super._queryId = objc_msgSend(v11, "queryId");

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFSectionEngagementFeedback;
  v4 = -[SFFeedback copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[SFSectionEngagementFeedback section](self, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[3];
  v4[3] = v6;

  v4[4] = -[SFSectionEngagementFeedback triggerEvent](self, "triggerEvent");
  return v4;
}

- (SFSectionEngagementFeedback)initWithCoder:(id)a3
{
  id v4;
  SFSectionEngagementFeedback *v5;
  uint64_t v6;
  SFResultSection *section;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFSectionEngagementFeedback;
  v5 = -[SFFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_section"));
    v6 = objc_claimAutoreleasedReturnValue();
    section = v5->_section;
    v5->_section = (SFResultSection *)v6;

    v5->_triggerEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_triggerEvent"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFSectionEngagementFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_section, CFSTR("_section"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_triggerEvent, CFSTR("_triggerEvent"));

}

- (SFResultSection)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

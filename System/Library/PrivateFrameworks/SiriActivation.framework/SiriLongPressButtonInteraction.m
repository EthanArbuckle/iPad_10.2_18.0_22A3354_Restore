@implementation SiriLongPressButtonInteraction

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

+ (id)interactionWithBuilder:(id)a3
{
  void (**v3)(id, SiriLongPressButtonInteraction *);
  SiriLongPressButtonInteraction *v4;

  v3 = (void (**)(id, SiriLongPressButtonInteraction *))a3;
  v4 = objc_alloc_init(SiriLongPressButtonInteraction);
  if (v3)
    v3[2](v3, v4);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriLongPressButtonInteraction)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriLongPressButtonInteraction;
  return -[SiriLongPressButtonInteraction init](&v4, sel_init, a3);
}

@end

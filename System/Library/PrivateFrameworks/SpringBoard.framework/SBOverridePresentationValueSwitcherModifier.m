@implementation SBOverridePresentationValueSwitcherModifier

- (SBOverridePresentationValueSwitcherModifier)initWithAnimatablePropertyKeys:(id)a3 presentationValue:(double)a4
{
  id v6;
  SBOverridePresentationValueSwitcherModifier *v7;
  uint64_t v8;
  NSSet *keys;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBOverridePresentationValueSwitcherModifier;
  v7 = -[SBSwitcherModifier init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    keys = v7->_keys;
    v7->_keys = (NSSet *)v8;

    v7->_presentationValue = a4;
  }

  return v7;
}

- (double)presentationValueForAnimatableProperty:(id)a3
{
  id v4;
  double presentationValue;
  double v6;
  objc_super v8;

  v4 = a3;
  if (-[NSSet containsObject:](self->_keys, "containsObject:", v4))
  {
    presentationValue = self->_presentationValue;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBOverridePresentationValueSwitcherModifier;
    -[SBOverridePresentationValueSwitcherModifier presentationValueForAnimatableProperty:](&v8, sel_presentationValueForAnimatableProperty_, v4);
    presentationValue = v6;
  }

  return presentationValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
}

@end

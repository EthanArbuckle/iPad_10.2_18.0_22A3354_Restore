@implementation SBUpdateLayoutSwitcherEventResponse

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  unint64_t options;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBUpdateLayoutSwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v9, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  options = self->_options;
  if ((options & 2) != 0)
  {
    objc_msgSend(v4, "appendString:withName:", CFSTR("updateVisibleItems"), 0);
    options = self->_options;
    if ((options & 4) == 0)
    {
LABEL_3:
      if ((options & 8) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(v5, "appendString:withName:", CFSTR("style"), 0);
      if ((self->_options & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((options & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "appendString:withName:", CFSTR("layout"), 0);
  options = self->_options;
  if ((options & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((options & 0x20) != 0)
LABEL_5:
    objc_msgSend(v5, "appendString:withName:", CFSTR("setNeedsLayout"), 0);
LABEL_6:
  SBStringFromAnimationUpdateMode();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v7, CFSTR("mode"));

  return v5;
}

- (SBUpdateLayoutSwitcherEventResponse)initWithOptions:(unint64_t)a3 updateMode:(int64_t)a4
{
  SBUpdateLayoutSwitcherEventResponse *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUpdateLayoutSwitcherEventResponse;
  result = -[SBChainableModifierEventResponse init](&v7, sel_init);
  if (result)
  {
    result->_options = a3;
    result->_updateMode = a4;
  }
  return result;
}

- (int64_t)type
{
  return 10;
}

- (int64_t)updateMode
{
  return self->_updateMode;
}

- (unint64_t)options
{
  return self->_options;
}

@end

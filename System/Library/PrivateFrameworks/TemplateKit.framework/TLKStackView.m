@implementation TLKStackView

- (void)setFlipsToVerticalAxisForAccessibilityContentSizes:(BOOL)a3
{
  uint64_t v5;

  if (a3
    && +[TLKLayoutUtilities isSuperLargeAccessibilitySize](TLKLayoutUtilities, "isSuperLargeAccessibilitySize")&& !-[NUIContainerStackView axis](self, "axis"))
  {
    v5 = 1;
    -[TLKStackView setAxis:](self, "setAxis:", 1);
    -[TLKStackView setAlignment:](self, "setAlignment:", 1);
  }
  else
  {
    v5 = 0;
  }
  -[TLKStackView setIsForcedToBeVertical:](self, "setIsForcedToBeVertical:", v5);
  self->_flipsToVerticalAxisForAccessibilityContentSizes = a3;
}

- (void)setIsForcedToBeVertical:(BOOL)a3
{
  self->_isForcedToBeVertical = a3;
}

- (void)setAlignment:(int64_t)a3
{
  objc_super v5;

  if (!-[TLKStackView isForcedToBeVertical](self, "isForcedToBeVertical"))
  {
    v5.receiver = self;
    v5.super_class = (Class)TLKStackView;
    -[NUIContainerStackView setAlignment:](&v5, sel_setAlignment_, a3);
  }
}

- (BOOL)isForcedToBeVertical
{
  return self->_isForcedToBeVertical;
}

- (void)setAxis:(int64_t)a3
{
  objc_super v5;
  objc_super v6;

  if (-[TLKStackView flipsToVerticalAxisForAccessibilityContentSizes](self, "flipsToVerticalAxisForAccessibilityContentSizes")&& +[TLKLayoutUtilities isSuperLargeAccessibilitySize](TLKLayoutUtilities, "isSuperLargeAccessibilitySize"))
  {
    -[NUIContainerStackView setAxis:](&v6, sel_setAxis_, 1, v5.receiver, v5.super_class, self, TLKStackView);
  }
  else
  {
    -[NUIContainerStackView setAxis:](&v5, sel_setAxis_, a3, self, TLKStackView, v6.receiver, v6.super_class);
  }
}

- (BOOL)flipsToVerticalAxisForAccessibilityContentSizes
{
  return self->_flipsToVerticalAxisForAccessibilityContentSizes;
}

- (void)addArrangedSubview:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TLKStackView;
  -[TLKStackView addArrangedSubview:](&v3, sel_addArrangedSubview_, a3);
}

@end

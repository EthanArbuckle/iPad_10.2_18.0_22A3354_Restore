@implementation SBShelfIconBounceTransitionModifier

- (SBShelfIconBounceTransitionModifier)initWithTransitionID:(id)a3 shelf:(id)a4
{
  id v7;
  SBShelfIconBounceTransitionModifier *v8;
  SBShelfIconBounceTransitionModifier *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBShelfIconBounceTransitionModifier;
  v8 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v11, sel_initWithTransitionID_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_shelf, a4);

  return v9;
}

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone](SBSwitcherKeyboardSuppressionMode, "suppressionModeNone");
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (unint64_t)bounceIconGenerationCountForCurrentCount:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v8;

  -[SBShelfIconBounceTransitionModifier presentationAttributesForShelf:](self, "presentationAttributesForShelf:", self->_shelf);
  v5 = v8;
  if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1 && v5 == 1)
    return a3 + 1;
  else
    return a3;
}

- (id)bounceIconBundleIdentifier
{
  return -[SBSwitcherShelf bundleIdentifier](self->_shelf, "bundleIdentifier");
}

- (CGRect)bounceIconInitialFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[SBShelfIconBounceTransitionModifier presentationAttributesForShelf:](self, "presentationAttributesForShelf:", self->_shelf);
  v2 = v6;
  v3 = v7;
  v4 = v8;
  v5 = v9;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelf, 0);
}

@end

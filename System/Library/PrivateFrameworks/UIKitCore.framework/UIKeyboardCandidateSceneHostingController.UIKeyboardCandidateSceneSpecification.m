@implementation UIKeyboardCandidateSceneHostingController.UIKeyboardCandidateSceneSpecification

- (id)userActivity
{
  id v3;
  _TtCE5UIKitCSo41UIKeyboardCandidateSceneHostingController37UIKeyboardCandidateSceneSpecification *v4;
  void *v5;
  id v6;

  v3 = objc_allocWithZone(MEMORY[0x1E0CB3B10]);
  v4 = self;
  v5 = (void *)sub_1865074D4();
  v6 = objc_msgSend(v3, sel_initWithActivityType_, v5);

  return v6;
}

- (_TtCE5UIKitCSo41UIKeyboardCandidateSceneHostingController37UIKeyboardCandidateSceneSpecification)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s37UIKeyboardCandidateSceneSpecificationCMa();
  return -[UIKeyboardCandidateSceneHostingController.UIKeyboardCandidateSceneSpecification init](&v3, sel_init);
}

@end

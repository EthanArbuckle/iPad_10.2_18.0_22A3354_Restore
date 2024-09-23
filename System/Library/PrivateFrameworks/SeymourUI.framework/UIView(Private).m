@implementation UIView(Private)

+ (uint64_t)smu_isInAnimationBlock
{
  return objc_msgSend((id)objc_opt_class(), "_isInAnimationBlock");
}

+ (uint64_t)smu_coreAnimationDefaultCurve
{
  return 327680;
}

+ (uint64_t)smu_animateUsingSpringWithDuration:()Private delay:options:mass:stiffness:damping:initialVelocity:animations:
{
  return objc_msgSend(a1, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", a3, a4, 0);
}

+ (void)smu_animateUsingSpringWithTension:()Private friction:animations:completion:
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __84__UIView_Private__smu_animateUsingSpringWithTension_friction_animations_completion___block_invoke;
  v12[3] = &unk_24F555D18;
  v13 = v10;
  v11 = v10;
  objc_msgSend(a1, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, a5, v12, a2, a3);

}

@end

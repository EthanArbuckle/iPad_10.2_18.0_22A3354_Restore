@implementation UIApplicationSceneDeactivationAssertion(SBWindowScene)

- (void)sb_acquireWithPredicate:()SBWindowScene transitionContext:displayIdentity:
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __116__UIApplicationSceneDeactivationAssertion_SBWindowScene__sb_acquireWithPredicate_transitionContext_displayIdentity___block_invoke;
  v12[3] = &unk_1E8EB6B18;
  v13 = v9;
  v14 = v8;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a1, "acquireWithPredicate:transitionContext:", v12, a4);

}

- (uint64_t)sb_acquireForDisplayIdentity:()SBWindowScene
{
  return objc_msgSend(a1, "sb_acquireWithPredicate:transitionContext:displayIdentity:", 0, 0, a3);
}

@end

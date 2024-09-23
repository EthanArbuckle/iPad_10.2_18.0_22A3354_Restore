@implementation UIView(Workflow)

- (uint64_t)wf_containsFirstResponder
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isDescendantOfView:", a1);
  else
    v4 = 0;

  return v4;
}

- (id)wf_addConstraintsToFillSuperview:()Workflow
{
  return WFAddConstraintsToFillAnchorProvider(a1, a3, *MEMORY[0x24BEBD250], *(double *)(MEMORY[0x24BEBD250] + 8), *(double *)(MEMORY[0x24BEBD250] + 16), *(double *)(MEMORY[0x24BEBD250] + 24));
}

- (id)wf_addConstraintsToFillSuperview:()Workflow insets:
{
  return WFAddConstraintsToFillAnchorProvider(a1, a7, a2, a3, a4, a5);
}

- (id)wf_addConstraintsToFillLayoutGuide:()Workflow
{
  return WFAddConstraintsToFillAnchorProvider(a1, a3, *MEMORY[0x24BEBD250], *(double *)(MEMORY[0x24BEBD250] + 8), *(double *)(MEMORY[0x24BEBD250] + 16), *(double *)(MEMORY[0x24BEBD250] + 24));
}

- (id)wf_addConstraintsToFillLayoutGuide:()Workflow insets:
{
  return WFAddConstraintsToFillAnchorProvider(a1, a7, a2, a3, a4, a5);
}

@end

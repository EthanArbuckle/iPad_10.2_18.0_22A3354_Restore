@implementation SBFFluidBehaviorSettings(SBSwitcherModifierDebugTimelineDescription)

- (id)sb_switcherModifierDebugTimelineDescription
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "response");
  v6 = v5;
  objc_msgSend(a1, "dampingRatio");
  v8 = v7;
  objc_msgSend(a1, "trackingResponse");
  v10 = v9;
  objc_msgSend(a1, "trackingDampingRatio");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@:%p response: %0.3f\ndampingRatio: %0.3f\ntrackingResponse: %0.3f\ntrackingDampingRatio: %0.3f>"), v4, a1, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end

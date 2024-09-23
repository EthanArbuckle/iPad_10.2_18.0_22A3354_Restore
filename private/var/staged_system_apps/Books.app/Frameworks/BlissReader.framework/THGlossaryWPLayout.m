@implementation THGlossaryWPLayout

- (id)reliedOnLayouts
{
  if (-[THGlossaryWPLayout layoutRequirementsProvider](self, "layoutRequirementsProvider"))
    return -[THGlossaryLayoutRequirementsProvider reliedOnLayoutsForLayout:](-[THGlossaryWPLayout layoutRequirementsProvider](self, "layoutRequirementsProvider"), "reliedOnLayoutsForLayout:", self);
  else
    return +[NSSet set](NSSet, "set");
}

- (THGlossaryLayoutRequirementsProvider)layoutRequirementsProvider
{
  return self->mLayoutRequirementsProvider;
}

- (void)setLayoutRequirementsProvider:(id)a3
{
  self->mLayoutRequirementsProvider = (THGlossaryLayoutRequirementsProvider *)a3;
}

@end

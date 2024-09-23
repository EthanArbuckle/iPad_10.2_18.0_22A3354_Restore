@implementation _TUIElementAnimationGroupBuilder

- (void)addAnimationGroupPhase:(id)a3 withName:(id)a4
{
  id v6;
  NSMutableDictionary *phases;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  phases = self->_phases;
  if (!phases)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    v9 = self->_phases;
    self->_phases = v8;

    phases = self->_phases;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](phases, "setObject:forKeyedSubscript:", v10, v6);

}

- (id)finalizeAnimationGroup
{
  TUIAnimationGroup *v3;

  v3 = objc_alloc_init(TUIAnimationGroup);
  -[TUIAnimationGroup setPhases:](v3, "setPhases:", self->_phases);
  return v3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_phases, 0);
}

@end

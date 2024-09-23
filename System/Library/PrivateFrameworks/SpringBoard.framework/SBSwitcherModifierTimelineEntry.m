@implementation SBSwitcherModifierTimelineEntry

- (SBSwitcherModifierTimelineEntry)initWithEventSnapshot:(id)a3 responseSnapshot:(id)a4 stackSnapshotAfterEvent:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  SBSwitcherModifierTimelineEntry *v14;
  SBSwitcherModifierTimelineEntry *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherModifierTimelineEntry.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventSnapshot"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherModifierTimelineEntry.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stackSnapshotAfterEvent"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)SBSwitcherModifierTimelineEntry;
  v14 = -[SBSwitcherModifierTimelineEntry init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_eventSnapshot, a3);
    objc_storeStrong((id *)&v15->_responseSnapshot, a4);
    objc_storeStrong((id *)&v15->_stackSnapshotAfterEvent, a5);
  }

  return v15;
}

- (SBSwitcherModifierEventSnapshot)eventSnapshot
{
  return self->_eventSnapshot;
}

- (SBSwitcherModifierStackSnapshot)stackSnapshotAfterEvent
{
  return self->_stackSnapshotAfterEvent;
}

- (SBSwitcherModifierEventResponseSnapshot)responseSnapshot
{
  return self->_responseSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseSnapshot, 0);
  objc_storeStrong((id *)&self->_stackSnapshotAfterEvent, 0);
  objc_storeStrong((id *)&self->_eventSnapshot, 0);
}

@end

@implementation SBSwitcherModifierEventSnapshot

- (SBSwitcherModifierEventSnapshot)initWithEvent:(id)a3
{
  id v5;
  SBSwitcherModifierEventSnapshot *v6;
  void *v7;
  uint64_t v8;
  void *eventName;
  void *v10;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;
  NSString *eventDescription;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSString *v26;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString *v34;
  uint64_t v35;
  void *v36;
  NSString *v37;
  objc_super v38;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherModifierTimelineEntry.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  v38.receiver = self;
  v38.super_class = (Class)SBSwitcherModifierEventSnapshot;
  v6 = -[SBSwitcherModifierEventSnapshot init](&v38, sel_init);
  if (v6)
  {
    if (objc_msgSend(v5, "isTransitionEvent"))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      SBStringFromTransitionPhase(objc_msgSend(v5, "phase"));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v5, "isGestureEvent"))
      {
        if (objc_msgSend(v5, "type") == 15)
        {
          v28 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v5, "reason");
          eventName = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringWithFormat:", CFSTR("Timer: %@"), eventName);
        }
        else
        {
          if (objc_msgSend(v5, "type") != 24)
          {
            NSStringFromSBSwitcherModifierEventType(objc_msgSend(v5, "type"));
            v35 = objc_claimAutoreleasedReturnValue();
            eventName = v6->_eventName;
            v6->_eventName = (NSString *)v35;
            goto LABEL_9;
          }
          objc_msgSend(v5, "appLayout");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "itemForLayoutRole:", 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "uniqueIdentifier");
          eventName = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(eventName, "hasPrefix:", CFSTR("sceneID:")))
          {
            objc_msgSend(eventName, "substringFromIndex:", 8);
            v31 = objc_claimAutoreleasedReturnValue();

            eventName = (void *)v31;
          }
          if (objc_msgSend(eventName, "hasPrefix:", CFSTR("com.apple.")))
          {
            objc_msgSend(eventName, "substringFromIndex:", 10);
            v32 = objc_claimAutoreleasedReturnValue();

            eventName = (void *)v32;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SceneReady: %@"), eventName);
        }
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v6->_eventName;
        v6->_eventName = (NSString *)v33;

LABEL_9:
        objc_msgSend(v5, "description");
        v13 = objc_claimAutoreleasedReturnValue();
        eventDescription = v6->_eventDescription;
        v6->_eventDescription = (NSString *)v13;

        v15 = objc_opt_class();
        SBSafeCast(v15, v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v37 = v6->_eventDescription;
          objc_msgSend(v16, "fromAppLayout");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "toAppLayout");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "fromFloatingAppLayout");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "toFloatingAppLayout");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "fromShelf");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "toShelf");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "debugPredicateSummary");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString stringByAppendingFormat:](v37, "stringByAppendingFormat:", CFSTR("\n\nfromAppLayout:\n%@\n\ntoAppLayout:\n%@\n\nfromFloatingAppLayout:\n%@\n\ntoFloatingAppLayout:\n%@\n\nfromShelf:\n%@\n\ntoShelf:\n%@\n\nPredicate Summary:\n%@"), v18, v19, v20, v21, v22, v23, v24);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = v6->_eventDescription;
          v6->_eventDescription = (NSString *)v25;

        }
        goto LABEL_12;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      SBStringFromGesturePhase(objc_msgSend(v5, "phase"));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    eventName = (void *)v8;
    NSStringFromSBSwitcherModifierEventType(objc_msgSend(v5, "type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@"), eventName, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v6->_eventName;
    v6->_eventName = (NSString *)v11;

    goto LABEL_9;
  }
LABEL_12:

  return v6;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDescription, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end

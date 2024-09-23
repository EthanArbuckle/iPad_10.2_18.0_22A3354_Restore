@implementation RCPNaturalInputCollectionEventStream

- (RCPNaturalInputCollectionEventStream)initWithCurrentTimeOffset:(double)a3 timestampProvider:(id)a4 senderProperties:(id)a5
{
  RCPMachTimestampProvider *v8;
  RCPEventSenderProperties *v9;
  RCPNaturalInputCollectionEventStream *v10;
  RCPMachTimestampProvider *timestampProvider;
  RCPMachTimestampProvider *v12;
  RCPEventSenderProperties *senderProperties;
  RCPEventSenderProperties *v14;
  RCPNaturalInputCollectionSelection *currentSelection;
  uint64_t v16;
  NSMutableDictionary *currentManipulatorsBySourceGroup;
  uint64_t v18;
  NSMutableArray *eventBuffer;
  objc_super v21;

  v8 = (RCPMachTimestampProvider *)a4;
  v9 = (RCPEventSenderProperties *)a5;
  v21.receiver = self;
  v21.super_class = (Class)RCPNaturalInputCollectionEventStream;
  v10 = -[RCPNaturalInputCollectionEventStream init](&v21, sel_init);
  v10->_currentTimeOffset = a3;
  timestampProvider = v10->_timestampProvider;
  v10->_timestampProvider = v8;
  v12 = v8;

  senderProperties = v10->_senderProperties;
  v10->_senderProperties = v9;
  v14 = v9;

  currentSelection = v10->_currentSelection;
  v10->_currentSelection = 0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = objc_claimAutoreleasedReturnValue();
  currentManipulatorsBySourceGroup = v10->_currentManipulatorsBySourceGroup;
  v10->_currentManipulatorsBySourceGroup = (NSMutableDictionary *)v16;

  v10->_currentPhase = 3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = objc_claimAutoreleasedReturnValue();
  eventBuffer = v10->_eventBuffer;
  v10->_eventBuffer = (NSMutableArray *)v18;

  return v10;
}

- (void)advanceTime:(double)a3
{
  double v5;

  -[RCPNaturalInputCollectionEventStream currentTimeOffset](self, "currentTimeOffset");
  -[RCPNaturalInputCollectionEventStream setCurrentTimeOffset:](self, "setCurrentTimeOffset:", v5 + a3);
}

- (void)openManipulatorAtLocation:(CGPoint)a3 withZPosition:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6
{
  RCPNaturalInputCollectionManipulator *v8;
  void *v9;
  void *v10;

  v8 = -[RCPNaturalInputCollectionManipulator initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:]([RCPNaturalInputCollectionManipulator alloc], "initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:", a5, a6, 1, a3.x, a3.y, a4);
  -[RCPNaturalInputCollectionEventStream currentManipulatorsBySourceGroup](self, "currentManipulatorsBySourceGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  -[RCPNaturalInputCollectionEventStream updatePhase](self, "updatePhase");
  -[RCPNaturalInputCollectionEventStream commitEvent](self, "commitEvent");
}

- (void)closeManipulatorAtLocation:(CGPoint)a3 withZPosition:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6
{
  RCPNaturalInputCollectionManipulator *v8;
  void *v9;
  void *v10;

  v8 = -[RCPNaturalInputCollectionManipulator initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:]([RCPNaturalInputCollectionManipulator alloc], "initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:", a5, a6, 0, a3.x, a3.y, a4);
  -[RCPNaturalInputCollectionEventStream currentManipulatorsBySourceGroup](self, "currentManipulatorsBySourceGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  -[RCPNaturalInputCollectionEventStream updatePhase](self, "updatePhase");
  -[RCPNaturalInputCollectionEventStream commitEvent](self, "commitEvent");
}

- (void)moveManipulatorByDelta:(CGVector)a3 withZDelta:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6
{
  double dy;
  double dx;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  RCPNaturalInputCollectionManipulator *v19;
  void *v20;
  void *v21;
  id v22;

  dy = a3.dy;
  dx = a3.dx;
  -[RCPNaturalInputCollectionEventStream currentManipulatorsBySourceGroup](self, "currentManipulatorsBySourceGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v22, "location");
    v15 = dx + v14;
    objc_msgSend(v22, "location");
    v17 = dy + v16;
    objc_msgSend(v22, "zPosition");
    v19 = -[RCPNaturalInputCollectionManipulator initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:]([RCPNaturalInputCollectionManipulator alloc], "initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:", a5, a6, objc_msgSend(v22, "isOpen"), v15, v17, v18 + a4);
    -[RCPNaturalInputCollectionEventStream currentManipulatorsBySourceGroup](self, "currentManipulatorsBySourceGroup");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);

    -[RCPNaturalInputCollectionEventStream updatePhase](self, "updatePhase");
    -[RCPNaturalInputCollectionEventStream commitEvent](self, "commitEvent");
  }

}

- (void)moveManipulatorToLocation:(CGPoint)a3 withZPosition:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6
{
  double y;
  double x;
  void *v12;
  void *v13;
  RCPNaturalInputCollectionManipulator *v14;
  void *v15;
  void *v16;
  id v17;

  y = a3.y;
  x = a3.x;
  -[RCPNaturalInputCollectionEventStream currentManipulatorsBySourceGroup](self, "currentManipulatorsBySourceGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v14 = -[RCPNaturalInputCollectionManipulator initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:]([RCPNaturalInputCollectionManipulator alloc], "initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:", a5, a6, objc_msgSend(v17, "isOpen"), x, y, a4);
    -[RCPNaturalInputCollectionEventStream currentManipulatorsBySourceGroup](self, "currentManipulatorsBySourceGroup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

    -[RCPNaturalInputCollectionEventStream updatePhase](self, "updatePhase");
    -[RCPNaturalInputCollectionEventStream commitEvent](self, "commitEvent");
  }

}

- (void)moveSelectionByDelta:(CGVector)a3 withZDelta:(double)a4
{
  -[RCPNaturalInputCollectionEventStream moveSelectionByDelta:zDelta:directionDelta:zDirectionDelta:](self, "moveSelectionByDelta:zDelta:directionDelta:zDirectionDelta:", a3.dx, a3.dy, a4, 0.0, 0.0, 0.0);
}

- (void)moveSelectionByDelta:(CGVector)a3 zDelta:(double)a4 directionDelta:(CGVector)a5 zDirectionDelta:(double)a6
{
  double dy;
  double dx;
  double v10;
  double v11;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  RCPNaturalInputCollectionSelection *v32;

  dy = a5.dy;
  dx = a5.dx;
  v10 = a3.dy;
  v11 = a3.dx;
  -[RCPNaturalInputCollectionEventStream currentSelection](self, "currentSelection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[RCPNaturalInputCollectionEventStream currentSelection](self, "currentSelection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "location");
    v16 = v11 + v15;
    -[RCPNaturalInputCollectionEventStream currentSelection](self, "currentSelection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "location");
    v19 = v10 + v18;

    -[RCPNaturalInputCollectionEventStream currentSelection](self, "currentSelection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "zPosition");
    v22 = v21 + a4;

    -[RCPNaturalInputCollectionEventStream currentSelection](self, "currentSelection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "direction");
    v25 = dx + v24;
    -[RCPNaturalInputCollectionEventStream currentSelection](self, "currentSelection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "direction");
    v28 = dy + v27;

    -[RCPNaturalInputCollectionEventStream currentSelection](self, "currentSelection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "zDirection");
    v31 = v30 + a6;

    v32 = -[RCPNaturalInputCollectionSelection initWithLocation:zPosition:direction:zDirection:]([RCPNaturalInputCollectionSelection alloc], "initWithLocation:zPosition:direction:zDirection:", v16, v19, v22, v25, v28, v31);
    -[RCPNaturalInputCollectionEventStream setCurrentSelection:](self, "setCurrentSelection:", v32);
    -[RCPNaturalInputCollectionEventStream updatePhase](self, "updatePhase");
    -[RCPNaturalInputCollectionEventStream commitEvent](self, "commitEvent");

  }
}

- (void)moveSelectionToLocation:(CGPoint)a3 withZPosition:(double)a4
{
  -[RCPNaturalInputCollectionEventStream moveSelectionToLocation:zPosition:direction:zDirection:](self, "moveSelectionToLocation:zPosition:direction:zDirection:", a3.x, a3.y, a4, 0.0, 0.0, -1.0);
}

- (void)moveSelectionToLocation:(CGPoint)a3 zPosition:(double)a4 direction:(CGPoint)a5 zDirection:(double)a6
{
  RCPNaturalInputCollectionSelection *v7;

  v7 = -[RCPNaturalInputCollectionSelection initWithLocation:zPosition:direction:zDirection:]([RCPNaturalInputCollectionSelection alloc], "initWithLocation:zPosition:direction:zDirection:", a3.x, a3.y, a4, a5.x, a5.y, a6);
  -[RCPNaturalInputCollectionEventStream setCurrentSelection:](self, "setCurrentSelection:", v7);
  -[RCPNaturalInputCollectionEventStream updatePhase](self, "updatePhase");
  -[RCPNaturalInputCollectionEventStream commitEvent](self, "commitEvent");

}

- (void)finish
{
  -[RCPNaturalInputCollectionEventStream setCurrentPhase:](self, "setCurrentPhase:", 3);
  -[RCPNaturalInputCollectionEventStream commitEvent](self, "commitEvent");
}

- (void)updatePhase
{
  uint64_t v3;

  if (-[RCPNaturalInputCollectionEventStream currentPhase](self, "currentPhase") == 3)
    v3 = 1;
  else
    v3 = 2;
  -[RCPNaturalInputCollectionEventStream setCurrentPhase:](self, "setCurrentPhase:", v3);
}

- (id)finalizedEvents
{
  void *v2;
  void *v3;

  -[RCPNaturalInputCollectionEventStream eventBuffer](self, "eventBuffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)commitEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  RCPNaturalInputCollectionEvent *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  RCPNaturalInputCollectionEvent *v12;
  void *v13;
  id v14;

  -[RCPNaturalInputCollectionEventStream currentSelection](self, "currentSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99D20];
  if (v3)
  {
    -[RCPNaturalInputCollectionEventStream currentSelection](self, "currentSelection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "arrayWithObject:", v6);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  v7 = [RCPNaturalInputCollectionEvent alloc];
  -[RCPNaturalInputCollectionEventStream currentManipulatorsBySourceGroup](self, "currentManipulatorsBySourceGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[RCPNaturalInputCollectionEventStream currentPhase](self, "currentPhase");
  -[RCPNaturalInputCollectionEventStream timestampProvider](self, "timestampProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPNaturalInputCollectionEventStream currentTimeOffset](self, "currentTimeOffset");
  v12 = -[RCPNaturalInputCollectionEvent initWithManipulators:selections:phase:timestamp:senderProperties:](v7, "initWithManipulators:selections:phase:timestamp:senderProperties:", v9, v14, v10, objc_msgSend(v11, "machAbsoluteTimeForTimeInterval:"), self->_senderProperties);

  -[RCPNaturalInputCollectionEventStream eventBuffer](self, "eventBuffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v12);

}

- (RCPEventSenderProperties)senderProperties
{
  return self->_senderProperties;
}

- (void)setSenderProperties:(id)a3
{
  objc_storeStrong((id *)&self->_senderProperties, a3);
}

- (double)currentTimeOffset
{
  return self->_currentTimeOffset;
}

- (void)setCurrentTimeOffset:(double)a3
{
  self->_currentTimeOffset = a3;
}

- (RCPMachTimestampProvider)timestampProvider
{
  return (RCPMachTimestampProvider *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTimestampProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (RCPNaturalInputCollectionSelection)currentSelection
{
  return (RCPNaturalInputCollectionSelection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentSelection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)currentManipulatorsBySourceGroup
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentManipulatorsBySourceGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int64_t)currentPhase
{
  return self->_currentPhase;
}

- (void)setCurrentPhase:(int64_t)a3
{
  self->_currentPhase = a3;
}

- (NSMutableArray)eventBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEventBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBuffer, 0);
  objc_storeStrong((id *)&self->_currentManipulatorsBySourceGroup, 0);
  objc_storeStrong((id *)&self->_currentSelection, 0);
  objc_storeStrong((id *)&self->_timestampProvider, 0);
  objc_storeStrong((id *)&self->_senderProperties, 0);
}

@end

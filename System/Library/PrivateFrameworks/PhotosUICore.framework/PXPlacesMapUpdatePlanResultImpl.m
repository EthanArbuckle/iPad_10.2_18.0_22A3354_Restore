@implementation PXPlacesMapUpdatePlanResultImpl

- (PXPlacesMapUpdatePlanResultImpl)init
{
  PXPlacesMapUpdatePlanResultImpl *v2;
  uint64_t v3;
  NSMutableSet *annotationsToAddImmediately;
  uint64_t v5;
  NSMutableSet *annotationsToRemoveImmediately;
  uint64_t v7;
  NSMutableSet *annotationsToRemoveAfterAnimationHasEnded;
  uint64_t v9;
  NSMutableSet *annotationsToRemoveAfterAnimationHasStarted;
  uint64_t v11;
  NSMutableSet *annotationsToRedraw;
  uint64_t v13;
  NSMutableSet *annotationsWithUpdatedIndex;
  uint64_t v15;
  NSMutableSet *overlaysToAddImmediately;
  uint64_t v17;
  NSMutableSet *overlaysToRemoveImmediately;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PXPlacesMapUpdatePlanResultImpl;
  v2 = -[PXPlacesMapUpdatePlanResultImpl init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    annotationsToAddImmediately = v2->_annotationsToAddImmediately;
    v2->_annotationsToAddImmediately = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    annotationsToRemoveImmediately = v2->_annotationsToRemoveImmediately;
    v2->_annotationsToRemoveImmediately = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    annotationsToRemoveAfterAnimationHasEnded = v2->_annotationsToRemoveAfterAnimationHasEnded;
    v2->_annotationsToRemoveAfterAnimationHasEnded = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    annotationsToRemoveAfterAnimationHasStarted = v2->_annotationsToRemoveAfterAnimationHasStarted;
    v2->_annotationsToRemoveAfterAnimationHasStarted = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    annotationsToRedraw = v2->_annotationsToRedraw;
    v2->_annotationsToRedraw = (NSMutableSet *)v11;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    annotationsWithUpdatedIndex = v2->_annotationsWithUpdatedIndex;
    v2->_annotationsWithUpdatedIndex = (NSMutableSet *)v13;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    overlaysToAddImmediately = v2->_overlaysToAddImmediately;
    v2->_overlaysToAddImmediately = (NSMutableSet *)v15;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    overlaysToRemoveImmediately = v2->_overlaysToRemoveImmediately;
    v2->_overlaysToRemoveImmediately = (NSMutableSet *)v17;

  }
  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v19.receiver = self;
  v19.super_class = (Class)PXPlacesMapUpdatePlanResultImpl;
  -[PXPlacesMapUpdatePlanResultImpl description](&v19, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", CFSTR("---------------------\n"));
  -[PXPlacesMapUpdatePlanResultImpl annotationsToAddImmediately](self, "annotationsToAddImmediately");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[PXPlacesMapUpdatePlanResultImpl annotationsToAddImmediately](self, "annotationsToAddImmediately");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("- Add Immediately: %lu:\n%@\n\n"), v7, v8);

  -[PXPlacesMapUpdatePlanResultImpl annotationsToRemoveImmediately](self, "annotationsToRemoveImmediately");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  -[PXPlacesMapUpdatePlanResultImpl annotationsToRemoveImmediately](self, "annotationsToRemoveImmediately");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("- Remove Immediately: %lu:\n%@\n\n"), v10, v11);

  -[PXPlacesMapUpdatePlanResultImpl annotationsToRemoveAfterAnimationHasStarted](self, "annotationsToRemoveAfterAnimationHasStarted");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  -[PXPlacesMapUpdatePlanResultImpl annotationsToRemoveAfterAnimationHasStarted](self, "annotationsToRemoveAfterAnimationHasStarted");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("- Remove After Animation Started: %lu:\n%@\n\n"), v13, v14);

  -[PXPlacesMapUpdatePlanResultImpl annotationsToRemoveAfterAnimationHasEnded](self, "annotationsToRemoveAfterAnimationHasEnded");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  -[PXPlacesMapUpdatePlanResultImpl annotationsToRemoveAfterAnimationHasEnded](self, "annotationsToRemoveAfterAnimationHasEnded");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("- Remove After Animation Ended: %lu:\n%@\n\n"), v16, v17);

  return (NSString *)v5;
}

- (NSMutableSet)annotationsToAddImmediately
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableSet)annotationsToRemoveImmediately
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableSet)annotationsToRemoveAfterAnimationHasStarted
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableSet)annotationsToRemoveAfterAnimationHasEnded
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableSet)annotationsToRedraw
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableSet)annotationsWithUpdatedIndex
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableSet)overlaysToAddImmediately
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableSet)overlaysToRemoveImmediately
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlaysToRemoveImmediately, 0);
  objc_storeStrong((id *)&self->_overlaysToAddImmediately, 0);
  objc_storeStrong((id *)&self->_annotationsWithUpdatedIndex, 0);
  objc_storeStrong((id *)&self->_annotationsToRedraw, 0);
  objc_storeStrong((id *)&self->_annotationsToRemoveAfterAnimationHasEnded, 0);
  objc_storeStrong((id *)&self->_annotationsToRemoveAfterAnimationHasStarted, 0);
  objc_storeStrong((id *)&self->_annotationsToRemoveImmediately, 0);
  objc_storeStrong((id *)&self->_annotationsToAddImmediately, 0);
}

@end

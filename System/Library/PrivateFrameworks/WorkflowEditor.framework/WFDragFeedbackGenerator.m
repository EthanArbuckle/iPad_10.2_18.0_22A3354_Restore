@implementation WFDragFeedbackGenerator

- (WFDragFeedbackGenerator)initWithCollectionView:(id)a3
{
  id v5;
  WFDragFeedbackGenerator *v6;
  uint64_t v7;
  _UIDragSnappingFeedbackGenerator *feedbackGenerator;
  WFDragFeedbackGenerator *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDragFeedbackGenerator.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collectionView"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFDragFeedbackGenerator;
  v6 = -[WFDragFeedbackGenerator init](&v12, sel_init);
  if (v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "_reorderFeedbackGenerator");
      v7 = objc_claimAutoreleasedReturnValue();
      feedbackGenerator = v6->_feedbackGenerator;
      v6->_feedbackGenerator = (_UIDragSnappingFeedbackGenerator *)v7;

    }
    v9 = v6;
  }

  return v6;
}

- (WFDragFeedbackGenerator)init
{
  WFDragFeedbackGenerator *v2;
  _UIDragSnappingFeedbackGenerator *v3;
  _UIDragSnappingFeedbackGenerator *feedbackGenerator;
  WFDragFeedbackGenerator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFDragFeedbackGenerator;
  v2 = -[WFDragFeedbackGenerator init](&v7, sel_init);
  if (v2)
  {
    v3 = (_UIDragSnappingFeedbackGenerator *)objc_alloc_init(MEMORY[0x24BEBDC00]);
    feedbackGenerator = v2->_feedbackGenerator;
    v2->_feedbackGenerator = v3;

    v5 = v2;
  }

  return v2;
}

- (void)draggingStarted
{
  -[WFDragFeedbackGenerator userInteractionStarted](self, "userInteractionStarted");
  -[WFDragFeedbackGenerator draggedObjectLifted](self, "draggedObjectLifted");
}

- (void)draggingItemSnapped
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __46__WFDragFeedbackGenerator_draggingItemSnapped__block_invoke;
  v2[3] = &unk_24EE25C70;
  v2[4] = self;
  -[WFDragFeedbackGenerator performFeedbackWithDelay:insideBlock:](self, "performFeedbackWithDelay:insideBlock:", v2, 0.05);
}

- (void)draggingItemDropped
{
  _QWORD v3[5];

  -[WFDragFeedbackGenerator userInteractionEnded](self, "userInteractionEnded");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__WFDragFeedbackGenerator_draggingItemDropped__block_invoke;
  v3[3] = &unk_24EE25C70;
  v3[4] = self;
  -[WFDragFeedbackGenerator performFeedbackWithDelay:insideBlock:](self, "performFeedbackWithDelay:insideBlock:", v3, 0.3);
}

- (void)performFeedbackWithDelay:(double)a3 insideBlock:(id)a4
{
  id v6;

  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UIDragSnappingFeedbackGenerator performFeedbackWithDelay:insideBlock:](self->_feedbackGenerator, "performFeedbackWithDelay:insideBlock:", v6, a3);

}

- (void)userInteractionStarted
{
  int64_t activeDragSessions;

  activeDragSessions = self->_activeDragSessions;
  self->_activeDragSessions = activeDragSessions + 1;
  if (!activeDragSessions && (objc_opt_respondsToSelector() & 1) != 0)
    -[_UIDragSnappingFeedbackGenerator userInteractionStarted](self->_feedbackGenerator, "userInteractionStarted");
}

- (void)userInteractionEnded
{
  int64_t v2;

  v2 = self->_activeDragSessions - 1;
  self->_activeDragSessions = v2;
  if (!v2 && (objc_opt_respondsToSelector() & 1) != 0)
    -[_UIDragSnappingFeedbackGenerator userInteractionEnded](self->_feedbackGenerator, "userInteractionEnded");
}

- (void)userInteractionCancelled
{
  int64_t v2;

  v2 = self->_activeDragSessions - 1;
  self->_activeDragSessions = v2;
  if (!v2 && (objc_opt_respondsToSelector() & 1) != 0)
    -[_UIDragSnappingFeedbackGenerator userInteractionCancelled](self->_feedbackGenerator, "userInteractionCancelled");
}

- (void)positionUpdated
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UIDragSnappingFeedbackGenerator positionUpdated](self->_feedbackGenerator, "positionUpdated");
}

- (void)dropTargetUpdated
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UIDragSnappingFeedbackGenerator dropTargetUpdated](self->_feedbackGenerator, "dropTargetUpdated");
}

- (void)draggedObjectLifted
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UIDragSnappingFeedbackGenerator draggedObjectLifted](self->_feedbackGenerator, "draggedObjectLifted");
}

- (void)draggedObjectLanded
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UIDragSnappingFeedbackGenerator draggedObjectLanded](self->_feedbackGenerator, "draggedObjectLanded");
}

- (void)objectSnapped
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UIDragSnappingFeedbackGenerator objectSnapped](self->_feedbackGenerator, "objectSnapped");
}

- (int64_t)activeDragSessions
{
  return self->_activeDragSessions;
}

- (void)setActiveDragSessions:(int64_t)a3
{
  self->_activeDragSessions = a3;
}

- (_UIDragSnappingFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

uint64_t __46__WFDragFeedbackGenerator_draggingItemDropped__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "draggedObjectLanded");
}

uint64_t __46__WFDragFeedbackGenerator_draggingItemSnapped__block_invoke(uint64_t a1)
{
  uint64_t *v2;

  v2 = *(uint64_t **)(a1 + 32);
  if (v2[1] > 0)
    return objc_msgSend(v2, "objectSnapped");
  objc_msgSend(v2, "userInteractionStarted");
  objc_msgSend(*(id *)(a1 + 32), "objectSnapped");
  return objc_msgSend(*(id *)(a1 + 32), "userInteractionEnded");
}

@end

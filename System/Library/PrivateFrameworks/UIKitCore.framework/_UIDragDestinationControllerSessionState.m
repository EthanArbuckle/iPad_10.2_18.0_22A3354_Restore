@implementation _UIDragDestinationControllerSessionState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropSession, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  int state;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  _BOOL8 v12;
  _BOOL8 v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self)
  {
    state = self->_state;
    v8 = 0;
    v9 = CFSTR("suspended");
    v10 = CFSTR("pendingDragging");
    switch(state)
    {
      case 0:
        v8 = 0;
        v9 = CFSTR("initial");
        break;
      case 1:
        v10 = CFSTR("pendingReordering");
        goto LABEL_12;
      case 2:
        goto LABEL_12;
      case 3:
        v10 = CFSTR("reordering");
        goto LABEL_12;
      case 4:
        v10 = CFSTR("dragging");
        goto LABEL_12;
      case 5:
        v10 = CFSTR("pendingMultiItemDrop");
        goto LABEL_12;
      case 6:
        v10 = CFSTR("committing");
        goto LABEL_12;
      case 7:
        v10 = CFSTR("cancelling");
        goto LABEL_12;
      case 8:
        break;
      case 9:
        v10 = CFSTR("waitingForResume");
LABEL_12:
        v8 = 1;
        v9 = v10;
        break;
      default:
        v8 = 0;
        v9 = CFSTR("<unknown>");
        break;
    }
    v12 = state == 2 || state == 4;
    v13 = (state & 0xFFFFFFFD) == 1;
  }
  else
  {
    v12 = 0;
    v8 = 0;
    v13 = 0;
    v9 = CFSTR("initial");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; state = %@; isActive = %d; isDragging = %d; isReordering = %d>"),
    v5,
    self,
    v9,
    v8,
    v12,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end

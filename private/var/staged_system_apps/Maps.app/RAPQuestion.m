@implementation RAPQuestion

+ (id)RAPTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Report an Issue"), CFSTR("localized string not found"), 0));

  return v3;
}

- (NSString)localizedTitle
{
  return (NSString *)objc_msgSend((id)objc_opt_class(self), "RAPTitle");
}

- (NSString)localizedDescription
{
  return 0;
}

- (UIImage)image
{
  return 0;
}

- (BOOL)isAnonymous
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v3 = objc_msgSend(v2, "inChina");

  if ((v3 & 1) != 0)
    return 0;
  else
    return MapsFeature_IsEnabled_RAPCommunityID();
}

- (RAPQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  id v6;
  id v7;
  RAPQuestion *v8;
  RAPQuestion *v9;
  id v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RAPQuestion;
  v8 = -[RAPQuestion init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_report, v6);
    v10 = objc_storeWeak((id *)&v9->_parentQuestion, v7);
    objc_msgSend(v7, "_addChildQuestion:", v9);

  }
  return v9;
}

- (void)_addChildQuestion:(id)a3
{
  id v4;
  NSHashTable *children;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  children = self->_children;
  v8 = v4;
  if (!children)
  {
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    v7 = self->_children;
    self->_children = v6;

    v4 = v8;
    children = self->_children;
  }
  -[NSHashTable addObject:](children, "addObject:", v4);

}

- (void)_removeChildQuestion:(id)a3
{
  -[NSHashTable removeObject:](self->_children, "removeObject:", a3);
}

- (void)_removeFromParentQuestion
{
  RAPQuestion **p_parentQuestion;
  id WeakRetained;

  p_parentQuestion = &self->_parentQuestion;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentQuestion);
  objc_msgSend(WeakRetained, "_removeChildQuestion:", self);

  objc_storeWeak((id *)p_parentQuestion, 0);
}

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v6;
  NSMapTable *observers;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  observers = self->_observers;
  if (!observers)
  {
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  v10 = objc_msgSend(v6, "copy");
  -[NSMapTable setObject:forKey:](observers, "setObject:forKey:", v10, v11);

}

- (void)removeObserver:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:", a3);
}

- (void)_didChange
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = -[NSMapTable copy](self->_observers, "copy", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyEnumerator"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_observers, "objectForKey:", v9));
        ((void (**)(_QWORD, RAPQuestion *, uint64_t))v10)[2](v10, self, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
  objc_msgSend(v11, "_questionDidChange:", self);

}

- (void)_setComplete:(BOOL)a3
{
  -[RAPQuestion _setComplete:allowInvokingDidChange:](self, "_setComplete:allowInvokingDidChange:", a3, 1);
}

- (void)_setComplete:(BOOL)a3 allowInvokingDidChange:(BOOL)a4
{
  if (self->_complete != a3)
  {
    self->_complete = a3;
    if (a4)
      -[RAPQuestion _didChange](self, "_didChange");
  }
}

- (void)_prepareForSubmission
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_children, "allObjects", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "_prepareForSubmission");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (RAPAppStateProtocol)_context
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_context"));

  return (RAPAppStateProtocol *)v3;
}

- (RAPMapStateProtocol)_alternateMapViewContext
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_children, "allObjects", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6), "_alternateMapViewContext"));
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (RAPMapStateProtocol *)v8;
}

- (RAPMapStateProtocol)_alternatePlaceContext
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_children, "allObjects", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6), "_alternatePlaceContext"));
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (RAPMapStateProtocol *)v8;
}

- (RAPAuxiliaryControlsRecording)_alternateAuxiliaryControlsRecording
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_children, "allObjects", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6), "_alternateAuxiliaryControlsRecording"));
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (RAPAuxiliaryControlsRecording *)v8;
}

- (id)_reportedPlace
{
  RAPQuestion *v2;
  RAPQuestion *v3;
  RAPQuestion *v4;
  void *v5;
  void *v6;

  v2 = self;
  v3 = v2;
  do
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _alternatePlaceContext](v3, "_alternatePlaceContext"));
    v3 = (RAPQuestion *)objc_claimAutoreleasedReturnValue(-[RAPQuestion parentQuestion](v3, "parentQuestion"));

  }
  while (!v5 && v3);
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](v2, "_context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reportedPlace"));

  return v6;
}

- (BOOL)_isParentQuestionKindOfClass:(Class)a3
{
  RAPQuestion **p_parentQuestion;
  id WeakRetained;
  char isKindOfClass;
  id v8;
  unsigned __int8 v9;

  p_parentQuestion = &self->_parentQuestion;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentQuestion);
  isKindOfClass = objc_opt_isKindOfClass(WeakRetained, a3);

  if ((isKindOfClass & 1) != 0)
    return 1;
  v8 = objc_loadWeakRetained((id *)p_parentQuestion);
  v9 = objc_msgSend(v8, "_isParentQuestionKindOfClass:", a3);

  return v9;
}

- (id)_parentQuestionOfClass:(Class)a3
{
  RAPQuestion **p_parentQuestion;
  id WeakRetained;
  char isKindOfClass;
  id v7;
  void *v8;
  uint64_t v9;

  p_parentQuestion = &self->_parentQuestion;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentQuestion);
  isKindOfClass = objc_opt_isKindOfClass(WeakRetained, a3);

  v7 = objc_loadWeakRetained((id *)p_parentQuestion);
  v8 = v7;
  if ((isKindOfClass & 1) == 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_parentQuestionOfClass:", a3));

    v8 = (void *)v9;
  }
  return v8;
}

- (RAPQuestion)parentQuestion
{
  return (RAPQuestion *)objc_loadWeakRetained((id *)&self->_parentQuestion);
}

- (RAPReport)report
{
  return (RAPReport *)objc_loadWeakRetained((id *)&self->_report);
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (RAPDirectionsRecording)_alternateDirectionsRecording
{
  return self->__alternateDirectionsRecording;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__alternateDirectionsRecording, 0);
  objc_destroyWeak((id *)&self->_report);
  objc_destroyWeak((id *)&self->_parentQuestion);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end

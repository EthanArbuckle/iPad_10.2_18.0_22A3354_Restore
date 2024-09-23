@implementation _UINavigationBarTitleRenamer

+ (id)renameServer
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44___UINavigationBarTitleRenamer_renameServer__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (qword_1ECD7F828 != -1)
    dispatch_once(&qword_1ECD7F828, v3);
  return (id)_MergedGlobals_1188;
}

- (_UINavigationBarTitleRenamer)init
{
  _UINavigationBarTitleRenamer *v2;
  _UINavigationBarTitleRenamer *v3;
  uint64_t v4;
  NSMutableSet *trackedSessions;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UINavigationBarTitleRenamer;
  v2 = -[_UINavigationBarTitleRenamer init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_BYTE *)&v2->_flags &= ~1u;
    v4 = objc_opt_new();
    trackedSessions = v3->_trackedSessions;
    v3->_trackedSessions = (NSMutableSet *)v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_sceneWillDeactivateNotification_, CFSTR("UISceneWillDeactivateNotification"), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTitleRenamer;
  -[_UINavigationBarTitleRenamer dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; active sessions: %@>"), v5, self, self->_trackedSessions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)sceneWillDeactivateNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_UINavigationBarTitleRenamer trackedSessions](self, "trackedSessions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "existingRenamerContentView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "_window");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "windowScene");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 == v4)
            objc_msgSend(v11, "cancelSession");
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (void)startSession:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    -[_UINavigationBarTitleRenamer trackedSessions](self, "trackedSessions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarTitleRenamer trackedSessions](self, "trackedSessions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarTitleRenamer.m"), 84, CFSTR("Unable to start session. Session already in progress: %@"), v9);

    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    objc_msgSend(v14, "sessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTitleRenamer sessionWithIdentifier:](self, "sessionWithIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarTitleRenamer.m"), 90, CFSTR("Renamer is already tracking a session with this identifier."));

    }
  }
  -[_UINavigationBarTitleRenamer trackedSessions](self, "trackedSessions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v14);

  objc_msgSend(v14, "sessionDidStartInRenamer:", self);
}

- (void)endSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v4);
  objc_msgSend(v4, "sessionDidEnd");
  -[_UINavigationBarTitleRenamer trackedSessions](self, "trackedSessions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)sessionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[_UINavigationBarTitleRenamer trackedSessions](self, "trackedSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54___UINavigationBarTitleRenamer_sessionWithIdentifier___block_invoke;
  v10[3] = &unk_1E16DC6A8;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_filter:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_session:(id)a3 textFieldWillBeginRenamingWithTitle:(id)a4 selectedRange:(_NSRange *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v9);
  -[_UINavigationBarTitleRenamer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "titleRenamer:session:willBeginRenamingWithTitle:selectedRange:", self, v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_session:(id)a3 textFieldShouldEndRenamingWithTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v7);
  -[_UINavigationBarTitleRenamer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v8, "titleRenamer:session:shouldEndRenamingWithTitle:", self, v7, v6);

  return (char)self;
}

- (void)_sessionTextFieldDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v4);
  -[_UINavigationBarTitleRenamer delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleRenamer:session:didEndRenamingWithTitle:", self, v4, v5);

}

- (void)_sessionDidCancel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v4);
  -[_UINavigationBarTitleRenamer trackedSessions](self, "trackedSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[_UINavigationBarTitleRenamer delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleRenamer:didCancelSession:", self, v4);

}

- (void)_session:(id)a3 fileRenameDidFail:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v7);
  -[_UINavigationBarTitleRenamer delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleRenamer:session:fileRenameDidFail:", self, v7, v6);

}

- (void)_session:(id)a3 fileRenameDidEnd:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  __ASSERT_UNTRACKED_SESSION__(self, v7);
  -[_UINavigationBarTitleRenamer delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleRenamer:session:fileRenameDidEnd:", self, v7, v6);

}

- (_UINavigationBarTitleRenamerDelegate)delegate
{
  return (_UINavigationBarTitleRenamerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)trackedSessions
{
  return self->_trackedSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedSessions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

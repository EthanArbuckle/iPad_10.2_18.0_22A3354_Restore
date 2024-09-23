@implementation STGroupFetchedResultsController

- (STGroupFetchedResultsController)initWithContext:(id)a3 resultsRequests:(id)a4
{
  return -[STGroupFetchedResultsController initWithResultsRequests:cacheName:managedObjectContext:](self, "initWithResultsRequests:cacheName:managedObjectContext:", a4, 0, a3);
}

- (STGroupFetchedResultsController)initWithResultsRequests:(id)a3 cacheName:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  STGroupFetchedResultsController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  NSArray *resultsControllers;
  uint64_t v24;
  NSArray *resultsRequests;
  id v27;
  id obj;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v30 = a4;
  v29 = a5;
  v36.receiver = self;
  v36.super_class = (Class)STGroupFetchedResultsController;
  v9 = -[STGroupFetchedResultsController init](&v36, sel_init);
  if (v9)
  {
    v10 = (void *)objc_opt_new();
    v11 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v27 = v8;
    obj = v8;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v17 = objc_alloc(MEMORY[0x1E0C97B68]);
          objc_msgSend(v16, "fetchRequest");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v17, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v18, v29, 0, v30);

          objc_msgSend(v19, "setDelegate:", v9);
          v31 = 0;
          LOBYTE(v18) = objc_msgSend(v19, "performFetch:", &v31);
          v20 = v31;
          if ((v18 & 1) == 0)
          {
            +[STLog persistence](STLog, "persistence");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              -[STGroupFetchedResultsController initWithResultsRequests:cacheName:managedObjectContext:].cold.1((uint64_t)v20, v21);

            goto LABEL_14;
          }
          objc_msgSend(v10, "addObject:", v19);
          objc_msgSend(v11, "addObject:", v16);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_14:

    v22 = objc_msgSend(v10, "copy");
    resultsControllers = v9->_resultsControllers;
    v9->_resultsControllers = (NSArray *)v22;

    v24 = objc_msgSend(v11, "copy");
    resultsRequests = v9->_resultsRequests;
    v9->_resultsRequests = (NSArray *)v24;

    v9->_changeCounter = 0;
    v8 = v27;
  }

  return v9;
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  STGroupFetchedResultsController *v23;
  id v24;
  unint64_t v25;

  v10 = a3;
  v11 = a4;
  +[STLog persistence](STLog, "persistence");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[STGroupFetchedResultsController controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:].cold.1((uint64_t)v10, (uint64_t)v11, v12);

  -[STGroupFetchedResultsController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[STGroupFetchedResultsController resultsControllers](self, "resultsControllers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "indexOfObject:", v10);

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[STGroupFetchedResultsController resultsRequests](self, "resultsRequests");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "managedObjectContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __101__STGroupFetchedResultsController_controller_didChangeObject_atIndexPath_forChangeType_newIndexPath___block_invoke;
      v20[3] = &unk_1E9371640;
      v21 = v11;
      v22 = v13;
      v23 = self;
      v24 = v17;
      v25 = a6;
      v19 = v17;
      objc_msgSend(v18, "performBlock:", v20);

    }
  }

}

void __101__STGroupFetchedResultsController_controller_didChangeObject_atIndexPath_forChangeType_newIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "groupResultsController:didChangeResultsForRequest:objectID:changeType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v2, *(_QWORD *)(a1 + 64));

}

- (void)controllerWillChangeContent:(id)a3
{
  -[STGroupFetchedResultsController setChangeCounter:](self, "setChangeCounter:", -[STGroupFetchedResultsController changeCounter](self, "changeCounter", a3) + 1);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__evaluateCounter, self);
  -[STGroupFetchedResultsController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__evaluateCounter, self, 1.0);
}

- (void)controllerDidChangeContent:(id)a3
{
  -[STGroupFetchedResultsController setChangeCounter:](self, "setChangeCounter:", -[STGroupFetchedResultsController changeCounter](self, "changeCounter", a3) - 1);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__evaluateCounter, self);
  -[STGroupFetchedResultsController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__evaluateCounter, self, 1.0);
}

- (void)_evaluateCounter
{
  id v3;

  if (!-[STGroupFetchedResultsController changeCounter](self, "changeCounter"))
  {
    -[STGroupFetchedResultsController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "groupResultsControllerDidChangeContents:", self);

  }
}

- (STGroupFetchedResultsControllerDelegate)delegate
{
  return (STGroupFetchedResultsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSFetchedResultsController)resultsController
{
  return self->_resultsController;
}

- (void)setResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_resultsController, a3);
}

- (NSArray)resultsControllers
{
  return self->_resultsControllers;
}

- (void)setResultsControllers:(id)a3
{
  objc_storeStrong((id *)&self->_resultsControllers, a3);
}

- (NSArray)resultsRequests
{
  return self->_resultsRequests;
}

- (void)setResultsRequests:(id)a3
{
  objc_storeStrong((id *)&self->_resultsRequests, a3);
}

- (unint64_t)changeCounter
{
  return self->_changeCounter;
}

- (void)setChangeCounter:(unint64_t)a3
{
  self->_changeCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsRequests, 0);
  objc_storeStrong((id *)&self->_resultsControllers, 0);
  objc_storeStrong((id *)&self->_resultsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithResultsRequests:(uint64_t)a1 cacheName:(NSObject *)a2 managedObjectContext:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_ERROR, "Failed to perform inital results fetch: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)controller:(os_log_t)log didChangeObject:atIndexPath:forChangeType:newIndexPath:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1D22E7000, log, OS_LOG_TYPE_DEBUG, "Controller: %@ changed content: %@", (uint8_t *)&v3, 0x16u);
}

@end

@implementation PLManagedObjectContextDelegate

id __47__PLManagedObjectContextDelegate_fetchRecorder__block_invoke(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)managedObjectContext:(id)a3 didExecuteFetchRequest:(id)a4 withSQLString:(id)a5 bindVariables:(id)a6 rowCount:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[PLManagedObjectContextDelegate fetchRecorder](self, "fetchRecorder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "managedObjectContext:didExecuteFetchRequest:withSQLString:bindVariables:rowCount:", v15, v14, v13, v12, a7);

  -[PLManagedObjectContextDelegate photoKitFetchInstrumentation](self, "photoKitFetchInstrumentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "managedObjectContext:didExecuteFetchRequest:withSQLString:bindVariables:rowCount:", v15, v14, v13, v12, a7);

  -[PLManagedObjectContextDelegate photoKitStatsTracker](self, "photoKitStatsTracker");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "managedObjectContext:didExecuteFetchRequest:withSQLString:bindVariables:rowCount:", v15, v14, v13, v12, a7);

}

- (void)managedObjectContext:(id)a3 willExecuteFetchRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[PLManagedObjectContextDelegate fetchRecorder](self, "fetchRecorder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext:willExecuteFetchRequest:", v7, v6);

  -[PLManagedObjectContextDelegate photoKitFetchInstrumentation](self, "photoKitFetchInstrumentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext:willExecuteFetchRequest:", v7, v6);

  -[PLManagedObjectContextDelegate photoKitStatsTracker](self, "photoKitStatsTracker");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectContext:willExecuteFetchRequest:", v7, v6);

}

- (NSSQLiteDatabaseTraceDelegate)fetchRecorder
{
  PLResultWithUnfairLock();
  return (NSSQLiteDatabaseTraceDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

id __51__PLManagedObjectContextDelegate_setFetchRecorder___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)setFetchRecorder:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLRunWithUnfairLock();

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoKitStatsTracker);
  objc_destroyWeak((id *)&self->_photoKitFetchInstrumentation);
  objc_destroyWeak((id *)&self->_fetchRecorder);
}

- (void)setPhotoKitFetchInstrumentation:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLRunWithUnfairLock();

}

- (NSSQLiteDatabaseTraceDelegate)photoKitFetchInstrumentation
{
  PLResultWithUnfairLock();
  return (NSSQLiteDatabaseTraceDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setPhotoKitStatsTracker:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLRunWithUnfairLock();

}

- (NSSQLiteDatabaseTraceDelegate)photoKitStatsTracker
{
  PLResultWithUnfairLock();
  return (NSSQLiteDatabaseTraceDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

id __54__PLManagedObjectContextDelegate_photoKitStatsTracker__block_invoke(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
}

id __58__PLManagedObjectContextDelegate_setPhotoKitStatsTracker___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

id __62__PLManagedObjectContextDelegate_photoKitFetchInstrumentation__block_invoke(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
}

id __66__PLManagedObjectContextDelegate_setPhotoKitFetchInstrumentation___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

@end

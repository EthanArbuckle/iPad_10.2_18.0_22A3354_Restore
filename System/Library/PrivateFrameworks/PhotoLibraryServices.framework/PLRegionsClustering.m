@implementation PLRegionsClustering

+ (id)performClustering:(unint64_t)a3 dataset:(id)a4 progressBlock:(id)a5
{
  id v9;
  id v10;
  PLRegionsDensityClustering *v11;
  PLRegionsDensityClustering *v12;
  uint64_t v13;
  __objc2_class *v14;
  void *v15;
  void *v16;
  objc_class *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  switch(a3)
  {
    case 0uLL:
      v11 = objc_alloc_init(PLRegionsDensityClustering);
      v12 = v11;
      v13 = 0;
      goto LABEL_5;
    case 1uLL:
      v12 = objc_alloc_init(PLRegionsDensityClustering);
      -[PLRegionsDensityClustering setAlgorithm:](v12, "setAlgorithm:", 0);
      -[PLRegionsDensityClustering setRemoveExtensiveClustersContainingDefiniteClusters:](v12, "setRemoveExtensiveClustersContainingDefiniteClusters:", 0);
      goto LABEL_9;
    case 2uLL:
      v11 = objc_alloc_init(PLRegionsDensityClustering);
      v12 = v11;
      v13 = 1;
LABEL_5:
      -[PLRegionsDensityClustering setAlgorithm:](v11, "setAlgorithm:", v13);
      goto LABEL_9;
    case 3uLL:
      v14 = PLRegionsHierarchicalClustering;
      goto LABEL_8;
    case 4uLL:
      v14 = PLRegionsAgglomerativeClustering;
LABEL_8:
      v12 = (PLRegionsDensityClustering *)objc_alloc_init(v14);
LABEL_9:
      if (!v12)
        goto LABEL_12;
      if (v9)
        goto LABEL_11;
      goto LABEL_13;
    default:
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLRegionsClustering.m"), 67, CFSTR("No clustering initialized for algorithm %lu"), a3);

      v12 = 0;
      if (v9)
      {
LABEL_11:
        -[PLRegionsDensityClustering performWithDataset:progressBlock:](v12, "performWithDataset:progressBlock:", v9, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_13:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v22 = v19;
          v23 = 2112;
          v24 = v20;
          _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ %@ Cannot be called with a nil dataset", buf, 0x16u);

        }
        v15 = 0;
      }

      return v15;
  }
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLRegionsClustering.m"), 86, CFSTR("%s needs to be implemented by subclasses"), "-[PLRegionsClustering performWithDataset:progressBlock:]");

  return (id)MEMORY[0x1E0C9AA70];
}

@end

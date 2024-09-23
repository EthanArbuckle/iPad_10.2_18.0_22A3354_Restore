@implementation PXSystemAVAudioSessionController

- (PXSystemAVAudioSessionController)initWithName:(id)a3 audioSession:(id)a4
{
  id v6;
  id v7;
  PXSystemAVAudioSessionController *v8;
  NSObject *v9;
  uint64_t v10;
  NSString *name;
  PXSystemAVResourceReclamationController *v12;
  PXSystemAVResourceReclamationController *reclamationController;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXSystemAVAudioSessionController;
  v8 = -[PXSystemAVAudioSessionController init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v9 = objc_claimAutoreleasedReturnValue();
    v8->_signpostID = os_signpost_id_generate(v9);

    v8->_category = objc_msgSend(v7, "photosAudioSessionCategory");
    v8->_categoryLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_audioSession, a4);
    v10 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v10;

    v12 = objc_alloc_init(PXSystemAVResourceReclamationController);
    reclamationController = v8->_reclamationController;
    v8->_reclamationController = v12;

    -[PXConcreteAVResourceReclamationController registerObserver:](v8->_reclamationController, "registerObserver:", v8);
  }

  return v8;
}

- (PXSystemAVAudioSessionController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSystemAVAudioSessionController.m"), 75, CFSTR("%s is not available as initializer"), "-[PXSystemAVAudioSessionController init]");

  abort();
}

- (int64_t)currentCategory
{
  os_unfair_lock_s *p_categoryLock;
  int64_t category;

  p_categoryLock = &self->_categoryLock;
  os_unfair_lock_lock(&self->_categoryLock);
  category = self->_category;
  os_unfair_lock_unlock(p_categoryLock);
  return category;
}

- (void)setCurrentCategory:(int64_t)a3
{
  os_unfair_lock_s *p_categoryLock;

  p_categoryLock = &self->_categoryLock;
  os_unfair_lock_lock(&self->_categoryLock);
  self->_category = a3;
  os_unfair_lock_unlock(p_categoryLock);
}

- (void)applyCategory:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14[2];
  id location;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3)
  {
    objc_initWeak(&location, self);
    objc_msgSend((id)objc_opt_class(), "audioSessionQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__PXSystemAVAudioSessionController_applyCategory_completion___block_invoke;
    block[3] = &unk_2514A2F00;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a3;
    v13 = v6;
    dispatch_async(v7, block);

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v16 = CFSTR("PXAVAudioSessionControllerErrorCategory");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PXAVAudioSessionControllerError"), 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v11);

  }
}

- (void)resourceReclamationEventDidOccur:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "audioSessionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__PXSystemAVAudioSessionController_resourceReclamationEventDidOccur___block_invoke;
  v6[3] = &unk_2514A2F28;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)_audioSessionQueue_applyCategory:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, void *);
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  unint64_t v12;
  __CFString *v13;
  unint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  id v18;
  __CFString *v19;
  NSObject *v20;
  unint64_t v21;
  os_signpost_id_t v22;
  uint64_t v23;
  NSObject *v24;
  unint64_t v25;
  os_signpost_id_t v26;
  NSObject *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  id v37;
  const __CFString *v38;
  void *v39;
  uint8_t buf[4];
  PXSystemAVAudioSessionController *v41;
  __int16 v42;
  PXSystemAVAudioSessionController *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, void *))a4;
  objc_msgSend((id)objc_opt_class(), "audioSessionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[PXSystemAVAudioSessionController audioSession](self, "audioSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "photosAudioSessionCategory");
  objc_msgSend((id)objc_opt_class(), "log");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9 == a3)
  {
    if (v11)
    {
      v12 = -[PXSystemAVAudioSessionController currentCategory](self, "currentCategory");
      if (v12 > 2)
        v13 = CFSTR("??");
      else
        v13 = off_2514A2DD0[v12];
      v16 = v13;
      *(_DWORD *)buf = 138412802;
      v41 = self;
      v42 = 2112;
      v43 = (PXSystemAVAudioSessionController *)v16;
      v44 = 2112;
      v45 = v8;
      _os_log_impl(&dword_244081000, v10, OS_LOG_TYPE_INFO, "%@ declining to apply existing category %@ to session %@.", buf, 0x20u);

    }
    v17 = 0;
    v18 = 0;
    goto LABEL_32;
  }
  if (v11)
  {
    v14 = -[PXSystemAVAudioSessionController currentCategory](self, "currentCategory");
    if (v14 > 2)
      v15 = CFSTR("??");
    else
      v15 = off_2514A2DD0[v14];
    v19 = v15;
    *(_DWORD *)buf = 138412802;
    v41 = self;
    v42 = 2112;
    v43 = (PXSystemAVAudioSessionController *)v19;
    v44 = 2112;
    v45 = v8;
    _os_log_impl(&dword_244081000, v10, OS_LOG_TYPE_INFO, "%@ applying category %@ to session %@.", buf, 0x20u);

  }
  objc_msgSend((id)objc_opt_class(), "log");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = -[PXSystemAVAudioSessionController signpostID](self, "signpostID");
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_244081000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "SetAudioSessionCategory", ", buf, 2u);
    }
  }

  v37 = 0;
  v23 = objc_msgSend(v8, "setPhotosAudioSessionCategory:error:", a3, &v37);
  v18 = v37;
  objc_msgSend((id)objc_opt_class(), "log");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = -[PXSystemAVAudioSessionController signpostID](self, "signpostID");
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v26 = v25;
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_244081000, v24, OS_SIGNPOST_INTERVAL_END, v26, "SetAudioSessionCategory", ", buf, 2u);
    }
  }

  if ((_DWORD)v23)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)a3 > 2)
        v28 = CFSTR("??");
      else
        v28 = off_2514A2DD0[a3];
      v34 = v28;
      *(_DWORD *)buf = 138412546;
      v41 = (PXSystemAVAudioSessionController *)v34;
      v42 = 2112;
      v43 = self;
      _os_log_impl(&dword_244081000, v27, OS_LOG_TYPE_INFO, "Successfully configured audio session category %@ for session controller %@", buf, 0x16u);

    }
    -[PXSystemAVAudioSessionController setCurrentCategory:](self, "setCurrentCategory:", a3);
    v17 = 0;
    if (v6)
LABEL_31:
      v6[2](v6, v23, v17);
  }
  else
  {
    v38 = CFSTR("PXAVAudioSessionControllerErrorCategory");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v31 = (void *)objc_msgSend(v30, "mutableCopy");
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BDD1398]);
      v32 = objc_msgSend(v31, "copy");

      v30 = (void *)v32;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PXAVAudioSessionControllerError"), 2, v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "log");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      if ((unint64_t)a3 > 2)
        v35 = CFSTR("??");
      else
        v35 = off_2514A2DD0[a3];
      v36 = v35;
      *(_DWORD *)buf = 138412802;
      v41 = (PXSystemAVAudioSessionController *)v36;
      v42 = 2112;
      v43 = self;
      v44 = 2112;
      v45 = v17;
      _os_log_error_impl(&dword_244081000, v33, OS_LOG_TYPE_ERROR, "Failed to configure audio session category %@ for session controller %@. Error: %@", buf, 0x20u);

    }
    if (v6)
      goto LABEL_31;
  }
LABEL_32:

}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSystemAVAudioSessionController name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p: %@>"), v5, self, v6);

  return v7;
}

- (void)_audioSessionQueue_applyExistingCategoryToAudioSessionIfNeeded
{
  NSObject *v3;
  int64_t v4;

  objc_msgSend((id)objc_opt_class(), "audioSessionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[PXSystemAVAudioSessionController currentCategory](self, "currentCategory");
  if (v4)
    -[PXSystemAVAudioSessionController _audioSessionQueue_applyCategory:completion:](self, "_audioSessionQueue_applyCategory:completion:", v4, 0);
}

- (NSString)name
{
  return self->_name;
}

- (PXAVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)_audioSessionQueue_setAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_audioSession, a3);
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_reclamationController, 0);
}

void __69__PXSystemAVAudioSessionController_resourceReclamationEventDidOccur___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_audioSessionQueue_applyExistingCategoryToAudioSessionIfNeeded");

}

void __61__PXSystemAVAudioSessionController_applyCategory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_audioSessionQueue_applyCategory:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

+ (PXSystemAVAudioSessionController)applicationAVAudioSessionController
{
  if (applicationAVAudioSessionController_onceToken != -1)
    dispatch_once(&applicationAVAudioSessionController_onceToken, &__block_literal_global);
  return (PXSystemAVAudioSessionController *)(id)applicationAVAudioSessionController_controller;
}

+ (OS_dispatch_queue)audioSessionQueue
{
  if (audioSessionQueue_onceToken != -1)
    dispatch_once(&audioSessionQueue_onceToken, &__block_literal_global_2);
  return (OS_dispatch_queue *)(id)audioSessionQueue_queue;
}

+ (OS_os_log)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_4);
  return (OS_os_log *)(id)log_log;
}

void __39__PXSystemAVAudioSessionController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("PhotosMediaFoundation", "PXSystemAVAudioSessionController");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

void __53__PXSystemAVAudioSessionController_audioSessionQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, -15);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("PXSystemAVAudioSessionController", attr);
  v2 = (void *)audioSessionQueue_queue;
  audioSessionQueue_queue = (uint64_t)v1;

}

void __71__PXSystemAVAudioSessionController_applicationAVAudioSessionController__block_invoke()
{
  PXSystemAVAudioSessionController *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PXSystemAVAudioSessionController alloc];
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PXSystemAVAudioSessionController initWithName:audioSession:](v0, "initWithName:audioSession:", CFSTR("Application Audio Session"), v3);
  v2 = (void *)applicationAVAudioSessionController_controller;
  applicationAVAudioSessionController_controller = v1;

}

@end

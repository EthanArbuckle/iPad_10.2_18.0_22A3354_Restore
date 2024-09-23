@implementation WFDebouncer

void __32__WFDebouncer_addTarget_action___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 72);
  else
    v3 = 0;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(void **)(v6 + 72);
    else
      v7 = 0;
    objc_msgSend(v7, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));
    v4 = v5;
  }
  v9 = (id)v4;
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

}

- (WFDebouncer)initWithDelay:(double)a3 maximumDelay:(double)a4 queue:(id)a5
{
  return -[WFDebouncer initWithDelay:maximumDelay:queue:userInfo:unboundedFiringReasons:](self, "initWithDelay:maximumDelay:queue:userInfo:unboundedFiringReasons:", a5, 0, 0, a3, a4);
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  id v7;
  NSObject *queue;
  id v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  id v13;
  SEL v14;

  v7 = a3;
  if (v7)
  {
    if (a4)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDebouncer.mm"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

    if (self)
      goto LABEL_4;
LABEL_8:
    queue = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDebouncer.mm"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target"));

  if (!a4)
    goto LABEL_7;
LABEL_3:
  if (!self)
    goto LABEL_8;
LABEL_4:
  queue = self->_queue;
LABEL_5:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__WFDebouncer_addTarget_action___block_invoke;
  block[3] = &unk_1E7AF5538;
  block[4] = self;
  v13 = v7;
  v14 = a4;
  v9 = v7;
  dispatch_async(queue, block);

}

- (WFDebouncer)initWithDelay:(double)a3 queue:(id)a4
{
  return -[WFDebouncer initWithDelay:maximumDelay:queue:](self, "initWithDelay:maximumDelay:queue:", a4, a3, 0.0);
}

- (WFDebouncer)initWithDelay:(double)a3 maximumDelay:(double)a4 queue:(id)a5 userInfo:(id)a6 unboundedFiringReasons:(BOOL)a7
{
  id v12;
  id v13;
  WFDebouncer *v14;
  WFDebouncer *v15;
  WFDebouncer *v16;
  OS_dispatch_queue *v17;
  NSObject *queue;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *v21;
  uint64_t v22;
  NSMapTable *targetTable;
  WFDebouncer *v24;
  objc_super v26;

  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)WFDebouncer;
  v14 = -[WFDebouncer init](&v26, sel_init);
  v15 = v14;
  v16 = v14;
  if (v14)
  {
    v14->_delay = a3;
    v14->_maximumDelay = a4;
    if (v12)
    {
      v17 = (OS_dispatch_queue *)v12;
      queue = v16->_queue;
      v16->_queue = v17;
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      queue = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(queue, QOS_CLASS_UTILITY, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = dispatch_queue_create("com.apple.shortcuts.WFDebouncer", v19);
      v21 = v16->_queue;
      v16->_queue = (OS_dispatch_queue *)v20;

    }
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v22 = objc_claimAutoreleasedReturnValue();
    targetTable = v16->_targetTable;
    v16->_targetTable = (NSMapTable *)v22;

    objc_storeStrong(&v15->_userInfo, a6);
    v16->_unboundedFiringReasons = a7;
    v24 = v16;
  }

  return v16;
}

- (void)dealloc
{
  void *firingReasonsQueue;
  uint64_t v4;
  objc_super v5;

  if (self)
  {
    firingReasonsQueue = self->_firingReasonsQueue;
    if (firingReasonsQueue)
    {
      v4 = std::deque<WFDebouncerPokeReason * {__strong}>::~deque[abi:ne180100]((uint64_t)firingReasonsQueue);
      MEMORY[0x1C3BB2D88](v4, 0x1080C40BE8D5F09);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)WFDebouncer;
  -[WFDebouncer dealloc](&v5, sel_dealloc);
}

- (void)poke
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__WFDebouncer_poke__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)pokeWithReason:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  WFDebouncerPokeReason *v9;
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  WFDebouncerPokeReason *v14;
  _QWORD v15[5];
  WFDebouncerPokeReason *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = [WFDebouncerPokeReason alloc];
  v10 = v7;
  v11 = v8;
  if (v9)
  {
    v17.receiver = v9;
    v17.super_class = (Class)WFDebouncerPokeReason;
    v12 = -[WFDebouncer init](&v17, sel_init);
    v9 = (WFDebouncerPokeReason *)v12;
    if (v12)
    {
      objc_storeStrong((id *)v12 + 1, a3);
      objc_storeStrong(&v9->_userInfo, a4);
    }
  }

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__WFDebouncer_pokeWithReason_userInfo___block_invoke;
  v15[3] = &unk_1E7AF92C0;
  v15[4] = self;
  v16 = v9;
  v14 = v9;
  dispatch_async(queue, v15);

}

- (void)fire
{
  NSObject *maximumDelayTimer;
  OS_dispatch_source *v4;
  _QWORD *firingReasonsQueue;
  void *v6;
  NSArray *v7;
  NSArray *firingReasons;
  uint64_t v9;
  NSMapTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMapTable *targetTable;
  NSMapTable *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[WFDebouncer setPendingFire:]((uint64_t)self, 0);
  -[WFDebouncer resetDelayTimer]((uint64_t)self);
  if (self)
  {
    maximumDelayTimer = self->_maximumDelayTimer;
    if (maximumDelayTimer)
    {
      dispatch_source_cancel(maximumDelayTimer);
      v4 = self->_maximumDelayTimer;
    }
    else
    {
      v4 = 0;
    }
    self->_maximumDelayTimer = 0;

    firingReasonsQueue = self->_firingReasonsQueue;
    if (firingReasonsQueue)
    {
      if (firingReasonsQueue[5])
      {
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", firingReasonsQueue[5]);
        while (firingReasonsQueue[5])
        {
          objc_msgSend(v6, "addObject:", *(_QWORD *)(*(_QWORD *)(firingReasonsQueue[1] + ((firingReasonsQueue[4] >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * (firingReasonsQueue[4] & 0x1FFLL)));
          std::deque<WFDebouncerPokeReason * {__strong}>::pop_front((uint64_t)firingReasonsQueue);
        }
        v7 = (NSArray *)objc_msgSend(v6, "copy");
        firingReasons = self->_firingReasons;
        self->_firingReasons = v7;

      }
      v9 = std::deque<WFDebouncerPokeReason * {__strong}>::~deque[abi:ne180100]((uint64_t)firingReasonsQueue);
      MEMORY[0x1C3BB2D88](v9, 0x1080C40BE8D5F09);
    }
  }
  self->_firingReasonsQueue = 0;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = self->_targetTable;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        if (self)
          targetTable = self->_targetTable;
        else
          targetTable = 0;
        v16 = targetTable;
        -[NSMapTable objectForKey:](v16, "objectForKey:", v14, (_QWORD)v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v24;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v24 != v19)
                objc_enumerationMutation(v17);
              objc_msgSend(v14, "performSelector:withObject:", NSSelectorFromString(*(NSString **)(*((_QWORD *)&v23 + 1) + 8 * v20++)), self);
            }
            while (v18 != v20);
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v18);
        }

        ++v13;
      }
      while (v13 != v11);
      v21 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      v11 = v21;
    }
    while (v21);
  }

  v22 = self->_firingReasons;
  self->_firingReasons = 0;

}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;

  v6 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WFDebouncer_removeTarget_action___block_invoke;
  block[3] = &unk_1E7AF5538;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (NSArray)firingReasons
{
  return self->_firingReasons;
}

- (double)delay
{
  return self->_delay;
}

- (double)maximumDelay
{
  return self->_maximumDelay;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (BOOL)unboundedFiringReasons
{
  return self->_unboundedFiringReasons;
}

- (BOOL)isPendingFire
{
  return self->_pendingFire;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumDelayTimer, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_targetTable, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_firingReasons, 0);
}

void __35__WFDebouncer_removeTarget_action___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 48))
  {
    if (v2)
      v3 = *(void **)(v2 + 72);
    else
      v3 = 0;
    objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v4);

  }
  else
  {
    if (v2)
      v5 = *(void **)(v2 + 72);
    else
      v5 = 0;
    objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
}

- (void)setPendingFire:(uint64_t)a1
{
  char v2;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    v2 = a2;
    if (*(unsigned __int8 *)(a1 + 9) == a2)
    {
      if (a2)
        os_transaction_needs_more_time();
      return;
    }
    v4 = *(void **)(a1 + 64);
    if (a2)
    {
      if (!v4)
      {
        v5 = os_transaction_create();
        v4 = *(void **)(a1 + 64);
LABEL_10:
        *(_QWORD *)(a1 + 64) = v5;

      }
    }
    else if (v4)
    {
      v5 = 0;
      goto LABEL_10;
    }
    *(_BYTE *)(a1 + 9) = v2;
  }
}

- (void)resetDelayTimer
{
  NSObject *v2;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 80);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v2 = *(NSObject **)(a1 + 80);
    }
    *(_QWORD *)(a1 + 80) = 0;

  }
}

uint64_t __39__WFDebouncer_pokeWithReason_userInfo___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  int64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  int64_t v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  __int128 v48;
  void *v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t i;
  _QWORD *v76;
  char *v77;
  _BYTE *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  unint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  unint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  char *v114;
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  int64_t v125;
  unint64_t v126;
  char *v127;
  uint64_t v128;
  char *v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  char *v135;
  unint64_t v136;
  _QWORD *v137;
  __int128 v139;
  __int128 v140;
  uint64_t v141;
  __int128 v142;
  uint64_t v143;
  __int128 v144;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[2])
  {
    v5 = (_OWORD *)operator new();
    *v5 = 0u;
    v5[1] = 0u;
    v5[2] = 0u;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v5;
LABEL_7:
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(_QWORD **)(v6 + 16);
    else
      v7 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v2, "unboundedFiringReasons") & 1) != 0)
    goto LABEL_7;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 16);
    if (*(_QWORD *)(v4 + 40) != 10)
      goto LABEL_7;
    goto LABEL_5;
  }
  v4 = 0;
  v7 = 0;
  if (MEMORY[0x28] == 10)
  {
LABEL_5:
    std::deque<WFDebouncerPokeReason * {__strong}>::pop_front(v4);
    goto LABEL_7;
  }
LABEL_9:
  v8 = (char *)v7[1];
  v9 = (char *)v7[2];
  v10 = v9 - v8;
  if (v9 == v8)
    v11 = 0;
  else
    v11 = ((v9 - v8) << 6) - 1;
  v12 = v7[4];
  if (v11 == v7[5] + v12)
  {
    v13 = v12 >= 0x200;
    v14 = v12 - 512;
    if (v13)
    {
      v7[4] = v14;
      v17 = *(_QWORD *)v8;
      v15 = v8 + 8;
      v16 = v17;
      v7[1] = v15;
      if (v9 == (char *)v7[3])
      {
        v18 = (uint64_t)&v15[-*v7];
        if ((unint64_t)v15 <= *v7)
        {
          if (v9 == (char *)*v7)
            v55 = 1;
          else
            v55 = (uint64_t)&v9[-*v7] >> 2;
          v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v55);
          v58 = &v56[8 * (v55 >> 2)];
          v59 = (uint64_t *)v7[1];
          v9 = v58;
          v60 = v7[2] - (_QWORD)v59;
          if (v60)
          {
            v9 = &v58[v60 & 0xFFFFFFFFFFFFFFF8];
            v61 = 8 * (v60 >> 3);
            v62 = &v56[8 * (v55 >> 2)];
            do
            {
              v63 = *v59++;
              *(_QWORD *)v62 = v63;
              v62 += 8;
              v61 -= 8;
            }
            while (v61);
          }
          v64 = (char *)*v7;
          *v7 = v56;
          v7[1] = v58;
          v7[2] = v9;
          v7[3] = &v56[8 * v57];
          if (v64)
          {
            operator delete(v64);
            v9 = (char *)v7[2];
          }
        }
        else
        {
          v19 = v18 >> 3;
          v20 = v18 >> 3 < -1;
          v21 = (v18 >> 3) + 2;
          if (v20)
            v22 = v21;
          else
            v22 = v19 + 1;
          v23 = -(v22 >> 1);
          v24 = v22 >> 1;
          v25 = &v15[-8 * v24];
          v26 = v9 - v15;
          if (v9 != v15)
          {
            memmove(&v15[-8 * v24], v15, v9 - v15);
            v9 = (char *)v7[1];
          }
          v27 = &v9[8 * v23];
          v9 = &v25[v26];
          v7[1] = v27;
          v7[2] = &v25[v26];
        }
      }
      *(_QWORD *)v9 = v16;
      goto LABEL_123;
    }
    v28 = v10 >> 3;
    v29 = (char *)v7[3];
    v30 = (char *)*v7;
    v31 = (uint64_t)&v29[-*v7];
    if (v10 >> 3 < (unint64_t)(v31 >> 3))
    {
      v32 = operator new(0x1000uLL);
      if (v29 == v9)
      {
        v65 = (char *)v7[1];
        if (v65 == v30)
        {
          v66 = (char *)v7[2];
          v67 = (char *)v7[3];
          if (v66 >= v67)
          {
            if (v67 == v30)
              v104 = 1;
            else
              v104 = (v67 - v30) >> 2;
            v105 = 2 * v104;
            v106 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v104);
            v65 = &v106[(v105 + 6) & 0xFFFFFFFFFFFFFFF8];
            v108 = (uint64_t *)v7[1];
            v109 = v65;
            v110 = v7[2] - (_QWORD)v108;
            if (v110)
            {
              v109 = &v65[v110 & 0xFFFFFFFFFFFFFFF8];
              v111 = 8 * (v110 >> 3);
              v112 = v65;
              do
              {
                v113 = *v108++;
                *(_QWORD *)v112 = v113;
                v112 += 8;
                v111 -= 8;
              }
              while (v111);
            }
            v114 = (char *)*v7;
            *v7 = v106;
            v7[1] = v65;
            v7[2] = v109;
            v7[3] = &v106[8 * v107];
            if (v114)
            {
              operator delete(v114);
              v65 = (char *)v7[1];
            }
          }
          else
          {
            v68 = (v67 - v66) >> 3;
            if (v68 >= -1)
              v69 = v68 + 1;
            else
              v69 = v68 + 2;
            v70 = v69 >> 1;
            v65 = &v30[8 * (v69 >> 1)];
            if (v66 != v30)
            {
              memmove(&v30[8 * (v69 >> 1)], v30, v66 - v30);
              v30 = (char *)v7[2];
            }
            v7[1] = v65;
            v7[2] = &v30[8 * v70];
          }
        }
        *((_QWORD *)v65 - 1) = v32;
        v115 = (char *)v7[1];
        v116 = (char *)v7[2];
        v7[1] = v115 - 8;
        v117 = *((_QWORD *)v115 - 1);
        v7[1] = v115;
        if (v116 == (char *)v7[3])
        {
          v118 = (uint64_t)&v115[-*v7];
          if ((unint64_t)v115 <= *v7)
          {
            if (v116 == (char *)*v7)
              v126 = 1;
            else
              v126 = (uint64_t)&v116[-*v7] >> 2;
            v127 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v126);
            v129 = &v127[8 * (v126 >> 2)];
            v130 = (uint64_t *)v7[1];
            v116 = v129;
            v131 = v7[2] - (_QWORD)v130;
            if (v131)
            {
              v116 = &v129[v131 & 0xFFFFFFFFFFFFFFF8];
              v132 = 8 * (v131 >> 3);
              v133 = &v127[8 * (v126 >> 2)];
              do
              {
                v134 = *v130++;
                *(_QWORD *)v133 = v134;
                v133 += 8;
                v132 -= 8;
              }
              while (v132);
            }
            v135 = (char *)*v7;
            *v7 = v127;
            v7[1] = v129;
            v7[2] = v116;
            v7[3] = &v127[8 * v128];
            if (v135)
            {
              operator delete(v135);
              v116 = (char *)v7[2];
            }
          }
          else
          {
            v119 = v118 >> 3;
            v20 = v118 >> 3 < -1;
            v120 = (v118 >> 3) + 2;
            if (v20)
              v121 = v120;
            else
              v121 = v119 + 1;
            v122 = -(v121 >> 1);
            v123 = v121 >> 1;
            v124 = &v115[-8 * v123];
            v125 = v116 - v115;
            if (v116 != v115)
            {
              memmove(&v115[-8 * v123], v115, v116 - v115);
              v115 = (char *)v7[1];
            }
            v116 = &v124[v125];
            v7[1] = &v115[8 * v122];
            v7[2] = &v124[v125];
          }
        }
        *(_QWORD *)v116 = v117;
      }
      else
      {
        v33 = (char *)v7[2];
        if (v33 == (char *)v7[3])
        {
          v34 = (char *)v7[1];
          if (v34 <= v30)
          {
            if (v33 == v30)
              v94 = 1;
            else
              v94 = (v33 - v30) >> 2;
            v95 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v94);
            v97 = &v95[8 * (v94 >> 2)];
            v98 = (uint64_t *)v7[1];
            v33 = v97;
            v99 = v7[2] - (_QWORD)v98;
            if (v99)
            {
              v33 = &v97[v99 & 0xFFFFFFFFFFFFFFF8];
              v100 = 8 * (v99 >> 3);
              v101 = &v95[8 * (v94 >> 2)];
              do
              {
                v102 = *v98++;
                *(_QWORD *)v101 = v102;
                v101 += 8;
                v100 -= 8;
              }
              while (v100);
            }
            v103 = (char *)*v7;
            *v7 = v95;
            v7[1] = v97;
            v7[2] = v33;
            v7[3] = &v95[8 * v96];
            if (v103)
            {
              operator delete(v103);
              v33 = (char *)v7[2];
            }
          }
          else
          {
            v35 = (v34 - v30) >> 3;
            if (v35 >= -1)
              v36 = v35 + 1;
            else
              v36 = v35 + 2;
            v37 = -(v36 >> 1);
            v38 = v36 >> 1;
            v39 = &v34[-8 * v38];
            v40 = v33 - v34;
            if (v33 != v34)
            {
              memmove(&v34[-8 * v38], v34, v33 - v34);
              v33 = (char *)v7[1];
            }
            v41 = &v33[8 * v37];
            v33 = &v39[v40];
            v7[1] = v41;
            v7[2] = &v39[v40];
          }
        }
        *(_QWORD *)v33 = v32;
      }
LABEL_123:
      v9 = (char *)(v7[2] + 8);
      v7[2] = v9;
LABEL_124:
      v8 = (char *)v7[1];
      goto LABEL_125;
    }
    v42 = v31 >> 2;
    if (v29 == v30)
      v43 = 1;
    else
      v43 = v42;
    v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v43);
    v46 = v45;
    v47 = &v44[8 * v28];
    *(_QWORD *)&v48 = v44;
    *((_QWORD *)&v48 + 1) = v47;
    v142 = v48;
    v49 = operator new(0x1000uLL);
    *(_QWORD *)&v50 = v47;
    *((_QWORD *)&v50 + 1) = &v44[8 * v46];
    if (v28 == v46)
    {
      v51 = 8 * v28;
      *(_QWORD *)&v52 = v142;
      if (v10 >= 1)
      {
        v53 = v51 >> 3;
        if (v53 >= -1)
          v54 = v53 + 1;
        else
          v54 = v53 + 2;
        v47 -= 8 * (v54 >> 1);
        *(_QWORD *)&v50 = v47;
        *((_QWORD *)&v52 + 1) = v47;
        goto LABEL_65;
      }
      v71 = v51 >> 2;
      if (v9 == v8)
        v72 = 1;
      else
        v72 = v71;
      v73 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v72);
      v47 = &v73[8 * (v72 >> 2)];
      *(_QWORD *)&v52 = v73;
      *((_QWORD *)&v52 + 1) = v47;
      *(_QWORD *)&v50 = v47;
      *((_QWORD *)&v50 + 1) = &v73[8 * v74];
      if (!v44)
      {
LABEL_65:
        *(_QWORD *)v47 = v49;
        *(_QWORD *)&v50 = v50 + 8;
        for (i = v7[2]; i != v7[1]; i -= 8)
        {
          v76 = (_QWORD *)*((_QWORD *)&v52 + 1);
          if (*((_QWORD *)&v52 + 1) == (_QWORD)v52)
          {
            v78 = (_BYTE *)v50;
            if ((unint64_t)v50 >= *((_QWORD *)&v50 + 1))
            {
              if (*((_QWORD *)&v50 + 1) == *((_QWORD *)&v52 + 1))
                v83 = 1;
              else
                v83 = (uint64_t)(*((_QWORD *)&v50 + 1) - *((_QWORD *)&v52 + 1)) >> 2;
              v84 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v83);
              v77 = &v84[(2 * v83 + 6) & 0xFFFFFFFFFFFFFFF8];
              v86 = v77;
              v87 = v78 - (_BYTE *)v76;
              if (v78 != (_BYTE *)v76)
              {
                v86 = &v77[v87 & 0xFFFFFFFFFFFFFFF8];
                v88 = 8 * (v87 >> 3);
                v89 = v77;
                v90 = v76;
                do
                {
                  v91 = *v90++;
                  *(_QWORD *)v89 = v91;
                  v89 += 8;
                  v88 -= 8;
                }
                while (v88);
              }
              *(_QWORD *)&v52 = v84;
              *((_QWORD *)&v52 + 1) = v77;
              *(_QWORD *)&v50 = v86;
              *((_QWORD *)&v50 + 1) = &v84[8 * v85];
              if (v76)
              {
                v140 = v50;
                v144 = v52;
                operator delete(v76);
                v50 = v140;
                v52 = v144;
              }
            }
            else
            {
              v79 = (uint64_t)(*((_QWORD *)&v50 + 1) - v50) >> 3;
              if (v79 >= -1)
                v80 = v79 + 1;
              else
                v80 = v79 + 2;
              v81 = v80 >> 1;
              v82 = v50 + 8 * (v80 >> 1);
              v77 = (char *)(v82 - (v50 - *((_QWORD *)&v52 + 1)));
              if ((_QWORD)v50 == *((_QWORD *)&v52 + 1))
              {
                v78 = (_BYTE *)*((_QWORD *)&v52 + 1);
              }
              else
              {
                v141 = *((_QWORD *)&v50 + 1);
                v143 = v52;
                memmove((void *)(v82 - (v50 - *((_QWORD *)&v52 + 1))), *((const void **)&v52 + 1), v50 - *((_QWORD *)&v52 + 1));
                *((_QWORD *)&v50 + 1) = v141;
                *(_QWORD *)&v52 = v143;
              }
              *((_QWORD *)&v52 + 1) = v77;
              *(_QWORD *)&v50 = &v78[8 * v81];
            }
          }
          else
          {
            v77 = (char *)*((_QWORD *)&v52 + 1);
          }
          v92 = *(_QWORD *)(i - 8);
          *((_QWORD *)v77 - 1) = v92;
          *((_QWORD *)&v52 + 1) -= 8;
        }
        v93 = (char *)*v7;
        *(_OWORD *)v7 = v52;
        *((_OWORD *)v7 + 1) = v50;
        if (v93)
        {
          operator delete(v93);
          v9 = (char *)v7[2];
        }
        else
        {
          v9 = (char *)v50;
        }
        goto LABEL_124;
      }
      v139 = v50;
      v142 = v52;
      operator delete(v44);
      v50 = v139;
    }
    v52 = v142;
    goto LABEL_65;
  }
LABEL_125:
  if (v9 == v8)
  {
    v137 = 0;
  }
  else
  {
    v136 = v7[5] + v7[4];
    v137 = (_QWORD *)(*(_QWORD *)&v8[(v136 >> 6) & 0x3FFFFFFFFFFFFF8] + 8 * (v136 & 0x1FF));
  }
  *v137 = *(id *)(a1 + 40);
  ++v7[5];
  return objc_msgSend(*(id *)(a1 + 32), "poke");
}

void __19__WFDebouncer_poke__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  double v4;
  dispatch_time_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  double v11;
  NSObject *v12;
  double v13;
  dispatch_time_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  -[WFDebouncer setPendingFire:](*(_QWORD *)(a1 + 32), 1);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    -[WFDebouncer resetDelayTimer](*(_QWORD *)(a1 + 32));
    objc_initWeak(&location, (id)v2);
    v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v2 + 56));
    objc_msgSend((id)v2, "delay");
    v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    dispatch_source_set_timer(v3, v5, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    v6 = MEMORY[0x1E0C809B0];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __32__WFDebouncer_restartDelayTimer__block_invoke;
    v20 = &unk_1E7AF5510;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v3, &v17);
    v7 = *(void **)(v2 + 80);
    *(_QWORD *)(v2 + 80) = v3;
    v8 = v3;

    dispatch_resume(v8);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v10 = *(id *)(v9 + 88);
      if (v10)
      {

      }
      else
      {
        objc_msgSend((id)v9, "maximumDelay", v17, v18, v19, v20);
        if (v11 != 0.0)
        {
          objc_initWeak(&location, (id)v9);
          v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v9 + 56));
          objc_msgSend((id)v9, "maximumDelay");
          v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
          dispatch_source_set_timer(v12, v14, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
          v17 = v6;
          v18 = 3221225472;
          v19 = __48__WFDebouncer_startMaximumDelayTimerIfNecessary__block_invoke;
          v20 = &unk_1E7AF5510;
          objc_copyWeak(&v21, &location);
          dispatch_source_set_event_handler(v12, &v17);
          v15 = *(void **)(v9 + 88);
          *(_QWORD *)(v9 + 88) = v12;
          v16 = v12;

          dispatch_activate(v16);
          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
        }
      }
    }
  }
}

void __48__WFDebouncer_startMaximumDelayTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fire");

}

void __32__WFDebouncer_restartDelayTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fire");

}

@end

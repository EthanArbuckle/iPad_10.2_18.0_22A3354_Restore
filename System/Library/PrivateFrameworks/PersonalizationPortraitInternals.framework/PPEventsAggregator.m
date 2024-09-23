@implementation PPEventsAggregator

- (PPEventsAggregator)initWithEventsPool:(id)a3
{
  id v5;
  PPEventsAggregator *v6;
  PPEventsAggregator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPEventsAggregator;
  v6 = -[PPEventsAggregator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_eventsPool, a3);

  return v7;
}

- (id)tripCandidatesFromEventsPool
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("tripCandidatesFromEventsPool: Method must be overridden"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("isEvent: Method must be overridden"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)dedupeEventsInPool
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("dedupeEventsInPool: Method must be overridden"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSArray)eventsPool
{
  return self->_eventsPool;
}

- (void)setEventsPool:(id)a3
{
  objc_storeStrong((id *)&self->_eventsPool, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsPool, 0);
}

- (void)dedupeEventsInPoolForCategory:(void *)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = a1;
  objc_msgSend(a1, "eventsPool");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v10 = v4;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          while (2)
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              if ((objc_msgSend(v9, "pp_isDupeOfEvent:forCategory:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), a2) & 1) != 0)
              {

                goto LABEL_16;
              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v12)
              continue;
            break;
          }
        }

        objc_msgSend(v10, "addObject:", v9);
LABEL_16:
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  objc_msgSend(v15, "setEventsPool:", v4);
}

- (id)tripCandidatesFromEventsPoolForCategory:(void *)a1
{
  char v2;
  void *v4;
  void *v5;
  _QWORD v7[4];
  char v8;

  if (!a1)
    return 0;
  v2 = a2;
  -[PPEventsAggregator dedupeEventsInPoolForCategory:](a1, a2);
  objc_msgSend(a1, "eventsPool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PPEventsAggregator_tripCandidatesFromEventsPoolForCategory___block_invoke;
  v7[3] = &__block_descriptor_33_e34___PPTripCandidate_16__0__EKEvent_8l;
  v8 = v2;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __62__PPEventsAggregator_tripCandidatesFromEventsPoolForCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  switch(*(_BYTE *)(a1 + 32))
  {
    case 0:
    case 0xB:
    case 0xC:
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99778];
      v9 = CFSTR("tripCandidatesFromEventsPoolForCategory: Unsupported category");
      goto LABEL_9;
    case 1:
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99778];
      v9 = CFSTR("tripCandidatesFromEventsPoolForCategory: Flight category is not supported");
LABEL_9:
      objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v10);
    case 2:
    case 8:
    case 9:
      v13[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setOthers:", v5);
      goto LABEL_5;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      v12 = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setGroundTransports:", v5);
      goto LABEL_5;
    case 0xA:
      v11 = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHotels:", v5);
LABEL_5:

      break;
    default:
      break;
  }

  return v4;
}

@end

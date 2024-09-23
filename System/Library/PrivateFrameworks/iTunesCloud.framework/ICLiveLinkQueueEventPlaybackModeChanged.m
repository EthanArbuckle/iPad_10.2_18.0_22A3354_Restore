@implementation ICLiveLinkQueueEventPlaybackModeChanged

- (ICLiveLinkQueueEventPlaybackModeChanged)initWithUpdatedShuffleType:(int64_t)a3
{
  ICLiveLinkQueueEventPlaybackModeChanged *v4;
  ICLiveLinkQueueEventPlaybackModeChanged *v5;
  uint64_t v6;
  uint64_t v7;
  id shuffleType;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICLiveLinkQueueEventPlaybackModeChanged;
  v4 = -[ICLiveLinkQueueEventPlaybackModeChanged init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v4->_kind = 1;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __70__ICLiveLinkQueueEventPlaybackModeChanged_initWithUpdatedShuffleType___block_invoke;
    v10[3] = &__block_descriptor_40_e5_q8__0l;
    v10[4] = a3;
    v7 = objc_msgSend(v10, "copy");
    shuffleType = v5->_shuffleType;
    v5->_shuffleType = (id)v7;

  }
  return v5;
}

- (ICLiveLinkQueueEventPlaybackModeChanged)initWithUpdatedRepeatType:(int64_t)a3
{
  ICLiveLinkQueueEventPlaybackModeChanged *v4;
  ICLiveLinkQueueEventPlaybackModeChanged *v5;
  uint64_t v6;
  uint64_t v7;
  id repeatType;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICLiveLinkQueueEventPlaybackModeChanged;
  v4 = -[ICLiveLinkQueueEventPlaybackModeChanged init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v4->_kind = 2;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __69__ICLiveLinkQueueEventPlaybackModeChanged_initWithUpdatedRepeatType___block_invoke;
    v10[3] = &__block_descriptor_40_e5_q8__0l;
    v10[4] = a3;
    v7 = objc_msgSend(v10, "copy");
    repeatType = v5->_repeatType;
    v5->_repeatType = (id)v7;

  }
  return v5;
}

- (ICLiveLinkQueueEventPlaybackModeChanged)initWithUpdatedAutoPlayEnabled:(BOOL)a3
{
  ICLiveLinkQueueEventPlaybackModeChanged *v4;
  ICLiveLinkQueueEventPlaybackModeChanged *v5;
  uint64_t v6;
  uint64_t v7;
  id autoPlayEnabled;
  _QWORD v10[4];
  BOOL v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICLiveLinkQueueEventPlaybackModeChanged;
  v4 = -[ICLiveLinkQueueEventPlaybackModeChanged init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v4->_kind = 3;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __74__ICLiveLinkQueueEventPlaybackModeChanged_initWithUpdatedAutoPlayEnabled___block_invoke;
    v10[3] = &__block_descriptor_33_e5_B8__0l;
    v11 = a3;
    v7 = objc_msgSend(v10, "copy");
    autoPlayEnabled = v5->_autoPlayEnabled;
    v5->_autoPlayEnabled = (id)v7;

  }
  return v5;
}

- (id)description
{
  int64_t kind;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v14;

  kind = self->_kind;
  switch(kind)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEventPlaybackModeChanged: %p unknown/invalid>"), self, v14);
      goto LABEL_9;
    case 1:
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = (*((uint64_t (**)(void))self->_shuffleType + 2))();
      if (v12 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown/shuffleType=%ld"), v12);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E438F528[v12];
      }
      objc_msgSend(v11, "stringWithFormat:", CFSTR("<ICLiveLinkQueueEventPlaybackModeChanged: %p shuffleType=%@>"), self, v6);
      goto LABEL_16;
    case 2:
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = (*((uint64_t (**)(void))self->_repeatType + 2))();
      if (v5 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown/repeatType=%ld"), v5);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E438F548[v5];
      }
      objc_msgSend(v4, "stringWithFormat:", CFSTR("<ICLiveLinkQueueEventPlaybackModeChanged: %p repeatType=%@>"), self, v6);
LABEL_16:
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      return v10;
    case 3:
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = (*((uint64_t (**)(void))self->_autoPlayEnabled + 2))();
      v9 = CFSTR("NO");
      if (v8)
        v9 = CFSTR("YES");
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<ICLiveLinkQueueEventPlaybackModeChanged: %p autoPlayEnabled=%@>"), self, v9);
      goto LABEL_9;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEventPlaybackModeChanged: %p unknown/kind=%ld>"), self, kind);
LABEL_9:
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      return v10;
  }
}

- (int64_t)kind
{
  return self->_kind;
}

- (id)shuffleType
{
  return self->_shuffleType;
}

- (id)repeatType
{
  return self->_repeatType;
}

- (id)autoPlayEnabled
{
  return self->_autoPlayEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_autoPlayEnabled, 0);
  objc_storeStrong(&self->_repeatType, 0);
  objc_storeStrong(&self->_shuffleType, 0);
}

uint64_t __74__ICLiveLinkQueueEventPlaybackModeChanged_initWithUpdatedAutoPlayEnabled___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t __69__ICLiveLinkQueueEventPlaybackModeChanged_initWithUpdatedRepeatType___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t __70__ICLiveLinkQueueEventPlaybackModeChanged_initWithUpdatedShuffleType___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

@end

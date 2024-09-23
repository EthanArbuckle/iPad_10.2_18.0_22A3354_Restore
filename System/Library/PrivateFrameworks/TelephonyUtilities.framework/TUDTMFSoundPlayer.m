@implementation TUDTMFSoundPlayer

- (TUDTMFSoundPlayer)init
{
  TUDTMFSoundPlayer *v2;
  TUDTMFSoundPlayer *v3;
  id playSystemSoundHandler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUDTMFSoundPlayer;
  v2 = -[TUDTMFSoundPlayer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    playSystemSoundHandler = v2->_playSystemSoundHandler;
    v2->_playSystemSoundHandler = &__block_literal_global_6;

  }
  return v3;
}

uint64_t __25__TUDTMFSoundPlayer_init__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Calling AudioServicesPlaySystemSoundWithOptions() with system sound ID %d", (uint8_t *)v5, 8u);
  }

  if (_block_invoke__pred_AudioServicesPlaySystemSoundWithOptionsAudioToolbox != -1)
    dispatch_once(&_block_invoke__pred_AudioServicesPlaySystemSoundWithOptionsAudioToolbox, &__block_literal_global_3);
  return _block_invoke__AudioServicesPlaySystemSoundWithOptions(a2, 0, 0);
}

uint64_t (*__25__TUDTMFSoundPlayer_init__block_invoke_1())(_QWORD, _QWORD, _QWORD)
{
  uint64_t (*result)(_QWORD, _QWORD, _QWORD);

  result = (uint64_t (*)(_QWORD, _QWORD, _QWORD))CUTWeakLinkSymbol();
  _block_invoke__AudioServicesPlaySystemSoundWithOptions = result;
  return result;
}

- (BOOL)attemptToPlayKey:(unsigned __int8)a3
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  BOOL v6;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case '#':
      v4 = 11;
      goto LABEL_17;
    case '*':
      v4 = 10;
      goto LABEL_17;
    case '0':
      v4 = 0;
      goto LABEL_17;
    case '1':
      v6 = 1;
      -[TUDTMFSoundPlayer attemptToPlaySoundType:](self, "attemptToPlaySoundType:", 1);
      return v6;
    case '2':
      v4 = 2;
      goto LABEL_17;
    case '3':
      v4 = 3;
      goto LABEL_17;
    case '4':
      v4 = 4;
      goto LABEL_17;
    case '5':
      v4 = 5;
      goto LABEL_17;
    case '6':
      v4 = 6;
      goto LABEL_17;
    case '7':
      v4 = 7;
      goto LABEL_17;
    case '8':
      v4 = 8;
      goto LABEL_17;
    case '9':
      v4 = 9;
LABEL_17:
      -[TUDTMFSoundPlayer attemptToPlaySoundType:](self, "attemptToPlaySoundType:", v4);
      v6 = 1;
      break;
    default:
      TUDefaultLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v8[0] = 67109120;
        v8[1] = v3;
        _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Requested to play DTMF tone for unknown key: %d", (uint8_t *)v8, 8u);
      }

      v6 = 0;
      break;
  }
  return v6;
}

- (void)attemptToPlaySoundType:(int64_t)a3
{
  NSObject *v5;
  void (**v6)(void);
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to play DTMF sound type %ld", (uint8_t *)&v7, 0xCu);
  }

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      -[TUDTMFSoundPlayer playSystemSoundHandler](self, "playSystemSoundHandler");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

      break;
    default:
      return;
  }
}

- (id)playSystemSoundHandler
{
  return self->_playSystemSoundHandler;
}

- (void)setPlaySystemSoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playSystemSoundHandler, 0);
}

@end

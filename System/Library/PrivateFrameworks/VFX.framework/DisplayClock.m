@implementation DisplayClock

- (void)_applicationDidEnterBackground:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  uint64_t v12;

  v4 = sub_1B2227DC8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B2227DBC();
  v9 = *(void **)self->displayLink;
  swift_retain();
  if (v9)
  {
    v10 = objc_msgSend(v9, sel_isPaused);
    v11 = *(void **)self->displayLink;
  }
  else
  {
    v11 = 0;
    v10 = 1;
  }
  self->_pausedOnBackgrounding[0] = v10;
  objc_msgSend(v11, sel_setPaused_, 1);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)_applicationWillEnterForeground:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = sub_1B2227DC8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B2227DBC();
  if ((self->_pausedOnBackgrounding[0] & 1) == 0)
  {
    v9 = *(void **)self->displayLink;
    if (v9)
    {
      swift_retain();
      if (!objc_msgSend(v9, sel_isPaused))
      {
LABEL_7:
        swift_release();
        goto LABEL_8;
      }
      v10 = *(void **)self->displayLink;
    }
    else
    {
      swift_retain();
      v10 = 0;
    }
    objc_msgSend(v10, sel_setPaused_, 0);
    goto LABEL_7;
  }
LABEL_8:
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

@end

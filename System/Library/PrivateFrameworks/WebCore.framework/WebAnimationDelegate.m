@implementation WebAnimationDelegate

- (void)animationDidStart:(id)a3
{
  WTF::MonotonicTime *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  WTF::StringImpl *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WebThreadLock();
  if (self->m_owner)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("WKPlatformCAAnimationExplicitBeginTimeFlag")), "BOOLValue"))v6 = CACurrentMediaTime();
    else
      v5 = (WTF::MonotonicTime *)objc_msgSend(a3, "beginTime");
    v7 = v6;
    WTF::MonotonicTime::now(v5);
    v9 = v8;
    v10 = CACurrentMediaTime();
    v11 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)self->m_owner + 40))(self->m_owner);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = (void *)objc_msgSend(v11, "animationKeys");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v13)
    {
      v14 = v7 - v10 + v9;
      v15 = *(_QWORD *)v22;
LABEL_7:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
        if ((id)objc_msgSend(v11, "animationForKey:", v17) == a3)
          break;
        if (v13 == ++v16)
        {
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (v13)
            goto LABEL_7;
          return;
        }
      }
      MEMORY[0x19AEA5508](&v20, v17);
      v19 = v20;
      v25 = v20;
      if (!v20)
        return;
      if (*((_DWORD *)v20 + 1))
      {
        (*(void (**)(void *, WTF::StringImpl **, double))(*(_QWORD *)self->m_owner + 56))(self->m_owner, &v25, v14);
        v19 = v25;
        v25 = 0;
        if (!v19)
          return;
      }
      else
      {
        v25 = 0;
      }
      if (*(_DWORD *)v19 == 2)
        WTF::StringImpl::destroy(v19, v18);
      else
        *(_DWORD *)v19 -= 2;
    }
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *m_owner;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  WTF::StringImpl *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WebThreadLock();
  m_owner = self->m_owner;
  if (m_owner)
  {
    v7 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)m_owner + 40))(m_owner);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = (void *)objc_msgSend(v7, "animationKeys");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        if ((id)objc_msgSend(v7, "animationForKey:", v12) == a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
          if (v9)
            goto LABEL_4;
          return;
        }
      }
      MEMORY[0x19AEA5508](&v15, v12);
      v14 = v15;
      v20 = v15;
      if (!v15)
        return;
      if (*((_DWORD *)v15 + 1))
      {
        (*(void (**)(void *, WTF::StringImpl **))(*(_QWORD *)self->m_owner + 64))(self->m_owner, &v20);
        v14 = v20;
        v20 = 0;
        if (!v14)
          return;
      }
      else
      {
        v20 = 0;
      }
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v13);
      else
        *(_DWORD *)v14 -= 2;
    }
  }
}

- (void)setOwner:(void *)a3
{
  self->m_owner = a3;
}

@end

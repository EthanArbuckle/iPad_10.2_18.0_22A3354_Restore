@implementation WebNotificationPrivate

- (void).cxx_destruct
{
  StringImpl *m_ptr;
  StringImpl *v4;
  StringImpl *v5;
  StringImpl *v6;
  StringImpl *v7;
  StringImpl *v8;
  StringImpl *v9;
  StringImpl *v10;
  StringImpl *v11;

  if (*((_BYTE *)&self[1]._internal.var0.m_processIdentifier + 32))
  {
    m_ptr = self[1]._internal.var0.__val_.defaultActionURL.m_string.m_impl.m_ptr;
    if (m_ptr)
    {
      self[1]._internal.var0.m_processIdentifier.m_identifier = 0;
      *((_DWORD *)&self[1]._internal.var0.__val_.defaultActionURL + 2) = 0;
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
    v4 = self->_internal.var0.__val_.serviceWorkerRegistrationURL.m_string.m_impl.m_ptr;
    self->_internal.var0.__val_.serviceWorkerRegistrationURL.m_string.m_impl.m_ptr = 0;
    if (v4)
    {
      if (*(_DWORD *)v4 == 2)
      {
        WTF::StringImpl::destroy((WTF::StringImpl *)v4, (StringImpl *)a2);
        v5 = self->_internal.var0.__val_.originString.m_impl.m_ptr;
        self->_internal.var0.__val_.originString.m_impl.m_ptr = 0;
        if (!v5)
          goto LABEL_12;
LABEL_10:
        if (*(_DWORD *)v5 == 2)
        {
          WTF::StringImpl::destroy((WTF::StringImpl *)v5, (StringImpl *)a2);
          v6 = self->_internal.var0.__val_.language.m_impl.m_ptr;
          self->_internal.var0.__val_.language.m_impl.m_ptr = 0;
          if (!v6)
            goto LABEL_17;
LABEL_15:
          if (*(_DWORD *)v6 == 2)
          {
            WTF::StringImpl::destroy((WTF::StringImpl *)v6, (StringImpl *)a2);
            v7 = self->_internal.var0.__val_.tag.m_impl.m_ptr;
            self->_internal.var0.__val_.tag.m_impl.m_ptr = 0;
            if (!v7)
              goto LABEL_22;
LABEL_20:
            if (*(_DWORD *)v7 == 2)
            {
              WTF::StringImpl::destroy((WTF::StringImpl *)v7, (StringImpl *)a2);
              v8 = self->_internal.var0.__val_.iconURL.m_impl.m_ptr;
              self->_internal.var0.__val_.iconURL.m_impl.m_ptr = 0;
              if (!v8)
                goto LABEL_27;
LABEL_25:
              if (*(_DWORD *)v8 == 2)
              {
                WTF::StringImpl::destroy((WTF::StringImpl *)v8, (StringImpl *)a2);
                v9 = self->_internal.var0.__val_.body.m_impl.m_ptr;
                self->_internal.var0.__val_.body.m_impl.m_ptr = 0;
                if (!v9)
                  goto LABEL_32;
LABEL_30:
                if (*(_DWORD *)v9 == 2)
                {
                  WTF::StringImpl::destroy((WTF::StringImpl *)v9, (StringImpl *)a2);
                  v10 = self->_internal.var0.__val_.title.m_impl.m_ptr;
                  self->_internal.var0.__val_.title.m_impl.m_ptr = 0;
                  if (!v10)
                    goto LABEL_37;
LABEL_35:
                  if (*(_DWORD *)v10 == 2)
                  {
                    WTF::StringImpl::destroy((WTF::StringImpl *)v10, (StringImpl *)a2);
                    v11 = self->_internal.var0.__val_.defaultActionURL.m_string.m_impl.m_ptr;
                    self->_internal.var0.m_processIdentifier.m_identifier = 0;
                    if (!v11)
                      return;
                    goto LABEL_40;
                  }
                  *(_DWORD *)v10 -= 2;
LABEL_37:
                  v11 = self->_internal.var0.__val_.defaultActionURL.m_string.m_impl.m_ptr;
                  self->_internal.var0.m_processIdentifier.m_identifier = 0;
                  if (!v11)
                    return;
LABEL_40:
                  if (*(_DWORD *)v11 == 2)
                    WTF::StringImpl::destroy((WTF::StringImpl *)v11, (StringImpl *)a2);
                  else
                    *(_DWORD *)v11 -= 2;
                  return;
                }
                *(_DWORD *)v9 -= 2;
LABEL_32:
                v10 = self->_internal.var0.__val_.title.m_impl.m_ptr;
                self->_internal.var0.__val_.title.m_impl.m_ptr = 0;
                if (!v10)
                  goto LABEL_37;
                goto LABEL_35;
              }
              *(_DWORD *)v8 -= 2;
LABEL_27:
              v9 = self->_internal.var0.__val_.body.m_impl.m_ptr;
              self->_internal.var0.__val_.body.m_impl.m_ptr = 0;
              if (!v9)
                goto LABEL_32;
              goto LABEL_30;
            }
            *(_DWORD *)v7 -= 2;
LABEL_22:
            v8 = self->_internal.var0.__val_.iconURL.m_impl.m_ptr;
            self->_internal.var0.__val_.iconURL.m_impl.m_ptr = 0;
            if (!v8)
              goto LABEL_27;
            goto LABEL_25;
          }
          *(_DWORD *)v6 -= 2;
LABEL_17:
          v7 = self->_internal.var0.__val_.tag.m_impl.m_ptr;
          self->_internal.var0.__val_.tag.m_impl.m_ptr = 0;
          if (!v7)
            goto LABEL_22;
          goto LABEL_20;
        }
        *(_DWORD *)v5 -= 2;
LABEL_12:
        v6 = self->_internal.var0.__val_.language.m_impl.m_ptr;
        self->_internal.var0.__val_.language.m_impl.m_ptr = 0;
        if (!v6)
          goto LABEL_17;
        goto LABEL_15;
      }
      *(_DWORD *)v4 -= 2;
    }
    v5 = self->_internal.var0.__val_.originString.m_impl.m_ptr;
    self->_internal.var0.__val_.originString.m_impl.m_ptr = 0;
    if (!v5)
      goto LABEL_12;
    goto LABEL_10;
  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 16) = 0;
  *((_BYTE *)self + 256) = 0;
  return self;
}

@end

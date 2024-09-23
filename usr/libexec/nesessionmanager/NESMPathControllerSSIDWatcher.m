@implementation NESMPathControllerSSIDWatcher

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  id Property;
  id v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  id v22;
  const char *v23;
  id WeakRetained;
  SEL v25;
  id v26;
  id v27;
  SEL v28;
  id v29;
  const char *v30;
  const char *v31;
  id v32;
  id v33;
  id v34;
  __CFString *v35;
  __CFString *v36;
  uint8_t v37[24];

  v9 = a3;
  v10 = a4;
  v12 = a5;
  if (self)
    Property = objc_getProperty(self, v11, 16, 1);
  else
    Property = 0;
  v14 = Property;
  if (v14 != v10)
  {

    goto LABEL_14;
  }
  v15 = objc_msgSend(v9, "isEqualToString:", CFSTR("status"));

  if (!v15)
    goto LABEL_14;
  v18 = ne_log_obj(v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    if (self)
      v33 = objc_getProperty(self, v20, 16, 1);
    else
      v33 = 0;
    v34 = objc_msgSend(v33, "status");
    v35 = CFSTR("Invalid");
    if (v34 == (id)2)
      v35 = CFSTR("Not Available");
    if (v34 == (id)1)
      v35 = CFSTR("Available");
    *(_DWORD *)v37 = 138412290;
    *(_QWORD *)&v37[4] = v35;
    v36 = v35;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "SSID status changed to %@", v37, 0xCu);

  }
  if (self)
    v22 = objc_getProperty(self, v21, 16, 1);
  else
    v22 = 0;
  if (objc_msgSend(v22, "status", *(_OWORD *)v37) == (id)1)
  {
    if (self)
    {
      self->_hasBeenAssociated = 1;
      WeakRetained = objc_loadWeakRetained((id *)&self->_parentSession);
      v26 = objc_getProperty(self, v25, 24, 1);
    }
    else
    {
      WeakRetained = 0;
      v26 = 0;
    }
    sub_100087FB0(WeakRetained, v26, 1);
LABEL_13:

    goto LABEL_14;
  }
  if (self)
    v27 = objc_getProperty(self, v23, 16, 1);
  else
    v27 = 0;
  if (objc_msgSend(v27, "status") == (id)2 && self && self->_hasBeenAssociated)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentSession);
    v29 = objc_getProperty(self, v28, 24, 1);
    sub_100087FB0(WeakRetained, v29, 0);
    sub_100087ED0((id *)&self->super.isa, v30);
    if (WeakRetained)
      v32 = objc_getProperty(WeakRetained, v31, 400, 1);
    else
      v32 = 0;
    objc_msgSend(v32, "removeObject:", self);
    goto LABEL_13;
  }
LABEL_14:

}

- (void)dealloc
{
  objc_super v3;

  sub_100087ED0((id *)&self->super.isa, a2);
  v3.receiver = self;
  v3.super_class = (Class)NESMPathControllerSSIDWatcher;
  -[NESMPathControllerSSIDWatcher dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentSession);
  objc_storeStrong((id *)&self->_monitorTransaction, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end

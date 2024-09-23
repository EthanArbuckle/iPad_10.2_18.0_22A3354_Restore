@implementation NEPrivateLTEMonitor

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  NEPrivateLTEMonitor *v14;
  __int16 v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v11 = ne_log_obj(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ connection state changed for context: %@", (uint8_t *)&v13, 0x16u);
  }

  if (!a4)
    sub_10008D8A0((uint64_t)self, v8, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_privateLTENetworks, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_currentInterface, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end

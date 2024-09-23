uint64_t query_interface(id **a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  NSObject *v8;
  _DWORD *v9;
  CFUUIDRef v10;
  CFUUIDRef v11;
  const __CFAllocator *v12;
  CFUUIDRef v13;
  CFUUIDRef v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;
  CFUUIDBytes v20;

  v19 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "query_interface";
    _os_log_impl(&dword_2457F9000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9 = **a1;
  *(_QWORD *)&v20.byte0 = a2;
  *(_QWORD *)&v20.byte8 = a3;
  v10 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], v20);
  v11 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  if (CFEqual(v10, v11))
  {
    *a4 = v9 + 22;
    ++v9[52];
  }
  else
  {
    v12 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
    v13 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x6Fu, 0xE2u, 0x2Au, 0xBFu, 0x68u, 0xB9u, 0x11u, 0xDBu, 0xA7u, 0x1Fu, 0, 0x16u, 0xCBu, 0xC1u, 0x10u, 0xF7u);
    if (CFEqual(v10, v13))
    {
      *a4 = v9 + 50;
      ++v9[53];
    }
    else
    {
      v14 = CFUUIDGetConstantUUIDWithBytes(v12, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
      if (CFEqual(v10, v14))
      {
        *a4 = v9 + 50;
        ++v9[54];
      }
      else
      {
        *a4 = 0;
      }
    }
  }
  CFRelease(v10);
  if (*a4)
    v15 = 0;
  else
    v15 = 2147483652;

  return v15;
}

uint64_t cfplugin_add_ref(uint64_t **a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "cfplugin_add_ref";
    _os_log_impl(&dword_2457F9000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3 = **a1;
  result = *(unsigned int *)(v3 + 208);
  *(_DWORD *)(v3 + 208) = result + 1;
  return result;
}

uint64_t cfplugin_release(id **a1)
{
  NSObject *v2;
  _DWORD *v3;
  int v4;
  uint64_t v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "cfplugin_release";
    _os_log_impl(&dword_2457F9000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }

  v3 = **a1;
  v4 = v3[52];
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("attempt to over-release CF plug-in COM interface"));
    v4 = v3[52];
  }
  v5 = (v4 - 1);
  v3[52] = v5;
  objc_msgSend(v3, "checkRefCounts");

  return v5;
}

uint64_t cfplugin_probe(id **a1, uint64_t a2, io_registry_entry_t a3)
{
  NSObject *v5;
  uint64_t v6;
  id *v7;
  __IOHIDDevice *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const __CFString *v15;
  CFTypeRef Property;
  void *v17;
  SCService *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  io_registry_entry_t parent;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "cfplugin_probe";
    _os_log_impl(&dword_2457F9000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  v6 = 3758097088;

  v7 = (id *)**a1;
  *(_DWORD *)buf = 0;
  if (!IORegistryEntryGetParentEntry(a3, "IOService", (io_registry_entry_t *)buf))
  {
    parent = 0;
    if (IORegistryEntryGetParentEntry(*(io_registry_entry_t *)buf, "IOService", &parent))
    {
      IOObjectRelease(*(io_object_t *)buf);
    }
    else
    {
      v9 = IOHIDDeviceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], parent);
      IOObjectRelease(parent);
      IOObjectRelease(*(io_object_t *)buf);
      if (v9)
      {
        v10 = IOHIDDeviceOpen(v9, 0);
        if ((_DWORD)v10)
        {
          v6 = v10;
          CFRelease(v9);
        }
        else
        {
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v11 = objc_msgSend(&unk_2516A10E0, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v21;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v21 != v13)
                  objc_enumerationMutation(&unk_2516A10E0);
                v15 = *(const __CFString **)(*((_QWORD *)&v20 + 1) + 8 * i);
                Property = IOHIDDeviceGetProperty(v9, v15);
                if (Property)
                {
                  v17 = (void *)CFRetain(Property);
                  objc_msgSend(v7[28], "setObject:forKeyedSubscript:", v17, v15);

                }
              }
              v12 = objc_msgSend(&unk_2516A10E0, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
            }
            while (v12);
          }
          v18 = -[SCService initWithDevice:]([SCService alloc], "initWithDevice:", v9);
          v19 = v7[2];
          v7[2] = v18;

          CFRelease(v9);
          v6 = 0;
        }
      }
    }
  }

  return v6;
}

uint64_t cfplugin_start()
{
  NSObject *v0;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v2 = 136315138;
    v3 = "cfplugin_start";
    _os_log_impl(&dword_2457F9000, v0, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v2, 0xCu);
  }

  return 0;
}

uint64_t cfplugin_stop()
{
  NSObject *v0;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "cfplugin_stop";
    _os_log_impl(&dword_2457F9000, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v2, 0xCu);
  }

  return 0;
}

uint64_t hid_service_add_ref(uint64_t **a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "hid_service_add_ref";
    _os_log_impl(&dword_2457F9000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3 = **a1;
  result = *(unsigned int *)(v3 + 212);
  *(_DWORD *)(v3 + 212) = result + 1;
  return result;
}

uint64_t hid_service_release(id **a1)
{
  NSObject *v2;
  _DWORD *v3;
  int v4;
  uint64_t v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "hid_service_release";
    _os_log_impl(&dword_2457F9000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }

  v3 = **a1;
  v4 = v3[53];
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("attempt to over-release HID service COM interface"));
    v4 = v3[53];
  }
  v5 = (v4 - 1);
  v3[53] = v5;
  objc_msgSend(v3, "checkRefCounts");

  return v5;
}

uint64_t hid_service_open()
{
  NSObject *v0;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v2 = 136315138;
    v3 = "hid_service_open";
    _os_log_impl(&dword_2457F9000, v0, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v2, 0xCu);
  }

  return 1;
}

void hid_service_close()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "hid_service_close";
    _os_log_impl(&dword_2457F9000, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v1, 0xCu);
  }

}

uint64_t hid_service_copy_property(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  sc_get_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    hid_service_copy_property_cold_1();

  objc_msgSend(*(id *)(**(_QWORD **)a1 + 224), "objectForKeyedSubscript:", a2);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t hid_service_set_property()
{
  NSObject *v0;

  sc_get_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    hid_service_set_property_cold_1();

  return 1;
}

void hid_service_set_event_callback()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "hid_service_set_event_callback";
    _os_log_impl(&dword_2457F9000, v0, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v1, 0xCu);
  }

}

uint64_t hid_service_schedule(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "hid_service_schedule";
    _os_log_impl(&dword_2457F9000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(**(_QWORD **)a1 + 16), "start");
}

void hid_service_unschedule()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "hid_service_unschedule";
    _os_log_impl(&dword_2457F9000, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v1, 0xCu);
  }

}

uint64_t hid_service_copy_event()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sc_get_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    hid_service_copy_event_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  return 0;
}

uint64_t hid_service_set_output_event()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sc_get_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    hid_service_set_output_event_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  return 3758097095;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void input_report_callback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v9 = a1;
  v10 = v9;
  if (a6 && a7 >= 1)
  {
    objc_msgSend(v9, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a6, a7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __input_report_callback_block_invoke;
        v13[3] = &unk_25169CE70;
        v14 = v10;
        v15 = v12;
        dispatch_async(v11, v13);

      }
    }

  }
}

const char *ioreturn_string(int a1)
{
  int v1;
  const char *result;

  v1 = a1 + 536870212;
  result = "general error";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = "can't allocate memory";
      break;
    case 2:
      result = "resource shortage";
      break;
    case 3:
      result = "error during IPC";
      break;
    case 4:
      result = "no such device";
      break;
    case 5:
      result = "privilege violation";
      break;
    case 6:
      result = "invalid argument";
      break;
    case 7:
      result = "device read locked";
      break;
    case 8:
      result = "device write locked";
      break;
    case 9:
      result = "exclusive access and device already open";
      break;
    case 10:
      result = "sent/received messages had different msg_id";
      break;
    case 11:
      result = "unsupported function";
      break;
    case 12:
      result = "misc. VM failure";
      break;
    case 13:
      result = "internal error";
      break;
    case 14:
      result = "general I/O error";
      break;
    case 15:
    case 32:
      goto LABEL_5;
    case 16:
      result = "can't acquire lock";
      break;
    case 17:
      result = "device not open";
      break;
    case 18:
      result = "read not supported";
      break;
    case 19:
      result = "write not supported";
      break;
    case 20:
      result = "alignment error";
      break;
    case 21:
      result = "media error";
      break;
    case 22:
      result = "device(s) still open";
      break;
    case 23:
      result = "RLD failure";
      break;
    case 24:
      result = "DMA failure";
      break;
    case 25:
      result = "Device Busy";
      break;
    case 26:
      result = "I/O Timeout";
      break;
    case 27:
      result = "device offline";
      break;
    case 28:
      result = "not ready";
      break;
    case 29:
      result = "device not attached";
      break;
    case 30:
      result = "no DMA channels left";
      break;
    case 31:
      result = "no space for data";
      break;
    case 33:
      result = "port already exists";
      break;
    case 34:
      result = "can't wire down physical memory";
      break;
    case 35:
      result = "no interrupt attached";
      break;
    case 36:
      result = "no DMA frames enqueued";
      break;
    case 37:
      result = "oversized msg received on interrupt port";
      break;
    case 38:
      result = "not permitted";
      break;
    case 39:
      result = "no power to device";
      break;
    case 40:
      result = "media not present";
      break;
    case 41:
      result = "media not formatted";
      break;
    case 42:
      result = "no such mode";
      break;
    case 43:
      result = "data underrun";
      break;
    case 44:
      result = "data overrun";
      break;
    case 45:
      result = "the device is not working properly";
      break;
    case 46:
      result = "a completion routine is required";
      break;
    case 47:
      result = "operation aborted";
      break;
    case 48:
      result = "bus bandwidth would be exceeded";
      break;
    case 49:
      result = "device not responding";
      break;
    case 50:
      result = "isochronous I/O request for distant past";
      break;
    case 51:
      result = "isochronous I/O request for distant future";
      break;
    case 52:
      result = "data was not found";
      break;
    default:
      if ("general error" == -536870911)
        result = "invalid";
      else
LABEL_5:
        result = "unrecognized IOReturn code";
      break;
  }
  return result;
}

void sub_2457FD8C4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2457FD9F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2457FDCF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __input_report_callback_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleScandiumInputReport:", *(_QWORD *)(a1 + 40));

}

void sub_2457FE0EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  void *v20;
  void *v21;
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2457FE154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2457FE19C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2457FE200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SCTimeReference;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t ae::TimeReference::rtp_to_continuous_time_point(ae::TimeReference *this, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;

  v4 = a2;
  v2 = *((unsigned int *)this + 2);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = &v4;
  return ((uint64_t (*)(uint64_t **, ae::TimeReference *))off_25169CF78[v2])(&v5, this);
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8D8] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB738], (void (*)(void *))std::bad_variant_access::~bad_variant_access);
}

{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8D8] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB738], (void (*)(void *))std::bad_variant_access::~bad_variant_access);
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK2ae13TimeReference28rtp_to_continuous_time_pointEyEUlRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE0EJNS_6chrono8durationIxNS_5ratioILl1ELl24000000EEEEENSJ_IxNSK_ILl1ELl32768EEEEEEEEEEEDcSA_DpT0_(_QWORD **a1, _QWORD *a2)
{
  return 125 * **a1 * *a2 / 3;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK2ae13TimeReference28rtp_to_continuous_time_pointEyEUlRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE0EJNS_6chrono8durationIxNS_5ratioILl1ELl24000000EEEEENSJ_IxNSK_ILl1ELl32768EEEEEEEEEEEDcSA_DpT0_(_QWORD **a1, _QWORD *a2)
{
  return 1953125 * **a1 * *a2 / 64;
}

std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<-[SCTimeReference currentRTPTimestamp]::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,std::chrono::duration<long long,std::ratio<1l,24000000l>>,std::chrono<long long,std::chrono::duration<1l,32768l>>> &>()
{
  return 3 * std::chrono::steady_clock::now().__d_.__rep_ / 125;
}

std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<-[SCTimeReference currentRTPTimestamp]::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,std::chrono::duration<long long,std::ratio<1l,24000000l>>,std::chrono<long long,std::chrono::duration<1l,32768l>>> &>()
{
  return (std::chrono::steady_clock::now().__d_.__rep_ << 6) / 1953125;
}

void scandium::PacketDropDetector::handle_packet(scandium::PacketDropDetector *this, unsigned __int8 a2, __int16 a3, uint64_t a4)
{
  __int16 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  unsigned __int8 v15;
  unsigned __int8 *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v15 = a2;
  if (std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>(this, &v15))
  {
    v16 = &v15;
    v7 = *((_WORD *)std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char const&>,std::tuple<>>((uint64_t)this, &v15, (uint64_t)&std::piecewise_construct, &v16)+ 9);
    v16 = &v15;
    *((_WORD *)std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char const&>,std::tuple<>>((uint64_t)this, &v15, (uint64_t)&std::piecewise_construct, &v16)+ 9) = a3;
    v8 = (unsigned __int16)(~v7 + a3);
    if (~v7 + a3)
    {
      v17[0] = CFSTR("input_report_id");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v9;
      v17[1] = CFSTR("drop_count");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v10;
      v17[2] = CFSTR("packet_size");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      sc_get_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        scandium::PacketDropDetector::handle_packet(&v15, v8, v13);

      sc_get_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        scandium::PacketDropDetector::handle_packet((uint64_t)v12, v14);

      AnalyticsSendEvent();
    }
  }
  else
  {
    v16 = &v15;
    *((_WORD *)std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char const&>,std::tuple<>>((uint64_t)this, &v15, (uint64_t)&std::piecewise_construct, &v16)+ 9) = a3;
  }
}

void sub_2457FE960(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

uint64_t **std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>(_QWORD *a1, unsigned __int8 *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t ***v6;
  uint64_t **result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (v2.i32[0] - 1) & v3;
  }
  v6 = *(uint64_t ****)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t **)*result)
  {
    v8 = (unint64_t)result[1];
    if (v8 == v3)
    {
      if (*((unsigned __int8 *)result + 16) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _BYTE **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((unsigned __int8 *)v11 + 16) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v11 = operator new(0x18uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_BYTE *)v11 + 16) = **a4;
  *((_WORD *)v11 + 9) = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *v11 = *v20;
LABEL_38:
    *v20 = v11;
    goto LABEL_39;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v21 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_2457FECE4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void sub_2457FF234(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_2457FFF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id location;
  va_list locationa;
  id v10;
  va_list va1;
  id v12;
  va_list va2;
  id v14;
  va_list va3;
  va_list va4;

  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(locationa, a3);
  location = va_arg(va1, id);
  va_copy(va2, va1);
  v10 = va_arg(va2, id);
  va_copy(va3, va2);
  v12 = va_arg(va3, id);
  va_copy(va4, va3);
  v14 = va_arg(va4, id);
  objc_destroyWeak((id *)locationa);
  objc_destroyWeak((id *)va1);
  objc_destroyWeak((id *)va2);
  objc_destroyWeak((id *)va3);
  objc_destroyWeak((id *)va4);

  _Unwind_Resume(a1);
}

void sub_24580027C(_Unwind_Exception *a1, SCAnalytics *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  SCAnalytics::~SCAnalytics((SCAnalytics *)&a10);
  _Unwind_Resume(a1);
}

void scandium::convert_analytics_to_objc(uint64_t a1@<X0>, unsigned __int16 a2@<W1>, _DWORD *a3@<X2>, _DWORD *a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>, double a7@<D0>)
{
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  id v96;
  uint64_t v97;

  LODWORD(a7) = *(_DWORD *)a1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a7);
  *a6 = objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = *(_DWORD *)(a1 + 4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  a6[1] = objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = *(_DWORD *)(a1 + 8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  a6[2] = objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = *(_DWORD *)(a1 + 12);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  a6[3] = objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = *(_DWORD *)(a1 + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
  a6[4] = objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = *(_DWORD *)(a1 + 20);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  a6[5] = objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = *(_DWORD *)(a1 + 24);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  a6[6] = objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = *(_DWORD *)(a1 + 28);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  a6[7] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 32));
  a6[8] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 36));
  a6[9] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
  a6[10] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 44));
  a6[11] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 48));
  a6[12] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 50));
  a6[13] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 51));
  a6[14] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 52));
  a6[15] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 56));
  a6[16] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 60));
  a6[17] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 64));
  a6[18] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(_DWORD *)(a1 + 64) != -1);
  a6[19] = objc_claimAutoreleasedReturnValue();
  v21 = *(unsigned __int8 *)(a1 + 76);
  if (*(_BYTE *)(a1 + 76))
  {
    LODWORD(v20) = *(_DWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v96 = v22;
  a6[20] = (uint64_t)v22;
  if (a3)
  {
    LODWORD(v23) = *a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23, v96);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  a6[21] = (uint64_t)v24;
  if (a4)
  {
    LODWORD(v25) = *a4;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
  a6[22] = (uint64_t)v26;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 68));
  a6[23] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 70));
  a6[24] = objc_claimAutoreleasedReturnValue();
  v97 = a2 & 0xFF00;
  if ((a2 & 0xFF00) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", (char)a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  a6[25] = (uint64_t)v27;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 108));
  a6[26] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a5);
  a6[27] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 80));
  a6[28] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 84));
  a6[29] = objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = *(_DWORD *)(a1 + 88);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
  a6[30] = objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = *(_DWORD *)(a1 + 92);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
  a6[31] = objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = *(_DWORD *)(a1 + 96);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30);
  a6[32] = objc_claimAutoreleasedReturnValue();
  LODWORD(v31) = *(_DWORD *)(a1 + 100);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31);
  a6[33] = objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = *(_DWORD *)(a1 + 104);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v32);
  a6[34] = objc_claimAutoreleasedReturnValue();
  LODWORD(v33) = *(_DWORD *)(a1 + 112);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
  a6[35] = objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = *(_DWORD *)(a1 + 116);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v34);
  a6[36] = objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = *(_DWORD *)(a1 + 120);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v35);
  a6[37] = objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = *(_DWORD *)(a1 + 124);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v36);
  a6[38] = objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = *(_DWORD *)(a1 + 128);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v37);
  a6[39] = objc_claimAutoreleasedReturnValue();
  LODWORD(v38) = *(_DWORD *)(a1 + 132);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v38);
  a6[40] = objc_claimAutoreleasedReturnValue();
  LODWORD(v39) = *(_DWORD *)(a1 + 136);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v39);
  a6[41] = objc_claimAutoreleasedReturnValue();
  LODWORD(v40) = *(_DWORD *)(a1 + 140);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v40);
  a6[42] = objc_claimAutoreleasedReturnValue();
  LODWORD(v41) = *(_DWORD *)(a1 + 144);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v41);
  a6[43] = objc_claimAutoreleasedReturnValue();
  LODWORD(v42) = *(_DWORD *)(a1 + 148);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v42);
  a6[44] = objc_claimAutoreleasedReturnValue();
  LODWORD(v43) = *(_DWORD *)(a1 + 152);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v43);
  a6[45] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 156));
  a6[46] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 158));
  a6[47] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 160));
  a6[48] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 162));
  a6[49] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 164));
  a6[50] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 166));
  a6[51] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 168));
  a6[52] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 170));
  a6[53] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 172));
  a6[54] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 174));
  a6[55] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 176));
  a6[56] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 178));
  a6[57] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 180));
  a6[58] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 184));
  a6[59] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 188));
  a6[60] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 192));
  a6[61] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 196));
  a6[62] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 200));
  a6[63] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 204));
  a6[64] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 208));
  a6[65] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 212));
  a6[66] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 216));
  a6[67] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 220));
  a6[68] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 224));
  a6[69] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 228));
  a6[70] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 232));
  a6[71] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 236));
  a6[72] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 240));
  a6[73] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 244));
  a6[74] = objc_claimAutoreleasedReturnValue();
  LODWORD(v44) = *(_DWORD *)(a1 + 248);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v44);
  a6[75] = objc_claimAutoreleasedReturnValue();
  LODWORD(v45) = *(_DWORD *)(a1 + 252);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v45);
  a6[76] = objc_claimAutoreleasedReturnValue();
  LODWORD(v46) = *(_DWORD *)(a1 + 256);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v46);
  a6[77] = objc_claimAutoreleasedReturnValue();
  LODWORD(v47) = *(_DWORD *)(a1 + 260);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v47);
  a6[78] = objc_claimAutoreleasedReturnValue();
  LODWORD(v48) = *(_DWORD *)(a1 + 264);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v48);
  a6[79] = objc_claimAutoreleasedReturnValue();
  LODWORD(v49) = *(_DWORD *)(a1 + 268);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v49);
  a6[80] = objc_claimAutoreleasedReturnValue();
  LODWORD(v50) = *(_DWORD *)(a1 + 272);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v50);
  a6[81] = objc_claimAutoreleasedReturnValue();
  LODWORD(v51) = *(_DWORD *)(a1 + 276);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v51);
  a6[82] = objc_claimAutoreleasedReturnValue();
  LODWORD(v52) = *(_DWORD *)(a1 + 280);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v52);
  a6[83] = objc_claimAutoreleasedReturnValue();
  LODWORD(v53) = *(_DWORD *)(a1 + 284);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v53);
  a6[84] = objc_claimAutoreleasedReturnValue();
  LODWORD(v54) = *(_DWORD *)(a1 + 288);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v54);
  a6[85] = objc_claimAutoreleasedReturnValue();
  LODWORD(v55) = *(_DWORD *)(a1 + 292);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v55);
  a6[86] = objc_claimAutoreleasedReturnValue();
  LODWORD(v56) = *(_DWORD *)(a1 + 296);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v56);
  a6[87] = objc_claimAutoreleasedReturnValue();
  LODWORD(v57) = *(_DWORD *)(a1 + 300);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v57);
  a6[88] = objc_claimAutoreleasedReturnValue();
  LODWORD(v58) = *(_DWORD *)(a1 + 304);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v58);
  a6[89] = objc_claimAutoreleasedReturnValue();
  LODWORD(v59) = *(_DWORD *)(a1 + 308);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v59);
  a6[90] = objc_claimAutoreleasedReturnValue();
  LODWORD(v60) = *(_DWORD *)(a1 + 312);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v60);
  a6[91] = objc_claimAutoreleasedReturnValue();
  LODWORD(v61) = *(_DWORD *)(a1 + 316);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v61);
  a6[92] = objc_claimAutoreleasedReturnValue();
  LODWORD(v62) = *(_DWORD *)(a1 + 320);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v62);
  a6[93] = objc_claimAutoreleasedReturnValue();
  LODWORD(v63) = *(_DWORD *)(a1 + 324);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v63);
  a6[94] = objc_claimAutoreleasedReturnValue();
  LODWORD(v64) = *(_DWORD *)(a1 + 328);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v64);
  a6[95] = objc_claimAutoreleasedReturnValue();
  LODWORD(v65) = *(_DWORD *)(a1 + 332);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v65);
  a6[96] = objc_claimAutoreleasedReturnValue();
  LODWORD(v66) = *(_DWORD *)(a1 + 336);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v66);
  a6[97] = objc_claimAutoreleasedReturnValue();
  LODWORD(v67) = *(_DWORD *)(a1 + 340);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v67);
  a6[98] = objc_claimAutoreleasedReturnValue();
  LODWORD(v68) = *(_DWORD *)(a1 + 344);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v68);
  a6[99] = objc_claimAutoreleasedReturnValue();
  LODWORD(v69) = *(_DWORD *)(a1 + 348);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v69);
  a6[100] = objc_claimAutoreleasedReturnValue();
  LODWORD(v70) = *(_DWORD *)(a1 + 352);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v70);
  a6[101] = objc_claimAutoreleasedReturnValue();
  LODWORD(v71) = *(_DWORD *)(a1 + 356);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v71);
  a6[102] = objc_claimAutoreleasedReturnValue();
  LODWORD(v72) = *(_DWORD *)(a1 + 360);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v72);
  a6[103] = objc_claimAutoreleasedReturnValue();
  LODWORD(v73) = *(_DWORD *)(a1 + 364);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v73);
  a6[104] = objc_claimAutoreleasedReturnValue();
  LODWORD(v74) = *(_DWORD *)(a1 + 368);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v74);
  a6[105] = objc_claimAutoreleasedReturnValue();
  LODWORD(v75) = *(_DWORD *)(a1 + 372);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v75);
  a6[106] = objc_claimAutoreleasedReturnValue();
  LODWORD(v76) = *(_DWORD *)(a1 + 376);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v76);
  a6[107] = objc_claimAutoreleasedReturnValue();
  LODWORD(v77) = *(_DWORD *)(a1 + 380);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v77);
  a6[108] = objc_claimAutoreleasedReturnValue();
  LODWORD(v78) = *(_DWORD *)(a1 + 384);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v78);
  a6[109] = objc_claimAutoreleasedReturnValue();
  LODWORD(v79) = *(_DWORD *)(a1 + 388);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v79);
  a6[110] = objc_claimAutoreleasedReturnValue();
  LODWORD(v80) = *(_DWORD *)(a1 + 392);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v80);
  a6[111] = objc_claimAutoreleasedReturnValue();
  LODWORD(v81) = *(_DWORD *)(a1 + 396);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v81);
  a6[112] = objc_claimAutoreleasedReturnValue();
  LODWORD(v82) = *(_DWORD *)(a1 + 400);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v82);
  a6[113] = objc_claimAutoreleasedReturnValue();
  LODWORD(v83) = *(_DWORD *)(a1 + 404);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v83);
  a6[114] = objc_claimAutoreleasedReturnValue();
  LODWORD(v84) = *(_DWORD *)(a1 + 408);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v84);
  a6[115] = objc_claimAutoreleasedReturnValue();
  LODWORD(v85) = *(_DWORD *)(a1 + 412);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v85);
  a6[116] = objc_claimAutoreleasedReturnValue();
  LODWORD(v86) = *(_DWORD *)(a1 + 416);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v86);
  a6[117] = objc_claimAutoreleasedReturnValue();
  LODWORD(v87) = *(_DWORD *)(a1 + 420);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v87);
  a6[118] = objc_claimAutoreleasedReturnValue();
  LODWORD(v88) = *(_DWORD *)(a1 + 424);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v88);
  a6[119] = objc_claimAutoreleasedReturnValue();
  LODWORD(v89) = *(_DWORD *)(a1 + 428);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v89);
  a6[120] = objc_claimAutoreleasedReturnValue();
  LODWORD(v90) = *(_DWORD *)(a1 + 432);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v90);
  a6[121] = objc_claimAutoreleasedReturnValue();
  LODWORD(v91) = *(_DWORD *)(a1 + 436);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v91);
  a6[122] = objc_claimAutoreleasedReturnValue();
  LODWORD(v92) = *(_DWORD *)(a1 + 440);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v92);
  a6[123] = objc_claimAutoreleasedReturnValue();
  LODWORD(v93) = *(_DWORD *)(a1 + 444);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v93);
  a6[124] = objc_claimAutoreleasedReturnValue();
  LODWORD(v94) = *(_DWORD *)(a1 + 448);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v94);
  a6[125] = objc_claimAutoreleasedReturnValue();
  LODWORD(v95) = *(_DWORD *)(a1 + 452);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v95);
  a6[126] = objc_claimAutoreleasedReturnValue();
  if (v97)

  if (a4)
  if (a3)

  if (v21)
}

void sub_245800D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10)
{
  id *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;

  if (v12)
  if (v11)

  if (v15)
  _Unwind_Resume(a1);
}

void sub_2458011E8()
{
  JUMPOUT(0x245800DE8);
}

void sub_2458011F0()
{
  JUMPOUT(0x245800DF0);
}

void sub_2458011F8()
{
  JUMPOUT(0x245800DF8);
}

void sub_245801200()
{
  JUMPOUT(0x245800E00);
}

void sub_245801208()
{
  JUMPOUT(0x245800E08);
}

void sub_245801210()
{
  JUMPOUT(0x245800E10);
}

void sub_245801218()
{
  JUMPOUT(0x245800E18);
}

void sub_245801220()
{
  JUMPOUT(0x245800E20);
}

void sub_245801228()
{
  JUMPOUT(0x245800E28);
}

void sub_245801230()
{
  JUMPOUT(0x245800E30);
}

void sub_245801238()
{
  JUMPOUT(0x245800E38);
}

void sub_245801240()
{
  JUMPOUT(0x245800E40);
}

void sub_245801248()
{
  JUMPOUT(0x245800E48);
}

void sub_245801250()
{
  JUMPOUT(0x245800E50);
}

void sub_245801258()
{
  JUMPOUT(0x245800E58);
}

void sub_245801260()
{
  JUMPOUT(0x245800E60);
}

void sub_245801268()
{
  JUMPOUT(0x245800E68);
}

void sub_245801270()
{
  JUMPOUT(0x245800E70);
}

void sub_245801278()
{
  JUMPOUT(0x245800E78);
}

void sub_245801280()
{
  JUMPOUT(0x245800E80);
}

void sub_245801288()
{
  JUMPOUT(0x245800E88);
}

void sub_245801290()
{
  JUMPOUT(0x245800E90);
}

void sub_245801298()
{
  JUMPOUT(0x245800E98);
}

void sub_2458012A0()
{
  JUMPOUT(0x245800EA0);
}

void sub_2458012A8()
{
  JUMPOUT(0x245800EA8);
}

void sub_2458012B0()
{
  JUMPOUT(0x245800EB0);
}

void sub_2458012B8()
{
  JUMPOUT(0x245800EB8);
}

void sub_2458012C0()
{
  JUMPOUT(0x245800EC0);
}

void sub_2458012C8()
{
  JUMPOUT(0x245800EC8);
}

void sub_2458012D0()
{
  JUMPOUT(0x245800ED0);
}

void sub_2458012D8()
{
  JUMPOUT(0x245800ED8);
}

void sub_2458012E0()
{
  JUMPOUT(0x245800EE0);
}

void sub_2458012E8()
{
  JUMPOUT(0x245800EE8);
}

void sub_2458012F0()
{
  JUMPOUT(0x245800EF0);
}

void sub_2458012F8()
{
  JUMPOUT(0x245800EF8);
}

void sub_245801300()
{
  JUMPOUT(0x245800F00);
}

void sub_245801308()
{
  JUMPOUT(0x245800F08);
}

void sub_245801310()
{
  JUMPOUT(0x245800F10);
}

void sub_245801318()
{
  JUMPOUT(0x245800F18);
}

void sub_245801320()
{
  JUMPOUT(0x245800F20);
}

void sub_245801328()
{
  JUMPOUT(0x245800F28);
}

void sub_245801330()
{
  JUMPOUT(0x245800F30);
}

void sub_245801338()
{
  JUMPOUT(0x245800F38);
}

void sub_245801340()
{
  JUMPOUT(0x245800F40);
}

void sub_245801348()
{
  JUMPOUT(0x245800F48);
}

void sub_245801350()
{
  JUMPOUT(0x245800F50);
}

void sub_245801358()
{
  JUMPOUT(0x245800F58);
}

void sub_245801360()
{
  JUMPOUT(0x245800F60);
}

void sub_245801368()
{
  JUMPOUT(0x245800F68);
}

void sub_245801370()
{
  JUMPOUT(0x245800F70);
}

void sub_245801378()
{
  JUMPOUT(0x245800F78);
}

void sub_245801380()
{
  JUMPOUT(0x245800F80);
}

void sub_245801388()
{
  JUMPOUT(0x245800F88);
}

void sub_245801390()
{
  JUMPOUT(0x245800F90);
}

void sub_245801398()
{
  JUMPOUT(0x245800F98);
}

void sub_2458013A0()
{
  JUMPOUT(0x245800FA0);
}

void sub_2458013A8()
{
  JUMPOUT(0x245800FA8);
}

void sub_2458013B0()
{
  JUMPOUT(0x245800FB0);
}

void sub_2458013B8()
{
  JUMPOUT(0x245800FB8);
}

void sub_2458013C0()
{
  JUMPOUT(0x245800FC0);
}

void sub_2458013C8()
{
  JUMPOUT(0x245800FC8);
}

void sub_2458013D0()
{
  JUMPOUT(0x245800FD0);
}

void sub_2458013D8()
{
  JUMPOUT(0x245800FD8);
}

void sub_2458013E0()
{
  JUMPOUT(0x245800FE0);
}

void sub_2458013E8()
{
  JUMPOUT(0x245800FE8);
}

void sub_2458013F0()
{
  JUMPOUT(0x245800FF0);
}

void sub_2458013F8()
{
  JUMPOUT(0x245800FF8);
}

void sub_245801400()
{
  JUMPOUT(0x245801000);
}

void sub_245801408()
{
  JUMPOUT(0x245801008);
}

void sub_245801410()
{
  JUMPOUT(0x245801010);
}

void sub_245801418()
{
  JUMPOUT(0x245801018);
}

void sub_245801420()
{
  JUMPOUT(0x245801020);
}

void sub_245801428()
{
  JUMPOUT(0x245801028);
}

void sub_245801430()
{
  JUMPOUT(0x245801030);
}

void sub_245801438()
{
  JUMPOUT(0x245801038);
}

void sub_245801440()
{
  JUMPOUT(0x245801040);
}

void sub_245801448()
{
  JUMPOUT(0x245801048);
}

void sub_245801450()
{
  JUMPOUT(0x245801050);
}

void sub_245801458()
{
  JUMPOUT(0x245801058);
}

void sub_245801460()
{
  JUMPOUT(0x245801060);
}

void sub_245801468()
{
  JUMPOUT(0x245801068);
}

void sub_245801470()
{
  JUMPOUT(0x245801070);
}

void sub_245801478()
{
  JUMPOUT(0x245801078);
}

void sub_245801480()
{
  JUMPOUT(0x245801080);
}

void sub_245801488()
{
  JUMPOUT(0x245801088);
}

void sub_245801490()
{
  JUMPOUT(0x245801090);
}

void sub_245801498()
{
  JUMPOUT(0x245801098);
}

void sub_2458014A0()
{
  JUMPOUT(0x2458010A0);
}

void sub_2458014A8()
{
  JUMPOUT(0x2458010A8);
}

void sub_2458014B0()
{
  JUMPOUT(0x2458010B0);
}

void sub_2458014B8()
{
  JUMPOUT(0x2458010B8);
}

void sub_2458014C0()
{
  JUMPOUT(0x2458010C0);
}

void sub_2458014C8()
{
  JUMPOUT(0x2458010C8);
}

void sub_2458014D0()
{
  JUMPOUT(0x2458010D0);
}

void sub_2458014D8()
{
  JUMPOUT(0x2458010D8);
}

void sub_2458014E0()
{
  JUMPOUT(0x2458010E0);
}

void sub_2458014E8()
{
  JUMPOUT(0x2458010E8);
}

void sub_2458014F0()
{
  JUMPOUT(0x245801104);
}

void sub_2458014F8()
{
  JUMPOUT(0x24580110CLL);
}

void sub_245801500()
{
  JUMPOUT(0x245801148);
}

void sub_245801508()
{
  JUMPOUT(0x245801150);
}

void sub_245801510()
{
  JUMPOUT(0x245801158);
}

void sub_245801518()
{
  JUMPOUT(0x245801160);
}

void sub_245801520()
{
  JUMPOUT(0x245801168);
}

void sub_245801528()
{
  JUMPOUT(0x245801170);
}

void sub_245801530()
{
  JUMPOUT(0x245801178);
}

void sub_245801538()
{
  JUMPOUT(0x245801180);
}

void sub_245801540()
{
  JUMPOUT(0x245801188);
}

void sub_245801548()
{
  JUMPOUT(0x245801190);
}

void sub_245801550()
{
  JUMPOUT(0x245801198);
}

void sub_245801558()
{
  JUMPOUT(0x2458011A0);
}

void sub_245801560()
{
  JUMPOUT(0x2458011A8);
}

void sub_245801568()
{
  JUMPOUT(0x2458011B0);
}

void sub_245801570()
{
  JUMPOUT(0x2458011B8);
}

void sub_245801578()
{
  JUMPOUT(0x2458011C0);
}

void sub_245801580()
{
  JUMPOUT(0x2458011C8);
}

void sub_245801588()
{
  JUMPOUT(0x2458011D0);
}

void sub_245801590()
{
  JUMPOUT(0x2458011D8);
}

void sub_245801628(_Unwind_Exception *a1, SCAnalytics *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  SCAnalytics::~SCAnalytics((SCAnalytics *)&a10);
  _Unwind_Resume(a1);
}

void sub_2458016D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_24580177C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2458019C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,SCAnalytics *a35)
{
  void *v35;

  _Unwind_Resume(a1);
}

void sub_245802CBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

NSNumber *numberOrNsNull(NSNumber *a1)
{
  NSNumber *v1;
  NSNumber *v2;
  NSNumber *v3;
  NSNumber *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

void SCAnalytics::~SCAnalytics(SCAnalytics *this)
{

}

void sub_24580337C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

void sub_245803550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_24580371C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_2458038EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_25169CA70, MEMORY[0x24BEDAAF0]);
}

{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_25169CA70, MEMORY[0x24BEDAAF0]);
}

void sub_245803A4C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

id ****std::unique_ptr<scandium::Processor>::reset[abi:ne180100](id *****a1, id ****a2)
{
  id ****result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    scandium::Processor::~Processor(result);
    JUMPOUT(0x24953BE38);
  }
  return result;
}

id sc_get_log()
{
  if (sc_get_log_onceToken != -1)
    dispatch_once(&sc_get_log_onceToken, &__block_literal_global);
  return (id)sc_get_log_log;
}

void __sc_get_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.scandium", "framework");
  v1 = (void *)sc_get_log_log;
  sc_get_log_log = (uint64_t)v0;

}

_DWORD *iirSOS_new(int a1, uint64_t a2)
{
  _DWORD *v4;
  _DWORD *v5;
  int v6;
  int v7;

  v4 = malloc_type_malloc(0x18uLL, 0x10C004046BDA19FuLL);
  v5 = v4;
  if (a1 >= 0)
    v6 = a1;
  else
    v6 = a1 + 1;
  v7 = (a1 & 1) + (v6 >> 1);
  *v4 = a1;
  v4[1] = v7;
  *((_QWORD *)v4 + 1) = a2;
  *((_QWORD *)v4 + 2) = malloc_type_calloc(v7, 8uLL, 0x100004052888210uLL);
  return v5;
}

uint64_t iirSOS_delete(void **a1)
{
  if (!a1)
    return 2;
  free(a1[2]);
  free(a1);
  return 0;
}

uint64_t iirSOS_init(uint64_t a1)
{
  int v1;
  int v2;
  void *v3;

  if (!a1)
    return 2;
  v1 = *(_DWORD *)(a1 + 4);
  if (v1 >= 1)
  {
    v2 = 2 * v1;
    v3 = *(void **)(a1 + 16);
    if (v2 <= 1)
      v2 = 1;
    bzero(v3, 4 * v2);
  }
  return 0;
}

uint64_t iirSOS_setCoefs(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 2;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *(_QWORD *)(a1 + 8) = a2;
    }
  }
  return result;
}

uint64_t iirSOS_process(uint64_t a1, float *a2, float *a3, unsigned int a4)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  float v13;
  float *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  uint64_t v20;
  float *v21;
  float v22;
  float v23;

  result = 2;
  if (a1 && a2 && a3)
  {
    if ((a4 & 0x80000000) != 0)
    {
      return 4;
    }
    else
    {
      v6 = *(unsigned int *)(a1 + 4);
      if ((int)v6 >= 1)
      {
        v7 = 0;
        v10 = a1 + 8;
        v8 = *(_QWORD *)(a1 + 8);
        v9 = *(_QWORD *)(v10 + 8);
        do
        {
          v11 = *(float *)(v9 + 8 * v7);
          v12 = (2 * v7) | 1;
          v13 = *(float *)(v9 + 4 * v12);
          if (a4)
          {
            v14 = (float *)(v8 + 20 * v7);
            v15 = *v14;
            v16 = v14[1];
            v17 = v14[2];
            v18 = -v14[3];
            v19 = -v14[4];
            v20 = a4;
            v21 = a3;
            do
            {
              v22 = *a2++;
              v23 = v11 + (float)(v15 * v22);
              *v21++ = v23;
              v11 = v13 + (float)((float)(v23 * v18) + (float)(v16 * v22));
              v13 = (float)(v23 * v19) + (float)(v17 * v22);
              --v20;
            }
            while (v20);
          }
          *(float *)(v9 + 8 * v7) = v11;
          *(float *)(v9 + 4 * v12) = v13;
          ++v7;
          a2 = a3;
        }
        while (v7 != v6);
      }
      return 0;
    }
  }
  return result;
}

void Scandium::ScandiumPPG::find_slope(const float *a1, unsigned int a2, unsigned int a3, float **a4)
{
  unint64_t v8;
  unsigned int v9;
  int v10;
  float *v11[3];
  float v12;
  float __B;
  float __A;
  float *__C[3];

  v8 = (2 * a3) | 1;
  LODWORD(v11[0]) = 0;
  std::vector<float>::vector(__C, v8, v11);
  __A = (float)a3;
  __B = -(float)a3;
  vDSP_vgen(&__A, &__B, __C[0], 1, v8);
  v12 = 0.0;
  vDSP_svesq(__C[0], 1, &v12, v8);
  vDSP_vsdiv(__C[0], 1, &v12, __C[0], 1, v8);
  v9 = 2 * a3 + a2;
  v10 = 0;
  std::vector<float>::vector(v11, 2 * a3 + v9, &v10);
  vDSP_vclr(v11[0], 1, a3);
  vDSP_vclr(&v11[0][v9 - 1], -1, a3);
  vDSP_mmov(a1, &v11[0][a3], a2, 1uLL, a2, a2);
  std::vector<float>::resize((uint64_t)a4, v9);
  vDSP_conv(v11[0], 1, &__C[0][2 * a3], -1, *a4, 1, v9, v8);
  std::vector<float>::resize((uint64_t)a4, a2);
  if (v11[0])
  {
    v11[1] = v11[0];
    operator delete(v11[0]);
  }
  if (__C[0])
  {
    __C[1] = __C[0];
    operator delete(__C[0]);
  }
}

void sub_245804F64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    std::vector<float>::__append((char **)a1, a2 - v2);
  }
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_245805034(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

void sub_245805114(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::vector<float>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  int v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 2);
    if (v10 >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 2;
    v12 = v5 - v8;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

uint64_t findPeaks(float *a1, int a2, vDSP_Length *__I, float a4, unsigned int a5, int a6, const float *__C, float *a8, int *a9, unsigned int *a10)
{
  float v10;
  uint64_t v11;
  uint64_t v18;
  char v19;
  unsigned int v20;
  float v21;
  int v22;
  float *v23;
  float v24;
  float v25;
  float v26;
  vDSP_Length i;
  uint64_t v32;
  vDSP_Length v33;
  int v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  unsigned int v38;
  int *v39;
  unsigned int v40;
  uint64_t v41;
  int *v42;
  float *v43;
  int v44;
  int v45;
  uint64_t result;
  uint64_t j;
  uint64_t v48;
  int v49;
  float *v50;
  int v51;
  BOOL v52;
  float v53;
  float v54;
  float v55;
  int v56;
  float *v57;
  float v58;
  float v59;

  if (a6)
    v10 = -1.0;
  else
    v10 = 1.0;
  v11 = (a2 - 1);
  if (v11 < 2)
    goto LABEL_75;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0.0;
  v22 = -1;
  do
  {
    v23 = &a1[v18];
    v24 = v10 * v23[1];
    v25 = v10 * v23[2];
    if ((v19 & 1) != 0)
    {
      if (v24 == v25)
      {
        v19 = 1;
        goto LABEL_30;
      }
      if (v24 < v25)
        goto LABEL_28;
      v19 = 0;
      __C[v20] = v21;
      a9[v20] = v22;
    }
    else
    {
      v26 = v10 * a1[v18];
      if (v24 <= a4 || v24 <= v26 || v24 <= v25)
      {
        if (v24 > a4 && v24 > v26 && v24 == v25)
        {
          v22 = v18 + 1;
          v19 = 1;
          v21 = v10 * v23[1];
          goto LABEL_30;
        }
LABEL_28:
        v19 = 0;
        goto LABEL_30;
      }
      v19 = 0;
      __C[v20] = v24;
      a9[v20] = v18 + 1;
    }
    ++v20;
LABEL_30:
    ++v18;
  }
  while (v11 - 1 != v18);
  if (!v20)
  {
LABEL_75:
    *a10 = 0;
    return 0xFFFFFFFFLL;
  }
  for (i = 0; i != v20; ++i)
    __I[i] = i;
  vDSP_vsorti(__C, __I, 0, v20, -1);
  if (v20 != 1)
  {
    v32 = 0;
    do
    {
      v33 = __I[v32];
      v34 = a9[v33];
      if (v34)
      {
        if ((int)v33 >= 1)
        {
          v35 = __I[v32] + 1;
          do
          {
            v36 = (v35 - 2);
            v37 = a9[v36];
            if (v37)
            {
              if (v34 - v37 >= a5)
                break;
              a9[v36] = 0;
            }
            --v35;
          }
          while (v35 > 1);
        }
        v38 = v33 + 1;
        if (v38 < v20)
        {
          v39 = &a9[v38];
          do
          {
            if (*v39)
            {
              if (*v39 - v34 >= a5)
                break;
              *v39 = 0;
            }
            ++v39;
            ++v38;
          }
          while (v20 > v38);
        }
      }
      ++v32;
    }
    while (v32 != v20 - 1);
  }
  v40 = 0;
  if (v20 <= 1)
    v41 = 1;
  else
    v41 = v20;
  v42 = a9;
  v43 = (float *)__C;
  do
  {
    v45 = *v42++;
    v44 = v45;
    if (v45)
    {
      a9[v40] = v44;
      __C[v40++] = *v43;
    }
    ++v43;
    --v41;
  }
  while (v41);
  result = 0;
  *a10 = v40;
  if (a8 && v40)
  {
    for (j = 0; j != v40; ++j)
    {
      v48 = a9[j];
      v49 = v48 & ((int)v48 >> 31);
      v50 = &a1[v48];
      v51 = a9[j];
      while (1)
      {
        v52 = __OFSUB__(v51--, 1);
        if (v51 < 0 != v52)
          break;
        v53 = *v50;
        v54 = *--v50;
        if ((float)(v10 * v54) >= (float)(v10 * v53))
        {
          v49 = v51 + 1;
          break;
        }
      }
      v55 = v10 * a1[v49];
      if (v48 <= v11)
        v56 = v11;
      else
        v56 = a9[j];
      v57 = &a1[(int)v48 + 1];
      while (v11 > v48)
      {
        v58 = v10 * *v57;
        v59 = v10 * *(v57++ - 1);
        LODWORD(v48) = v48 + 1;
        if (v58 >= v59)
        {
          v56 = v48 - 1;
          break;
        }
      }
      if (v55 <= (float)(v10 * a1[v56]))
        v55 = v10 * a1[v56];
      a8[j] = -(float)(v55 - (float)(v10 * __C[j]));
    }
    return 0;
  }
  return result;
}

uint64_t Scandium::ScandiumPPG::scandium_signal_conditioning_t::scandium_signal_conditioning_t(uint64_t a1)
{
  *(_QWORD *)(a1 + 56) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  Scandium::ScandiumPPG::scandium_signal_conditioning_t::reset((Scandium::ScandiumPPG::scandium_signal_conditioning_t *)a1);
  return a1;
}

void sub_24580554C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;

  v2 = v1;
  v4 = (_QWORD *)(v2 + 32);
  v5 = *(_QWORD **)(v2 + 56);
  if (v5 == (_QWORD *)(v2 + 32))
  {
    v6 = 4;
    v5 = v4;
  }
  else
  {
    if (!v5)
      goto LABEL_6;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_DWORD *Scandium::ScandiumPPG::scandium_signal_conditioning_t::reset(Scandium::ScandiumPPG::scandium_signal_conditioning_t *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *result;

  v2 = *(_QWORD *)this;
  if (v2)
    iirSOS_setCoefs(v2, (uint64_t)&Scandium::ScandiumPPG::ac_lpf);
  else
    *(_QWORD *)this = iirSOS_new(2, (uint64_t)&Scandium::ScandiumPPG::ac_lpf);
  v3 = *((_QWORD *)this + 1);
  if (v3)
    iirSOS_setCoefs(v3, (uint64_t)&Scandium::ScandiumPPG::ac_hpf);
  else
    *((_QWORD *)this + 1) = iirSOS_new(2, (uint64_t)&Scandium::ScandiumPPG::ac_hpf);
  v4 = *((_QWORD *)this + 2);
  if (v4)
    iirSOS_setCoefs(v4, (uint64_t)&Scandium::ScandiumPPG::dc_lpf_section1);
  else
    *((_QWORD *)this + 2) = iirSOS_new(2, (uint64_t)&Scandium::ScandiumPPG::dc_lpf_section1);
  v5 = *((_QWORD *)this + 3);
  if (v5)
    return (_DWORD *)iirSOS_setCoefs(v5, (uint64_t)&Scandium::ScandiumPPG::dc_lpf_section2);
  result = iirSOS_new(2, (uint64_t)&Scandium::ScandiumPPG::dc_lpf_section2);
  *((_QWORD *)this + 3) = result;
  return result;
}

void Scandium::ScandiumPPG::scandium_signal_conditioning_t::~scandium_signal_conditioning_t(void ***this)
{
  Scandium::ScandiumPPG::scandium_signal_conditioning_t *v2;
  uint64_t v3;

  iirSOS_delete(*this);
  iirSOS_delete(this[1]);
  iirSOS_delete(this[2]);
  iirSOS_delete(this[3]);
  v2 = (Scandium::ScandiumPPG::scandium_signal_conditioning_t *)this[7];
  if (v2 == (Scandium::ScandiumPPG::scandium_signal_conditioning_t *)(this + 4))
  {
    v3 = 4;
    v2 = (Scandium::ScandiumPPG::scandium_signal_conditioning_t *)(this + 4);
  }
  else
  {
    if (!v2)
      return;
    v3 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
}

uint64_t Scandium::ScandiumPPG::scandium_signal_conditioning_t::process(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  const void *v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  float v12;
  uint64_t v13;
  float *v14;
  unint64_t v15;
  float *v16;
  float *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  float *v23;
  int v24;
  void *__p;
  _BYTE *v27;
  uint64_t v28;
  void *v29;
  _BYTE *v30;
  uint64_t v31;
  void *v32;
  _BYTE *v33;
  uint64_t v34;

  v6 = *(const void **)(a2 + 8);
  v7 = *(unsigned int *)(a2 + 16);
  v33 = 0;
  v34 = 0;
  v32 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v32, v6, (uint64_t)v6 + 4 * v7, v7);
  v29 = 0;
  v30 = 0;
  v31 = 0;
  __p = 0;
  v27 = 0;
  v28 = 0;
  if (*(_QWORD *)(a2 + 8))
  {
    **(float **)a3 = stats::mean((stats *)v32, (const float *)((unint64_t)(v33 - (_BYTE *)v32) >> 2)) / 1000000.0;
    v8 = Scandium::ScandiumPPG::scandium_signal_conditioning_t::compute_ac(a1, (uint64_t)&v32, (float **)&v29)
      || Scandium::ScandiumPPG::scandium_signal_conditioning_t::compute_dc((uint64_t)a1, (uint64_t)&v32, (uint64_t)&__p);
    v9 = v29;
    if (v30 - (_BYTE *)v29 != v27 - (_BYTE *)__p)
      __assert_rtn("process", "scandium_signal_conditioning.cpp", 133, "ac_out.size() == dc_out.size()");
    if (!(_DWORD)v8)
    {
      v10 = *(_QWORD *)(a3 + 8);
      *(_QWORD *)(v10 + 8) = *(_QWORD *)v10;
      std::vector<float>::reserve((void **)v10, (v30 - v9) >> 2);
      v9 = v30;
      if (v30 != v29)
      {
        v11 = 0;
        v9 = v29;
        do
        {
          if (v11 >= (v27 - (_BYTE *)__p) >> 2)
            std::vector<float>::__throw_out_of_range[abi:ne180100]();
          v12 = (float)(*(float *)&v9[4 * v11] * -100.0) / *((float *)__p + v11);
          v13 = *(_QWORD *)(a3 + 8);
          v14 = *(float **)(v13 + 8);
          v15 = *(_QWORD *)(v13 + 16);
          if ((unint64_t)v14 >= v15)
          {
            v17 = *(float **)v13;
            v18 = ((uint64_t)v14 - *(_QWORD *)v13) >> 2;
            v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 62)
              std::vector<float>::__throw_length_error[abi:ne180100]();
            v20 = v15 - (_QWORD)v17;
            if (v20 >> 1 > v19)
              v19 = v20 >> 1;
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL)
              v21 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v21 = v19;
            if (v21)
            {
              v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v13 + 16, v21);
              v17 = *(float **)v13;
              v14 = *(float **)(v13 + 8);
            }
            else
            {
              v22 = 0;
            }
            v23 = (float *)&v22[4 * v18];
            *v23 = v12;
            v16 = v23 + 1;
            while (v14 != v17)
            {
              v24 = *((_DWORD *)v14-- - 1);
              *((_DWORD *)v23-- - 1) = v24;
            }
            *(_QWORD *)v13 = v23;
            *(_QWORD *)(v13 + 8) = v16;
            *(_QWORD *)(v13 + 16) = &v22[4 * v21];
            if (v17)
              operator delete(v17);
          }
          else
          {
            *v14 = v12;
            v16 = v14 + 1;
          }
          *(_QWORD *)(v13 + 8) = v16;
          ++v11;
          v9 = v29;
        }
        while (v11 < (v30 - (_BYTE *)v29) >> 2);
      }
    }
    if (__p)
    {
      v27 = __p;
      operator delete(__p);
      v9 = v29;
    }
    if (v9)
    {
      v30 = v9;
      operator delete(v9);
    }
  }
  else
  {
    v8 = 4;
  }
  if (v32)
  {
    v33 = v32;
    operator delete(v32);
  }
  return v8;
}

void sub_245805964(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  if (a16)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

BOOL Scandium::ScandiumPPG::scandium_signal_conditioning_t::compute_ac(uint64_t *a1, uint64_t a2, float **a3)
{
  uint64_t v6;
  float *v7;
  float *v8;
  float v9;
  _BOOL8 v10;
  float *v12;
  float *v13;
  float v14;
  int v15;
  void *__p;
  float *v17;
  uint64_t v18;
  void *__dst;
  float *v20;
  uint64_t v21;

  __dst = 0;
  v20 = 0;
  v21 = 0;
  __p = 0;
  v17 = 0;
  v18 = 0;
  std::vector<float>::resize((uint64_t)a3, (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  std::vector<float>::resize((uint64_t)&__dst, (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  std::vector<float>::resize((uint64_t)&__p, (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  v6 = *(_QWORD *)(a2 + 8);
  if (v6 != *(_QWORD *)a2)
    memmove(__dst, *(const void **)a2, v6 - *(_QWORD *)a2);
  v7 = (float *)__dst;
  v8 = v20;
  if (__dst != v20)
  {
    v9 = *(float *)__dst;
    do
    {
      *v7 = *v7 - v9;
      ++v7;
    }
    while (v7 != v8);
  }
  if (iirSOS_init(*a1)
    || iirSOS_process(*a1, (float *)__dst, (float *)__p, (*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2))
  {
    v10 = 1;
  }
  else
  {
    v12 = (float *)__p;
    v13 = v17;
    if (__p != v17)
    {
      v14 = *(float *)__p;
      do
      {
        *v12 = *v12 - v14;
        ++v12;
      }
      while (v12 != v13);
    }
    v15 = iirSOS_init(a1[1]);
    if (!v15)
      v15 = iirSOS_process(a1[1], (float *)__p, *a3, (*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
    v10 = v15 != 0;
  }
  if (__p)
  {
    v17 = (float *)__p;
    operator delete(__p);
  }
  if (__dst)
  {
    v20 = (float *)__dst;
    operator delete(__dst);
  }
  return v10;
}

void sub_245805B0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

BOOL Scandium::ScandiumPPG::scandium_signal_conditioning_t::compute_dc(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  float *v7;
  float *v8;
  float v9;
  int v10;
  float *v11;
  float *v12;
  _BOOL8 v13;
  int v15;
  float *v16;
  float *v17;
  void *__p;
  float *v19;
  uint64_t v20;
  void *__dst;
  float *v22;
  uint64_t v23;

  __dst = 0;
  v22 = 0;
  v23 = 0;
  __p = 0;
  v19 = 0;
  v20 = 0;
  std::vector<float>::resize(a3, (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  std::vector<float>::resize((uint64_t)&__dst, (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  std::vector<float>::resize((uint64_t)&__p, (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  v6 = *(_QWORD *)(a2 + 8);
  if (v6 != *(_QWORD *)a2)
    memmove(__dst, *(const void **)a2, v6 - *(_QWORD *)a2);
  v7 = (float *)__dst;
  v8 = v22;
  v9 = *(float *)__dst;
  while (v7 != v8)
  {
    *v7 = *v7 - v9;
    ++v7;
  }
  v10 = iirSOS_init(*(_QWORD *)(a1 + 16));
  if (!v10)
    v10 = iirSOS_process(*(_QWORD *)(a1 + 16), (float *)__dst, (float *)__p, (*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  v11 = (float *)__p;
  v12 = v19;
  if (__p != v19)
  {
    do
    {
      *v11 = *v11 * 0.00000034061;
      ++v11;
    }
    while (v11 != v12);
  }
  if (v10)
  {
    v13 = 1;
  }
  else
  {
    v15 = iirSOS_init(*(_QWORD *)(a1 + 24));
    if (!v15)
      v15 = iirSOS_process(*(_QWORD *)(a1 + 24), (float *)__p, *(float **)a3, (*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
    v13 = v15 != 0;
    v16 = *(float **)a3;
    v17 = *(float **)(a3 + 8);
    while (v16 != v17)
    {
      *v16 = v9 + *v16;
      ++v16;
    }
  }
  if (__p)
  {
    v19 = (float *)__p;
    operator delete(__p);
  }
  if (__dst)
  {
    v22 = (float *)__dst;
    operator delete(__dst);
  }
  return v13;
}

void sub_245805CC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

void std::vector<float>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = &v6[4 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

_QWORD *std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_245805DDC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("vector");
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_25169CA78, MEMORY[0x24BEDAB00]);
}

void sub_245805E48(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

uint64_t Scandium::ScandiumPPG::get_blank_path_idx(Scandium::ScandiumPPG *this)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD v4[5];
  int v5;
  _OWORD v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5 = (int)this;
  v6[4] = xmmword_2458262D0;
  v6[5] = unk_2458262E0;
  v6[6] = xmmword_2458262F0;
  v6[7] = unk_245826300;
  v6[0] = xmmword_245826290;
  v6[1] = unk_2458262A0;
  v6[2] = xmmword_2458262B0;
  v6[3] = unk_2458262C0;
  std::unordered_map<int,int>::unordered_map((uint64_t)v4, (int *)v6, 16);
  if (std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(v4, &v5))
  {
    v1 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(v4, &v5);
    if (!v1)
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    v2 = *((unsigned int *)v1 + 5);
  }
  else
  {
    v2 = 0xFFFFFFFFLL;
  }
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v4);
  return v2;
}

void sub_245805F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t Scandium::ScandiumPPG::scandium_calibration_t::process(float a1, float a2, uint64_t a3, int a4, int a5, float *a6)
{
  uint64_t coeff;
  void *__p[3];

  coeff = Scandium::ScandiumPPG::scandium_calibration_t::get_coeff(Scandium::ScandiumPPG::path_array[4 * a4 + a5], __p);
  Scandium::ScandiumPPG::scandium_calibration_t::compute_calibration_coeffs(a1, a2, coeff, (float **)__p, a6);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return 0;
}

uint64_t Scandium::ScandiumPPG::scandium_calibration_t::get_coeff@<X0>(unsigned __int8 a1@<W1>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t i;
  void *v7;
  uint64_t **v8;
  _QWORD v10[5];
  unsigned __int8 v11;
  unsigned __int8 v12[8];
  _QWORD v13[3];
  char v14;
  _QWORD v15[3];
  char v16;
  uint64_t v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  v3 = operator new(0x48uLL);
  v3[8] = 0;
  *(_OWORD *)v3 = xmmword_245826310;
  *((_OWORD *)v3 + 1) = unk_245826320;
  *((_OWORD *)v3 + 2) = xmmword_245826330;
  *((_OWORD *)v3 + 3) = *(_OWORD *)"j;g?";
  v12[0] = 0;
  memset(v13, 0, sizeof(v13));
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v13, v3, (uint64_t)(v3 + 9), 0x12uLL);
  v4 = operator new(0x48uLL);
  v4[8] = 0;
  *(_OWORD *)v4 = xmmword_245826358;
  *((_OWORD *)v4 + 1) = unk_245826368;
  *((_OWORD *)v4 + 2) = xmmword_245826378;
  *((_OWORD *)v4 + 3) = unk_245826388;
  v14 = 1;
  memset(v15, 0, sizeof(v15));
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v15, v4, (uint64_t)(v4 + 9), 0x12uLL);
  v5 = operator new(0x48uLL);
  v5[8] = 0;
  *(_OWORD *)v5 = xmmword_2458263A0;
  *((_OWORD *)v5 + 1) = *(_OWORD *)algn_2458263B0;
  *((_OWORD *)v5 + 2) = xmmword_2458263C0;
  *((_OWORD *)v5 + 3) = unk_2458263D0;
  v16 = 2;
  v18[0] = 0;
  v18[1] = 0;
  v17 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v17, v5, (uint64_t)(v5 + 9), 0x12uLL);
  std::unordered_map<Scandium::ScandiumPPG::PathType,std::vector<float>>::unordered_map((uint64_t)v10, v12, 3);
  for (i = 0; i != -12; i -= 4)
  {
    v7 = (void *)v18[i - 1];
    if (v7)
    {
      v18[i] = v7;
      operator delete(v7);
    }
  }
  operator delete(v5);
  operator delete(v4);
  operator delete(v3);
  v8 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>(v10, &v11);
  if (!v8)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(a2, v8[3], (uint64_t)v8[4], ((char *)v8[4] - (char *)v8[3]) >> 2);
  return std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::~__hash_table((uint64_t)v10);
}

void sub_2458061DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  void *v22;

  v21 = 0;
  while (1)
  {
    v22 = *(void **)(v19 + v21 + 72);
    if (v22)
    {
      *(_QWORD *)(v19 + v21 + 80) = v22;
      operator delete(v22);
    }
    v21 -= 32;
    if (v21 == -96)
    {
      operator delete(v18);
      operator delete(v17);
      operator delete(v16);
      _Unwind_Resume(a1);
    }
  }
}

uint64_t Scandium::ScandiumPPG::scandium_calibration_t::compute_calibration_coeffs(float a1, float a2, uint64_t a3, float **a4, float *a5)
{
  float v5;
  float v6;
  float *v7;

  v5 = (float)(a2 / 850.0) + -1.0;
  v6 = (float)(a1 / 660.0) + -1.0;
  v7 = *a4;
  *a5 = (float)((float)((float)((float)(**a4 + (float)((*a4)[1] * v6)) + (float)((*a4)[2] * (float)(v6 * v6)))
                      + (float)((*a4)[3] * v5))
              + (float)((*a4)[4] * (float)(v5 * v5)))
      + (float)((float)(v6 * (*a4)[5]) * v5);
  a5[1] = (float)((float)((float)((float)(v7[6] + (float)(v7[7] * v6)) + (float)(v7[8] * (float)(v6 * v6)))
                        + (float)(v7[9] * v5))
                + (float)(v7[10] * (float)(v5 * v5)))
        + (float)((float)(v6 * v7[11]) * v5);
  a5[2] = (float)((float)((float)((float)(v7[12] + (float)(v7[13] * v6)) + (float)(v7[14] * (float)(v6 * v6)))
                        + (float)(v7[15] * v5))
                + (float)(v7[16] * (float)(v5 * v5)))
        + (float)((float)(v6 * v7[17]) * v5);
  return 0;
}

_QWORD *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2458063AC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::unordered_map<int,int>::unordered_map(uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 8 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int const,int> const&>(a1, a2, a2);
      a2 += 2;
      v5 -= 8;
    }
    while (v5);
  }
  return a1;
}

void sub_245806428(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int const,int> const&>(uint64_t a1, int *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v7 <= v6)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x18uLL);
  *v10 = 0;
  v10[1] = v6;
  v10[2] = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *v10 = *v19;
LABEL_38:
    *v19 = v10;
    goto LABEL_39;
  }
  *v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    v20 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_245806640(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(_QWORD *a1, int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

uint64_t std::unordered_map<Scandium::ScandiumPPG::PathType,std::vector<float>>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::pair<Scandium::ScandiumPPG::PathType const,std::vector<float>> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_245806768(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::pair<Scandium::ScandiumPPG::PathType const,std::vector<float>> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  uint64_t ***v8;
  uint64_t **result;
  unint64_t v10;
  float v11;
  float v12;
  _BOOL8 v13;
  unint64_t v14;
  unint64_t v15;
  size_t v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD v19[3];

  v5 = *a2;
  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
  {
    v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 <= v5)
        v3 = v5 % v6;
    }
    else
    {
      v3 = ((_DWORD)v6 - 1) & v5;
    }
    v8 = *(uint64_t ****)(*(_QWORD *)a1 + 8 * v3);
    if (v8)
    {
      for (result = *v8; result; result = (uint64_t **)*result)
      {
        v10 = (unint64_t)result[1];
        if (v10 == v5)
        {
          if (*((unsigned __int8 *)result + 16) == (_DWORD)v5)
            return result;
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v10 >= v6)
              v10 %= v6;
          }
          else
          {
            v10 &= v6 - 1;
          }
          if (v10 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::__construct_node_hash<std::pair<Scandium::ScandiumPPG::PathType const,std::vector<float>> const&>(a1, *a2, a3, (uint64_t)v19);
  v11 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    v13 = 1;
    if (v6 >= 3)
      v13 = (v6 & (v6 - 1)) != 0;
    v14 = v13 | (2 * v6);
    v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15)
      v16 = v15;
    else
      v16 = v14;
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v16);
    v6 = *(_QWORD *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5)
        v3 = v5 % v6;
      else
        v3 = v5;
    }
    else
    {
      v3 = ((_DWORD)v6 - 1) & v5;
    }
  }
  v17 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v17)
  {
    *(_QWORD *)v19[0] = *v17;
    *v17 = v19[0];
  }
  else
  {
    *(_QWORD *)v19[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v19[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v19[0])
    {
      v18 = *(_QWORD *)(*(_QWORD *)v19[0] + 8);
      if ((v6 & (v6 - 1)) != 0)
      {
        if (v18 >= v6)
          v18 %= v6;
      }
      else
      {
        v18 &= v6 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v18) = v19[0];
    }
  }
  result = (uint64_t **)v19[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_245806990(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::__construct_node_hash<std::pair<Scandium::ScandiumPPG::PathType const,std::vector<float>> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *result;

  v7 = a1 + 16;
  v8 = operator new(0x30uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  *((_BYTE *)v8 + 16) = *(_BYTE *)a3;
  v8[4] = 0;
  v8[5] = 0;
  v8[3] = 0;
  result = std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v8 + 3, *(const void **)(a3 + 8), *(_QWORD *)(a3 + 16), (uint64_t)(*(_QWORD *)(a3 + 16) - *(_QWORD *)(a3 + 8)) >> 2);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_245806A34(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,void *>>>::operator()[abi:ne180100](uint64_t a1, _QWORD *__p)
{
  void *v3;

  if (*(_BYTE *)(a1 + 8))
  {
    v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::__deallocate_node(int a1, _QWORD *__p)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (_QWORD *)*v2;
      v4 = (void *)v2[3];
      if (v4)
      {
        v2[4] = v4;
        operator delete(v4);
      }
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t Scandium::find_optical_gen(unsigned __int8 **a1)
{
  uint64_t v2;
  int v3;
  unsigned __int8 *v4;
  int64_t v5;
  unsigned __int8 *v6;
  __int128 *v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  int64_t v11;
  int v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  uint64_t v22;
  void *__p[2];
  uint64_t v24;
  void *v25[2];
  uint64_t v26;
  void *v27[2];
  uint64_t v28;
  void *v29[2];
  uint64_t v30;
  void *v31[2];
  uint64_t v32;
  void *v33[2];
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  void *v37[2];
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  void *v41[2];
  uint64_t v42;
  void *v43[2];
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  _DWORD v47[2];
  __int128 v48;
  uint64_t v49;
  int v50;
  __int128 v51;
  uint64_t v52;
  int v53;
  __int128 v54;
  uint64_t v55;
  int v56;
  __int128 v57;
  uint64_t v58;
  int v59;
  __int128 v60;
  uint64_t v61;
  int v62;
  __int128 v63;
  uint64_t v64;
  int v65;
  __int128 v66;
  uint64_t v67;
  int v68;
  __int128 v69;
  uint64_t v70;
  int v71;
  __int128 v72;
  uint64_t v73;
  int v74;
  __int128 v75;
  uint64_t v76;
  int v77;
  __int128 v78;
  uint64_t v79;
  int v80;

  std::string::basic_string[abi:ne180100]<0>(v43, "N157");
  v45 = *(_OWORD *)v43;
  v46 = v44;
  v44 = 0;
  *(_OWORD *)v43 = 0uLL;
  v47[0] = 1;
  std::string::basic_string[abi:ne180100]<0>(v41, "N158");
  v48 = *(_OWORD *)v41;
  v49 = v42;
  v41[1] = 0;
  v42 = 0;
  v41[0] = 0;
  v50 = 1;
  std::string::basic_string[abi:ne180100]<0>(&v39, "N187");
  v51 = v39;
  v52 = v40;
  v40 = 0;
  v39 = 0uLL;
  v53 = 1;
  std::string::basic_string[abi:ne180100]<0>(v37, "N188");
  v54 = *(_OWORD *)v37;
  v55 = v38;
  v37[1] = 0;
  v38 = 0;
  v37[0] = 0;
  v56 = 1;
  std::string::basic_string[abi:ne180100]<0>(&v35, "N197");
  v57 = v35;
  v58 = v36;
  v36 = 0;
  v35 = 0uLL;
  v59 = 1;
  std::string::basic_string[abi:ne180100]<0>(v33, "N198");
  v60 = *(_OWORD *)v33;
  v61 = v34;
  v33[1] = 0;
  v34 = 0;
  v33[0] = 0;
  v62 = 1;
  std::string::basic_string[abi:ne180100]<0>(v31, "N199");
  v63 = *(_OWORD *)v31;
  v64 = v32;
  v31[1] = 0;
  v32 = 0;
  v31[0] = 0;
  v65 = 1;
  std::string::basic_string[abi:ne180100]<0>(v29, "N207");
  v66 = *(_OWORD *)v29;
  v67 = v30;
  v29[1] = 0;
  v30 = 0;
  v29[0] = 0;
  v68 = 2;
  std::string::basic_string[abi:ne180100]<0>(v27, "N208");
  v69 = *(_OWORD *)v27;
  v70 = v28;
  v27[1] = 0;
  v28 = 0;
  v27[0] = 0;
  v71 = 2;
  std::string::basic_string[abi:ne180100]<0>(v25, "N210");
  v72 = *(_OWORD *)v25;
  v73 = v26;
  v25[1] = 0;
  v26 = 0;
  v25[0] = 0;
  v74 = 2;
  std::string::basic_string[abi:ne180100]<0>(__p, "N217");
  v75 = *(_OWORD *)__p;
  v76 = v24;
  __p[1] = 0;
  v24 = 0;
  __p[0] = 0;
  v77 = 3;
  std::string::basic_string[abi:ne180100]<0>(&v21, "N218");
  v78 = v21;
  v79 = v22;
  v80 = 3;
  if (SHIBYTE(v24) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v26) < 0)
    operator delete(v25[0]);
  if (SHIBYTE(v28) < 0)
    operator delete(v27[0]);
  if (SHIBYTE(v30) < 0)
    operator delete(v29[0]);
  if (SHIBYTE(v32) < 0)
    operator delete(v31[0]);
  if (SHIBYTE(v34) < 0)
    operator delete(v33[0]);
  if (SHIBYTE(v36) < 0)
    operator delete((void *)v35);
  if (SHIBYTE(v38) < 0)
    operator delete(v37[0]);
  if (SHIBYTE(v40) < 0)
    operator delete((void *)v39);
  if (SHIBYTE(v42) < 0)
    operator delete(v41[0]);
  if (SHIBYTE(v44) < 0)
    operator delete(v43[0]);
  v2 = 0;
  v3 = *((char *)a1 + 23);
  if (v3 >= 0)
    v4 = (unsigned __int8 *)a1;
  else
    v4 = *a1;
  if (v3 >= 0)
    v5 = *((unsigned __int8 *)a1 + 23);
  else
    v5 = (int64_t)a1[1];
  v6 = &v4[v5];
  while (1)
  {
    v7 = &v45 + 2 * v2;
    v8 = *((unsigned __int8 *)v7 + 23);
    v9 = *((_QWORD *)v7 + 1);
    if ((v8 & 0x80u) == 0)
      v10 = (char *)(&v45 + 2 * v2);
    else
      v10 = *(char **)v7;
    if ((v8 & 0x80u) == 0)
      v11 = *((unsigned __int8 *)v7 + 23);
    else
      v11 = *((_QWORD *)v7 + 1);
    if (v11)
    {
      if (v5 >= v11)
      {
        v12 = *v10;
        v13 = v5;
        v14 = v4;
        while (1)
        {
          v15 = v13 - v11;
          if (v15 == -1)
            break;
          v16 = (unsigned __int8 *)memchr(v14, v12, v15 + 1);
          if (!v16)
            break;
          v17 = v16;
          if (!memcmp(v16, v10, v11))
          {
            if (v17 == v6 || v17 != v4)
              goto LABEL_52;
            goto LABEL_46;
          }
          v14 = v17 + 1;
          v13 = v6 - (v17 + 1);
          if (v13 < v11)
            goto LABEL_52;
        }
      }
      goto LABEL_52;
    }
LABEL_46:
    if ((v8 & 0x80) != 0)
    {
      v8 = v9;
      if (v5 == v9)
        break;
    }
    else if (v5 == v8)
    {
      break;
    }
    if (v5 <= v8)
      std::string::__throw_out_of_range[abi:ne180100]();
    if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v4[v8] + 60) & 0x400) == 0)
      break;
LABEL_52:
    if (++v2 == 12)
    {
      v18 = 0;
      goto LABEL_55;
    }
  }
  v18 = v47[8 * v2];
LABEL_55:
  v19 = 48;
  do
  {
    if (SHIBYTE(v43[v19 + 1]) < 0)
      operator delete(v43[v19 - 1]);
    v19 -= 4;
  }
  while (v19 * 8);
  return v18;
}

void sub_245806FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49,void *a50,uint64_t a51,int a52,__int16 a53,char a54,char a55,void *a56,uint64_t a57,int a58,__int16 a59,char a60,char a61,void *a62,uint64_t a63)
{
  char a67;
  void *a68;
  char a72;
  void *a73;
  char a74;
  char a75;
  char *v75;

  if (a19 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  if (a31 < 0)
    operator delete(a26);
  if (a37 < 0)
    operator delete(a32);
  if (a43 < 0)
    operator delete(a38);
  if (a49 < 0)
    operator delete(a44);
  if (a55 < 0)
    operator delete(a50);
  if (a61 < 0)
    operator delete(a56);
  if (a67 < 0)
    operator delete(a62);
  if (a72 < 0)
    operator delete(a68);
  if (a74 < 0)
    operator delete(a73);
  for (; v75 != &a75; v75 -= 32)
  {
    if (*(v75 - 9) < 0)
      operator delete(*((void **)v75 - 4));
  }
  _Unwind_Resume(a1);
}

uint64_t Scandium::convert_legacy_start_pkt@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v4;
  char *v5;

  *(_DWORD *)(a2 + 111) = 0;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  v2 = *(unsigned int *)(a1 + 116);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = &v4;
  return ((uint64_t (*)(char **, uint64_t))off_25169D2F8[v2])(&v5, a1);
}

float *Scandium::fill_valid(float *this, float *a2, float a3)
{
  if ((LODWORD(a3) & 0x7FFFFFFFu) <= 0x7F7FFFFF)
    *this = a3;
  return this;
}

uint64_t Scandium::flag_to_abort_reason(uint64_t result, _QWORD *a2)
{
  if ((result & 0x80) != 0)
  {
    *a2 |= 0x400uLL;
    if ((result & 0x800) == 0)
    {
LABEL_3:
      if ((result & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((result & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *a2 |= 0x200uLL;
  if ((result & 0x20) == 0)
  {
LABEL_4:
    if ((result & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *a2 |= 2uLL;
  if ((result & 0x40) == 0)
  {
LABEL_5:
    if ((result & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *a2 |= 4uLL;
  if ((result & 0x2000) == 0)
  {
LABEL_6:
    if ((result & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *a2 |= 4uLL;
  if ((result & 0x100) == 0)
  {
LABEL_7:
    if ((result & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *a2 |= 1uLL;
  if ((result & 0x200) == 0)
  {
LABEL_8:
    if ((result & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *a2 |= 0x40uLL;
  if ((result & 0x400) == 0)
  {
LABEL_9:
    if ((result & 0x80000000) == 0)
      return result;
LABEL_19:
    *a2 |= 0x100uLL;
    return result;
  }
LABEL_18:
  *a2 |= 0x80uLL;
  if ((result & 0x80000000) != 0)
    goto LABEL_19;
  return result;
}

float Scandium::sort_median(Scandium *this, const float *a2)
{
  Scandium *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  float *v6;
  float v7;
  float *v8;
  float *v9;
  unint64_t v10;
  unint64_t v11;
  float *v12;
  float v13;
  float *v14;
  float v15;
  unint64_t v16;
  float *v17;
  void *__p;
  float *v20;
  uint64_t v21;
  void **p_p;

  if ((int)a2 <= 0)
    Scandium::sort_median();
  v2 = this;
  if (!this)
    Scandium::sort_median();
  v3 = (char)a2;
  __p = 0;
  v20 = 0;
  v4 = a2;
  v21 = 0;
  std::vector<float>::reserve(&__p, a2);
  p_p = &__p;
  v5 = 4 * v4;
  do
  {
    if ((*(_DWORD *)v2 & 0x7FFFFFFFu) <= 0x7F7FFFFF)
      std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100]((uint64_t *)&p_p, v2);
    v2 = (Scandium *)((char *)v2 + 4);
    v5 -= 4;
  }
  while (v5);
  v6 = (float *)__p;
  if (v20 == __p)
  {
    v15 = NAN;
    if (!__p)
      return v15;
    goto LABEL_20;
  }
  std::__sort<std::__less<float,float> &,float *>();
  v8 = (float *)__p;
  v9 = v20;
  v10 = ((char *)v20 - (_BYTE *)__p) >> 2;
  if ((v3 & 1) != 0)
  {
    v16 = (2 * v10 - 2) & 0xFFFFFFFFFFFFFFFCLL;
    v17 = (float *)((char *)__p + v16);
    if ((char *)__p + v16 != (char *)v20)
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)((char *)__p + v16), v20, v7);
    v15 = *v17;
  }
  else
  {
    v11 = v10 >> 1;
    v12 = (float *)((char *)__p + 4 * v11 - 4);
    if (v12 != v20)
    {
      v7 = std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)__p + v11 - 1, v20, v7);
      v8 = (float *)__p;
      v9 = v20;
      v11 = (unint64_t)(((char *)v20 - (_BYTE *)__p) >> 2) >> 1;
    }
    v13 = *v12;
    v14 = &v8[v11];
    if (v14 != v9)
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(v8, &v8[v11], v9, v7);
    v15 = (float)(v13 + *v14) * 0.5;
  }
  v6 = (float *)__p;
  if (__p)
  {
LABEL_20:
    v20 = v6;
    operator delete(v6);
  }
  return v15;
}

void sub_2458073B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("basic_string");
}

__n128 std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<overloaded<Scandium::convert_legacy_start_pkt(std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&)::$_0,Scandium::convert_legacy_start_pkt(std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&)::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&>@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  __n128 result;

  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_QWORD *)(a2 + 7) = *(_QWORD *)(a1 + 7);
  *(_DWORD *)(a2 + 110) = *(_DWORD *)(a1 + 107);
  *(_BYTE *)(a2 + 114) = *(_BYTE *)(a1 + 111);
  *(_DWORD *)(a2 + 15) = *(_DWORD *)(a1 + 15);
  *(_QWORD *)(a2 + 19) = *(_QWORD *)(a1 + 19);
  *(_OWORD *)(a2 + 27) = *(_OWORD *)(a1 + 27);
  *(_OWORD *)(a2 + 43) = *(_OWORD *)(a1 + 43);
  *(_OWORD *)(a2 + 59) = *(_OWORD *)(a1 + 59);
  *(_OWORD *)(a2 + 75) = *(_OWORD *)(a1 + 75);
  result = *(__n128 *)(a1 + 91);
  *(__n128 *)(a2 + 91) = result;
  *(_BYTE *)(a2 + 107) = -1;
  *(_WORD *)(a2 + 108) = -1;
  return result;
}

__n128 std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<overloaded<Scandium::convert_legacy_start_pkt(std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&)::$_0,Scandium::convert_legacy_start_pkt(std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&)::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&>@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;

  v2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v2;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_DWORD *)(a2 + 111) = *(_DWORD *)(a1 + 111);
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  result = *(__n128 *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 48);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v5;
  return result;
}

uint64_t *std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100](uint64_t *a1, _DWORD *a2)
{
  uint64_t v4;
  _DWORD *v5;
  _QWORD *v6;
  _DWORD *v7;
  _DWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;

  v4 = *a1;
  v5 = *(_DWORD **)(*a1 + 8);
  v6 = (_QWORD *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    v8 = *(_DWORD **)v4;
    v9 = ((uint64_t)v5 - *(_QWORD *)v4) >> 2;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v11 = *v6 - (_QWORD)v8;
    if (v11 >> 1 > v10)
      v10 = v11 >> 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
      v12 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v6, v12);
      v8 = *(_DWORD **)v4;
      v5 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[4 * v9];
    v15 = &v13[4 * v12];
    *(_DWORD *)v14 = *a2;
    v7 = v14 + 4;
    while (v5 != v8)
    {
      v16 = *--v5;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *(_QWORD *)v4 = v14;
    *(_QWORD *)(v4 + 8) = v7;
    *(_QWORD *)(v4 + 16) = v15;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *v5 = *a2;
    v7 = v5 + 1;
  }
  *(_QWORD *)(v4 + 8) = v7;
  return a1;
}

float std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(float *a1, float *a2, float *a3, float result)
{
  float *v4;
  unint64_t v7;
  float *v8;
  float *v9;
  int v10;
  float *v11;
  float *v12;
  float *v13;
  float v14;
  float v15;
  float *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float *v21;
  float v22;
  float *v23;
  float v24;
  float v25;
  float v26;
  float *v27;
  float v28;
  float v29;
  float v30;

  if (a3 != a2)
  {
    v4 = a3;
    do
    {
      v7 = v4 - a1;
      if (v7 < 2)
        break;
      if (v7 == 3)
      {
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(a1, a1 + 1, v4 - 1);
        return result;
      }
      if (v7 == 2)
      {
        result = *(v4 - 1);
        v30 = *a1;
        if (result < *a1)
        {
          *a1 = result;
          *(v4 - 1) = v30;
        }
        return result;
      }
      if ((char *)v4 - (char *)a1 <= 31)
        return std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(a1, v4, result);
      v8 = &a1[v7 >> 1];
      v9 = v4 - 1;
      v10 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(a1, v8, v4 - 1);
      result = *a1;
      if (*a1 >= *v8)
      {
        v11 = v4 - 1;
        while (--v11 != a1)
        {
          if (*v11 < *v8)
          {
            *a1 = *v11;
            *v11 = result;
            ++v10;
            goto LABEL_13;
          }
        }
        v21 = a1 + 1;
        if (result >= *v9)
        {
          while (v21 != v9)
          {
            v22 = *v21;
            if (result < *v21)
            {
              *v21++ = *v9;
              *v9 = v22;
              goto LABEL_45;
            }
            ++v21;
          }
          return result;
        }
LABEL_45:
        if (v21 == v9)
          return result;
        while (1)
        {
          v25 = *a1;
          do
          {
            v26 = *v21++;
            result = v26;
          }
          while (v25 >= v26);
          v27 = v21 - 1;
          do
          {
            v28 = *--v9;
            v29 = v28;
          }
          while (v25 < v28);
          if (v27 >= v9)
            break;
          *v27 = v29;
          *v9 = result;
        }
        a1 = v21 - 1;
        if (v27 > a2)
          return result;
      }
      else
      {
        v11 = v4 - 1;
LABEL_13:
        v12 = a1 + 1;
        if (a1 + 1 >= v11)
        {
          v16 = a1 + 1;
        }
        else
        {
          v13 = a1 + 1;
          while (1)
          {
            v14 = *v8;
            do
            {
              v15 = *v13++;
              result = v15;
            }
            while (v15 < v14);
            v16 = v13 - 1;
            do
            {
              v17 = *--v11;
              v18 = v17;
            }
            while (v17 >= v14);
            if (v16 >= v11)
              break;
            *v16 = v18;
            *v11 = result;
            ++v10;
            if (v16 == v8)
              v8 = v11;
          }
        }
        if (v16 != v8)
        {
          result = *v8;
          v19 = *v16;
          if (*v8 < *v16)
          {
            *v16 = result;
            *v8 = v19;
            ++v10;
          }
        }
        if (v16 == a2)
          return result;
        if (!v10)
        {
          if (v16 <= a2)
          {
            v23 = v16 + 1;
            while (v23 != v4)
            {
              v24 = *(v23 - 1);
              result = *v23++;
              if (result < v24)
                goto LABEL_29;
            }
          }
          else
          {
            while (v12 != v16)
            {
              v20 = *(v12 - 1);
              result = *v12++;
              if (result < v20)
                goto LABEL_29;
            }
          }
          return result;
        }
LABEL_29:
        if (v16 <= a2)
          a1 = v16 + 1;
        else
          v4 = v16;
      }
    }
    while (v4 != a2);
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(float *a1, float *a2, float *a3)
{
  float v3;
  float v4;
  float v5;
  float v6;

  v3 = *a2;
  v4 = *a1;
  v5 = *a3;
  if (*a2 < *a1)
  {
    if (v5 < v3)
    {
      *a1 = v5;
      *a3 = v4;
      return 1;
    }
    *a1 = v3;
    *a2 = v4;
    if (*a3 >= v4)
      return 1;
    *a2 = *a3;
    *a3 = v4;
    return 2;
  }
  if (v5 < v3)
  {
    *a2 = v5;
    *a3 = v3;
    v6 = *a1;
    if (*a2 >= *a1)
      return 1;
    *a1 = *a2;
    *a2 = v6;
    return 2;
  }
  return 0;
}

float std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(float *a1, float *a2, float result)
{
  float *v3;
  float *v4;
  float *v5;
  float *v6;
  float v7;
  float v8;

  while (a1 != a2 - 1)
  {
    v3 = a1++;
    if (v3 != a2 && a1 != a2)
    {
      result = *v3;
      v4 = a1;
      v5 = v3;
      v6 = a1;
      do
      {
        v7 = *v6++;
        v8 = v7;
        if (v7 < result)
        {
          result = v8;
          v5 = v4;
        }
        v4 = v6;
      }
      while (v6 != a2);
      if (v5 != v3)
      {
        result = *v3;
        *v3 = *v5;
        *v5 = result;
      }
    }
  }
  return result;
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair(uint64_t a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor(a1 + 32);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[13],char const(&)[7],0>(uint64_t a1, char *a2, char *a3)
{
  _QWORD *v5;

  v5 = std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, a2);
  std::string::basic_string[abi:ne180100]<0>(v5 + 4, a3);
  *(_DWORD *)(a1 + 64) = 5;
  return a1;
}

void sub_245807A64(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 32);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))off_25169D308[v2])(&v4, a1);
  *(_DWORD *)(a1 + 32) = -1;
  return a1;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSU_1EJbixfdSD_SS_EEEEEEDcSW_DpT0_(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm6EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSU_1EJbixfdSD_SS_EEEEEEDcSW_DpT0_(uint64_t a1, uint64_t a2)
{
  return std::__variant_detail::__dtor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1>::~__dtor(a2);
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))off_25169D340[v2])(&v4, a1);
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSS_1EJSB_SD_SF_SH_SJ_SQ_EEEEEEDcSU_DpT0_(uint64_t a1, void **a2)
{
  if (*a2)
    operator delete(*a2);
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSS_1EJSB_SD_SF_SH_SJ_SQ_EEEEEEDcSU_DpT0_(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v2;
    operator delete(v2);
  }
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSS_1EJSB_SD_SF_SH_SJ_SQ_EEEEEEDcSU_DpT0_(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v2;
    operator delete(v2);
  }
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSS_1EJSB_SD_SF_SH_SJ_SQ_EEEEEEDcSU_DpT0_(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v2;
    operator delete(v2);
  }
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSS_1EJSB_SD_SF_SH_SJ_SQ_EEEEEEDcSU_DpT0_(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v2;
    operator delete(v2);
  }
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSS_1EJSB_SD_SF_SH_SJ_SQ_EEEEEEDcSU_DpT0_(uint64_t a1, void **a2)
{
  void **v2;

  v2 = a2;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

uint64_t std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x24953BE38);
}

uint64_t std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 72 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&>(a1, a2, (__int128 *)a2);
      a2 += 72;
      v5 -= 72;
    }
    while (v5);
  }
  return a1;
}

void sub_245807D94(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&>(uint64_t a1, unsigned __int8 *a2, __int128 *a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[3];

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__construct_node_hash<std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&>(a1, v9, a3, (uint64_t)v25);
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10)
          v23 %= v10;
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  v25[0] = 0;
  ++*v7;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v25, 0);
  return i;
}

void sub_245808010(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__construct_node_hash<std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *result;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x58uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  result = std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]((std::string *)(v8 + 16), a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_245808084(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

std::string *std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&this[1].__r_.__value_.__l.__size_, (uint64_t)(a2 + 2));
  return this;
}

void sub_245808640(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::__copy_constructor(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = 0;
  *(_DWORD *)(a1 + 32) = -1;
  std::__variant_detail::__ctor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1> const&>(a1, a2);
  return a1;
}

void sub_245808718(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__variant_detail::__ctor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1> const&>(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v3 = result;
  v4 = *(unsigned int *)(result + 32);
  if ((_DWORD)v4 != -1)
    result = ((uint64_t (*)(char *, uint64_t))off_25169D308[v4])(&v7, result);
  *(_DWORD *)(v3 + 32) = -1;
  v5 = *(unsigned int *)(a2 + 32);
  if ((_DWORD)v5 != -1)
  {
    result = ((uint64_t (*)(char *, uint64_t, uint64_t))off_25169D3C0[v5])(&v6, v3, a2);
    *(_DWORD *)(v3 + 32) = v5;
  }
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0ELm0EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  *a2 = *a3;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  *a2 = *a3;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  *a2 = *a3;
}

float _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(uint64_t a1, _DWORD *a2, float *a3)
{
  float result;

  result = *a3;
  *a2 = *(_DWORD *)a3;
  return result;
}

double _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(uint64_t a1, _QWORD *a2, double *a3)
{
  double result;

  result = *a3;
  *a2 = *(_QWORD *)a3;
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5ELm5EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(int a1, std::string *this, __int128 *a3)
{
  __int128 v3;

  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v3 = *a3;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm6ELm6EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1>::__copy_constructor(a2, a3);
}

uint64_t std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1>::__copy_constructor(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = 0;
  *(_DWORD *)(a1 + 24) = -1;
  std::__variant_detail::__ctor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1> const&>(a1, a2);
  return a1;
}

void sub_24580885C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__variant_detail::__dtor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1>::~__dtor(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__variant_detail::__ctor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1> const&>(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v3 = result;
  v4 = *(unsigned int *)(result + 24);
  if ((_DWORD)v4 != -1)
    result = ((uint64_t (*)(char *, uint64_t))off_25169D340[v4])(&v7, result);
  *(_DWORD *)(v3 + 24) = -1;
  v5 = *(unsigned int *)(a2 + 24);
  if ((_DWORD)v5 != -1)
  {
    result = ((uint64_t (*)(char *, uint64_t, uint64_t))off_25169D3F8[v5])(&v6, v3, a2);
    *(_DWORD *)(v3 + 24) = v5;
  }
  return result;
}

_QWORD *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0ELm0EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISR_LNS0_6_TraitE1EEEEEvRSS_OT_EUlRS10_OT0_E_JRNS0_6__baseILSV_1EJSB_SD_SF_SH_SJ_SQ_EEERKS18_EEEDcS10_DpT0_(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return std::vector<BOOL>::vector(a2, a3);
}

_QWORD *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISR_LNS0_6_TraitE1EEEEEvRSS_OT_EUlRS10_OT0_E_JRNS0_6__baseILSV_1EJSB_SD_SF_SH_SJ_SQ_EEERKS18_EEEDcS10_DpT0_(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(a2, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2);
}

_QWORD *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISR_LNS0_6_TraitE1EEEEEvRSS_OT_EUlRS10_OT0_E_JRNS0_6__baseILSV_1EJSB_SD_SF_SH_SJ_SQ_EEERKS18_EEEDcS10_DpT0_(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(a2, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3);
}

_QWORD *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISR_LNS0_6_TraitE1EEEEEvRSS_OT_EUlRS10_OT0_E_JRNS0_6__baseILSV_1EJSB_SD_SF_SH_SJ_SQ_EEERKS18_EEEDcS10_DpT0_(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(a2, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2);
}

_QWORD *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISR_LNS0_6_TraitE1EEEEEvRSS_OT_EUlRS10_OT0_E_JRNS0_6__baseILSV_1EJSB_SD_SF_SH_SJ_SQ_EEERKS18_EEEDcS10_DpT0_(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3);
}

std::string *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5ELm5EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISR_LNS0_6_TraitE1EEEEEvRSS_OT_EUlRS10_OT0_E_JRNS0_6__baseILSV_1EJSB_SD_SF_SH_SJ_SQ_EEERKS18_EEEDcS10_DpT0_(uint64_t a1, std::string *a2, __int128 **a3)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, *a3, a3[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a3[1] - (char *)*a3) >> 3));
}

_QWORD *std::vector<BOOL>::vector(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    std::vector<BOOL>::__vallocate[abi:ne180100](a1, v4);
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>(a1, *(_QWORD **)a2, 0, (_QWORD *)(*(_QWORD *)a2 + 8 * (*(_QWORD *)(a2 + 8) >> 6)), *(_QWORD *)(a2 + 8) & 0x3F, *(_QWORD *)(a2 + 8));
  }
  return a1;
}

void *std::vector<BOOL>::__vallocate[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  void *result;
  uint64_t v4;

  if (a2 < 0)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  result = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>(_QWORD *a1, _QWORD *a2, unint64_t a3, _QWORD *a4, int a5, uint64_t a6)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE v11[32];

  v6 = a1[1];
  v7 = v6 + a6;
  a1[1] = v6 + a6;
  if (!v6 || ((v7 - 1) ^ (v6 - 1)) >= 0x40)
  {
    if (v7 >= 0x41)
      v8 = (v7 - 1) >> 6;
    else
      v8 = 0;
    *(_QWORD *)(*a1 + 8 * v8) = 0;
  }
  v9 = *a1 + 8 * (v6 >> 6);
  v10 = v6 & 0x3F;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(a2, a3, a4, a5, (uint64_t)&v9, (uint64_t)v11);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(_QWORD *a1@<X1>, unint64_t a2@<X2>, _QWORD *a3@<X3>, int a4@<W4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  _BOOL4 v12;

  LODWORD(v6) = a2;
  v7 = *(uint64_t **)a5;
  v8 = *(_DWORD *)(a5 + 8);
  if (a1 != a3 || (_DWORD)a2 != a4)
  {
    do
    {
      v9 = 1 << v8;
      if (((*a1 >> a2) & 1) != 0)
        v10 = *v7 | v9;
      else
        v10 = *v7 & ~v9;
      *v7 = v10;
      v11 = (_DWORD)v6 == 63;
      v12 = v6 == 63;
      v6 = (a2 + 1);
      if (v11)
        v6 = 0;
      if (v8 == 63)
      {
        v8 = 0;
        *(_QWORD *)a5 = ++v7;
      }
      else
      {
        ++v8;
      }
      a1 += v12;
      a2 = v6 | a2 & 0xFFFFFFFF00000000;
      *(_DWORD *)(a5 + 8) = v8;
    }
    while (a1 != a3 || (_DWORD)v6 != a4);
    a1 = a3;
  }
  *(_QWORD *)a6 = a1;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = v7;
  *(_DWORD *)(a6 + 24) = v8;
}

_QWORD *std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_245808BF0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<long long>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_245808C68(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<long long>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

_QWORD *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<long long>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_245808D20(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  std::string *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_245808DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  std::string *v11;
  std::string *v12;

  v4 = this;
  v11 = this;
  v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v12 = ++v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_245808EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0)
      operator delete(*(void **)(v1 - 24));
    v1 -= 24;
  }
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,0>(uint64_t a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor(a1 + 32);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

float stats::mean(stats *this, const float *a2)
{
  float v3;

  if ((int)a2 <= 0)
    stats::mean();
  if (!this)
    stats::mean();
  v3 = 0.0;
  vDSP_meanv_wrapper((uint64_t)this, 1, &v3, a2);
  return v3;
}

float stats::variance(stats *this, const float *a2, int a3)
{
  int v5;
  vDSP_Length v6;
  float v7;
  float *__C;
  float *v10;
  uint64_t v11;
  uint64_t __A;

  if ((int)a2 <= 0)
    stats::variance();
  if (!this)
    stats::variance();
  v5 = (int)a2;
  v11 = 0;
  __A = 0;
  __C = 0;
  v10 = 0;
  v6 = a2;
  std::vector<float>::resize((uint64_t)&__C, a2);
  vDSP_meanv_wrapper((uint64_t)this, 1, (float *)&__A + 1, v6);
  vDSP_vsub((const float *)this->cp_time, 1, (const float *)&__A + 1, 0, __C, 1, v6);
  vDSP_dotpr(__C, 1, __C, 1, (float *)&__A, v6);
  v7 = *(float *)&__A / (float)(v5 - (a3 ^ 1));
  *(float *)&__A = v7;
  if (__C)
  {
    v10 = __C;
    operator delete(__C);
  }
  return v7;
}

void sub_2458091A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

float stats::covariance(stats *this, const float *a2, const float *a3, const float *a4, int a5)
{
  unsigned int v5;
  float v9;
  float *__B;
  float *v12;
  uint64_t v13;
  float *__C;
  float *v15;
  uint64_t v16;
  float v17;
  uint64_t __A;

  if ((int)a2 <= 0)
    stats::covariance();
  v5 = a2;
  if ((_DWORD)a4 != (_DWORD)a2)
    stats::covariance();
  if (!this)
    stats::covariance();
  if (!a3)
    stats::covariance();
  __A = 0;
  v17 = 0.0;
  __C = 0;
  v15 = 0;
  v16 = 0;
  __B = 0;
  v12 = 0;
  v13 = 0;
  std::vector<float>::resize((uint64_t)&__C, a2);
  std::vector<float>::resize((uint64_t)&__B, v5);
  vDSP_meanv_wrapper((uint64_t)this, 1, (float *)&__A + 1, v5);
  vDSP_vsub((const float *)this->cp_time, 1, (const float *)&__A + 1, 0, __C, 1, v5);
  vDSP_meanv_wrapper((uint64_t)a3, 1, (float *)&__A, v5);
  vDSP_vsub(a3, 1, (const float *)&__A, 0, __B, 1, v5);
  vDSP_dotpr(__C, 1, __B, 1, &v17, v5);
  v9 = v17 / (float)(int)(v5 - (a5 ^ 1));
  v17 = v9;
  if (__B)
  {
    v12 = __B;
    operator delete(__B);
  }
  if (__C)
  {
    v15 = __C;
    operator delete(__C);
  }
  return v9;
}

void sub_245809324(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

float stats::std(stats *this, const float *a2, int a3)
{
  if ((int)a2 <= 0)
    stats::std();
  if (!this)
    stats::std();
  return sqrtf(stats::variance(this, a2, a3));
}

float stats::median(stats *this, const float *a2)
{
  char v3;
  uint64_t v4;
  float v5;
  float *v6;
  float *v7;
  unint64_t v8;
  unint64_t v9;
  float *v10;
  float v11;
  float *v12;
  float v13;
  unint64_t v14;
  float *v15;
  void *__p;
  float *v18;
  uint64_t v19;

  if ((int)a2 <= 0)
    stats::median();
  if (!this)
    stats::median();
  v3 = (char)a2;
  __p = 0;
  v18 = 0;
  v4 = a2;
  v19 = 0;
  std::vector<float>::reserve(&__p, a2);
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(this, &this->cp_time[v4], (uint64_t)&__p);
  v6 = (float *)__p;
  v7 = v18;
  v8 = ((char *)v18 - (_BYTE *)__p) >> 2;
  if ((v3 & 1) != 0)
  {
    v14 = (2 * v8 - 2) & 0xFFFFFFFFFFFFFFFCLL;
    v15 = (float *)((char *)__p + v14);
    if ((char *)__p + v14 != (char *)v18)
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)((char *)__p + v14), v18, v5);
    v13 = *v15;
  }
  else
  {
    v9 = v8 >> 1;
    v10 = (float *)((char *)__p + 4 * v9 - 4);
    if (v10 != v18)
    {
      v5 = std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)__p + v9 - 1, v18, v5);
      v6 = (float *)__p;
      v7 = v18;
      v9 = (unint64_t)(((char *)v18 - (_BYTE *)__p) >> 2) >> 1;
    }
    v11 = *v10;
    v12 = &v6[v9];
    if (v12 != v7)
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(v6, &v6[v9], v7, v5);
    v13 = (float)(v11 + *v12) * 0.5;
  }
  if (__p)
  {
    v18 = (float *)__p;
    operator delete(__p);
  }
  return v13;
}

void sub_24580949C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

float stats::max(stats *this, const float *a2)
{
  float v3;

  if ((int)a2 <= 0)
    stats::max();
  if (!this)
    stats::max();
  v3 = 0.0;
  vDSP_maxv_wrapper((uint64_t)this, 1, &v3, a2);
  return v3;
}

float stats::min(stats *this, const float *a2)
{
  float v3;

  if ((int)a2 <= 0)
    stats::min();
  if (!this)
    stats::min();
  v3 = 0.0;
  vDSP_minv_wrapper((uint64_t)this, 1, &v3, a2);
  return v3;
}

void stats::median_vdsp(stats *this, vDSP_Length *a2, unint64_t *a3)
{
  if ((int)a3 <= 0)
    stats::median_vdsp();
  if (!this)
    stats::median_vdsp();
  if (!a2)
    stats::median_vdsp();
  stats::percentile(this, a2, (vDSP_Length)a3, 50.0);
}

void stats::percentile(stats *this, vDSP_Length *__I, vDSP_Length __N, float a4)
{
  if ((int)__N <= 0)
    stats::percentile();
  if (!this)
    stats::percentile();
  if (!__I)
    stats::percentile();
  if (a4 < 0.0 || a4 > 100.0)
    stats::percentile();
  vDSP_vsorti((const float *)this->cp_time, __I, 0, __N, 1);
}

stats *stats::linear_interp(stats *this, float *a2, float *a3, int a4)
{
  uint64_t v4;
  float *v5;
  uint64_t v6;
  const float *v7;
  uint64_t i;

  if (a4 >= 1)
  {
    v4 = a4;
    v5 = a2;
    do
    {
      *v5++ = *(float *)this->cp_time;
      --v4;
    }
    while (v4);
  }
  if ((int)a3 > 1)
  {
    v6 = 1;
    v7 = &a2[a4];
    do
    {
      if (a4 >= 1)
      {
        for (i = 0; i != a4; ++i)
          v7[i] = *(float *)&this->cp_time[v6 - 1]
                + (float)((float)((float)(*(float *)&this->cp_time[v6] - *(float *)&this->cp_time[v6 - 1])
                                * (float)(i + 1))
                        / (float)a4);
      }
      ++v6;
      v7 += a4;
    }
    while (v6 != a3);
  }
  return this;
}

float stats::pearsonr(stats *this, stats *a2, const float *a3)
{
  stats *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  double v11;
  float v12;
  double v13;
  float v14;

  v5 = this;
  v6 = stats::mean(this, a3);
  v7 = stats::mean(a2, a3);
  v8 = stats::std(v5, a3, 1);
  v9 = stats::std(a2, a3, 1);
  if ((int)a3 < 1)
  {
    v11 = 0.0;
  }
  else
  {
    v10 = a3;
    v11 = 0.0;
    do
    {
      v12 = *(float *)v5->cp_time;
      v5 = (stats *)((char *)v5 + 4);
      v13 = v12 - v6;
      v14 = *(float *)a2->cp_time;
      a2 = (stats *)((char *)a2 + 4);
      v11 = v11 + v13 * (v14 - v7);
      --v10;
    }
    while (v10);
  }
  return v11 / ((double)(int)a3 * v8 * v9);
}

_DWORD *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  _DWORD *v3;
  _DWORD *v4;
  uint64_t v6;

  v3 = a1;
  v6 = a3;
  if (a1 == a2)
    return a1;
  v4 = a2;
  do
    std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100](&v6, v3++);
  while (v3 != v4);
  return v4;
}

double Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_reset(Scandium::ScandiumPPG::scandium_beat_detection_t *this)
{
  double result;

  result = 0.0;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 21) = 0;
  return result;
}

double Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_t(Scandium::ScandiumPPG::scandium_beat_detection_t *this)
{
  double result;

  *(_OWORD *)((char *)this + 4) = Scandium::ScandiumPPG::bpfCoef;
  *(_OWORD *)((char *)this + 20) = unk_245826430;
  *(_QWORD *)((char *)this + 36) = 0x3F7B986FBFFDC753;
  *((_DWORD *)this + 20) = 1007231301;
  *(_DWORD *)this = 2;
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 17) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16604) = 0;
  result = 0.0;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *(_QWORD *)((char *)this + 84) = 0;
  *(_QWORD *)((char *)this + 100) = 0;
  *(_QWORD *)((char *)this + 92) = 0;
  *((_DWORD *)this + 27) = 0;
  *((_QWORD *)this + 16600) = 0;
  *((_OWORD *)this + 8298) = 0u;
  *((_OWORD *)this + 8299) = 0u;
  *((_OWORD *)this + 8296) = 0u;
  *((_OWORD *)this + 8297) = 0u;
  *((_OWORD *)this + 8294) = 0u;
  *((_OWORD *)this + 8295) = 0u;
  *((_OWORD *)this + 8293) = 0u;
  return result;
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_process(uint64_t a1, stats *a2, stats *a3, stats *this)
{
  uint64_t *v6;
  float v7;
  uint64_t v8;
  float *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  std::vector<int>::size_type v18;
  Scandium::ScandiumPPG::scandium_beat_detection_t *v19;
  int v20;
  _DWORD *v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  _QWORD *v25;
  std::vector<int>::pointer begin;
  _DWORD *v27;
  _DWORD *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  int v35;
  _DWORD *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  std::string *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  int v50;
  int v51;
  std::string *v52;
  unint64_t v53;
  unsigned int v54;
  std::string *v55;
  __int128 v56;
  void **v57;
  std::string::size_type v58;
  NSObject *log;
  std::string *v60;
  std::string *v61;
  uint64_t v62;
  unint64_t v63;
  unsigned int v64;
  std::string *v65;
  __int128 v66;
  void **v67;
  std::string::size_type v68;
  NSObject *v69;
  uint64_t v70;
  unint64_t v71;
  stats *v72;
  const void *v74;
  _QWORD *v75;
  void *v76[2];
  uint64_t v77;
  void *v78[2];
  uint64_t v79;
  void *v80[2];
  uint64_t v81;
  std::string v82;
  void *v83[2];
  char v84;
  std::vector<int> v85;
  void *v86;
  _QWORD v87[2];
  std::string v88;
  void *__p[2];
  int64_t v90;
  __int128 v91;
  uint64_t v92;
  int v93;
  int v94;
  uint64_t v95[4];
  __int128 v96;
  uint64_t v97;
  int v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102[4];
  __int128 v103;
  uint64_t v104;
  int v105;
  int v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  memset(&v88, 0, sizeof(v88));
  v74 = (const void *)(a1 + 132624);
  Scandium::ScandiumPPG::scandium_beat_detection_t::compute_mav((stats *)a1, this, a1 + 132624);
  stats::linear_interp(a2, (float *)(a1 + 92304), (float *)0x3C0, 4);
  v72 = a2;
  v6 = (uint64_t *)(a1 + 132784);
  v7 = *(float *)(a1 + 92304);
  v8 = 3840;
  v9 = (float *)(a1 + 92304);
  do
  {
    v9[3840] = Scandium::ScandiumPPG::iirSos<float,4>::process((unsigned int *)a1, *v9 - v7);
    ++v9;
    --v8;
  }
  while (v8);
  v10 = (uint64_t *)(a1 + 88);
  Scandium::ScandiumPPG::scandium_beat_detection_t::get_beats_and_flags(a1, a1 + 92304, a1 + 107664, (uint64_t)v74, 0x4Du, a1 + 88, (int *)(a1 + 130704), (std::vector<int> *)(a1 + 132760), (uint64_t *)(a1 + 132784));
  v12 = *(_QWORD *)(a1 + 88);
  v11 = *(_QWORD *)(a1 + 96);
  v13 = v11 - v12;
  if (v11 == v12)
  {
    v15 = 0;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v16 = v13 >> 2;
    v17 = *v6;
    do
    {
      if (((*(_QWORD *)(v17 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        *(_DWORD *)(v12 + 4 * v15) = *(_DWORD *)(v12 + 4 * v14);
        *(_DWORD *)(*(_QWORD *)(a1 + 120) + 4 * v15++) = *(_DWORD *)(*(_QWORD *)(a1 + 120) + 4 * v14);
      }
      ++v14;
    }
    while (v16 > v14);
  }
  v18 = v15;
  std::vector<float>::resize(a1 + 88, v15);
  v75 = (_QWORD *)(a1 + 120);
  std::vector<int>::resize((std::vector<int> *)(a1 + 120), v18);
  Scandium::ScandiumPPG::scandium_beat_detection_t::get_hr_from_beat_times(v19, (int32x2_t *)(a1 + 88));
  Scandium::ScandiumPPG::scandium_beat_detection_t::get_beats_and_flags(a1, a1 + 92304, a1 + 107664, (uint64_t)v74, (int)(45.0 / *(float *)(a1 + 112) * 256.0 + 0.5), a1 + 88, (int *)(a1 + 130704), (std::vector<int> *)(a1 + 132760), (uint64_t *)(a1 + 132784));
  stats::linear_interp(a3, (float *)(a1 + 92304), (float *)0x3C0, 4);
  v86 = 0;
  v87[0] = 0;
  v87[1] = 0;
  Scandium::ScandiumPPG::find_slope((const float *)(a1 + 92304), 0xF00u, 5u, (float **)&v86);
  memset(&v85, 0, sizeof(v85));
  Scandium::ScandiumPPG::scandium_beat_detection_t::find_max_slope(v20, &v86, a1 + 130704, (_QWORD *)(a1 + 132760), &v85);
  v21 = *(_DWORD **)(a1 + 120);
  *(_QWORD *)(a1 + 128) = v21;
  v22 = *(_QWORD *)(a1 + 132792);
  if (v22)
  {
    v23 = 0;
    v24 = 0;
    v25 = (_QWORD *)(a1 + 136);
    do
    {
      if (((*(_QWORD *)(*v6 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
      {
        begin = v85.__begin_;
        if ((unint64_t)v21 >= *v25)
        {
          v28 = (_DWORD *)*v75;
          v29 = ((uint64_t)v21 - *v75) >> 2;
          v30 = v29 + 1;
          if ((unint64_t)(v29 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v31 = *v25 - (_QWORD)v28;
          if (v31 >> 1 > v30)
            v30 = v31 >> 1;
          if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFFCLL)
            v32 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v32 = v30;
          if (v32)
          {
            v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 136, v32);
            v28 = *(_DWORD **)(a1 + 120);
            v21 = *(_DWORD **)(a1 + 128);
          }
          else
          {
            v33 = 0;
          }
          v34 = &v33[4 * v29];
          *(_DWORD *)v34 = begin[v23];
          v27 = v34 + 4;
          while (v21 != v28)
          {
            v35 = *--v21;
            *((_DWORD *)v34 - 1) = v35;
            v34 -= 4;
          }
          *(_QWORD *)(a1 + 120) = v34;
          *(_QWORD *)(a1 + 128) = v27;
          *(_QWORD *)(a1 + 136) = &v33[4 * v32];
          if (v28)
            operator delete(v28);
        }
        else
        {
          *v21 = v85.__begin_[v23];
          v27 = v21 + 1;
        }
        *(_QWORD *)(a1 + 128) = v27;
        v22 = *(_QWORD *)(a1 + 132792);
        v21 = v27;
      }
      v23 = ++v24;
    }
    while (v22 > v24);
    v36 = (_DWORD *)*v75;
  }
  else
  {
    v36 = v21;
  }
  LODWORD(__p[0]) = 0;
  v37 = std::vector<float>::assign((char **)(a1 + 88), v21 - v36, __p);
  v38 = *(_QWORD *)(a1 + 120);
  v39 = *(_QWORD *)(a1 + 128);
  v40 = v39 - v38;
  if (v39 != v38)
  {
    v41 = 0;
    v42 = v40 >> 2;
    v43 = *v10;
    do
    {
      *(float *)(v43 + 4 * v41) = (float)((float)*(int *)(v38 + 4 * v41) + 1.0) * 0.0039062;
      ++v41;
    }
    while (v42 > v41);
  }
  Scandium::ScandiumPPG::scandium_beat_detection_t::get_hr_from_beat_times((Scandium::ScandiumPPG::scandium_beat_detection_t *)v37, (int32x2_t *)(a1 + 88));
  v45 = *(_QWORD *)(a1 + 120);
  v46 = *(_QWORD *)(a1 + 128);
  v47 = v46 - v45;
  if (v46 != v45)
  {
    v48 = 0;
    v49 = v47 >> 2;
    do
    {
      v50 = *(_DWORD *)(v45 + 4 * v48);
      if (v50 < 2)
        v51 = v50 + 1;
      else
        v51 = v50 - 2;
      *(_DWORD *)(v45 + 4 * v48++) = v51 >> 2;
    }
    while (v49 > v48);
  }
  if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
  {
    v88.__r_.__value_.__l.__size_ = 21;
    v52 = (std::string *)v88.__r_.__value_.__r.__words[0];
  }
  else
  {
    *((_BYTE *)&v88.__r_.__value_.__s + 23) = 21;
    v52 = &v88;
  }
  strcpy((char *)v52, "scandium beat times: ");
  if (*(_QWORD *)(a1 + 128) != *(_QWORD *)(a1 + 120))
  {
    v53 = 0;
    v54 = 1;
    do
    {
      std::to_string(&v82, *(float *)(*v10 + 4 * v53));
      v55 = std::string::append(&v82, " ", 1uLL);
      v56 = *(_OWORD *)&v55->__r_.__value_.__l.__data_;
      v90 = v55->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v56;
      v55->__r_.__value_.__l.__size_ = 0;
      v55->__r_.__value_.__r.__words[2] = 0;
      v55->__r_.__value_.__r.__words[0] = 0;
      if (v90 >= 0)
        v57 = __p;
      else
        v57 = (void **)__p[0];
      if (v90 >= 0)
        v58 = HIBYTE(v90);
      else
        v58 = (std::string::size_type)__p[1];
      v44 = std::string::append(&v88, (const std::string::value_type *)v57, v58);
      if (SHIBYTE(v90) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v82.__r_.__value_.__l.__data_);
      v53 = v54++;
    }
    while (v53 < (uint64_t)(*(_QWORD *)(a1 + 128) - *(_QWORD *)(a1 + 120)) >> 2);
  }
  log = Scandium::algs_get_log((Scandium *)v44);
  v60 = (std::string *)os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)v60)
    Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_process();
  if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
  {
    v88.__r_.__value_.__l.__size_ = 21;
    v61 = (std::string *)v88.__r_.__value_.__r.__words[0];
  }
  else
  {
    *((_BYTE *)&v88.__r_.__value_.__s + 23) = 21;
    v61 = &v88;
  }
  strcpy((char *)v61, "scandium beat index: ");
  v62 = *(_QWORD *)(a1 + 120);
  if (*(_QWORD *)(a1 + 128) != v62)
  {
    v63 = 0;
    v64 = 1;
    do
    {
      std::to_string(&v82, *(_DWORD *)(v62 + 4 * v63));
      v65 = std::string::append(&v82, " ", 1uLL);
      v66 = *(_OWORD *)&v65->__r_.__value_.__l.__data_;
      v90 = v65->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v66;
      v65->__r_.__value_.__l.__size_ = 0;
      v65->__r_.__value_.__r.__words[2] = 0;
      v65->__r_.__value_.__r.__words[0] = 0;
      if (v90 >= 0)
        v67 = __p;
      else
        v67 = (void **)__p[0];
      if (v90 >= 0)
        v68 = HIBYTE(v90);
      else
        v68 = (std::string::size_type)__p[1];
      v60 = std::string::append(&v88, (const std::string::value_type *)v67, v68);
      if (SHIBYTE(v90) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v82.__r_.__value_.__l.__data_);
      v63 = v64;
      v62 = *(_QWORD *)(a1 + 120);
      ++v64;
    }
    while (v63 < (*(_QWORD *)(a1 + 128) - v62) >> 2);
  }
  v69 = Scandium::algs_get_log((Scandium *)v60);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_process();
  if (*(_QWORD *)(a1 + 132832))
  {
    std::string::basic_string[abi:ne180100]<0>(v83, "beat_detection");
    v80[0] = 0;
    v80[1] = 0;
    v81 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(v80, v72, (uint64_t)&v72[53].dk_xfer[2], 0x3C0uLL);
    std::string::basic_string[abi:ne180100]<0>(__p, "average_dcs_signal");
    v91 = *(_OWORD *)v80;
    v92 = v81;
    v80[1] = 0;
    v81 = 0;
    v80[0] = 0;
    v93 = 3;
    v94 = 6;
    v78[0] = 0;
    v78[1] = 0;
    v79 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(v78, a3, (uint64_t)&a3[53].dk_xfer[2], 0x3C0uLL);
    std::string::basic_string[abi:ne180100]<0>(v95, "average_ppg_ir");
    v96 = *(_OWORD *)v78;
    v97 = v79;
    v78[1] = 0;
    v79 = 0;
    v78[0] = 0;
    v98 = 3;
    v99 = 6;
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[10],std::vector<float>&,0>((uint64_t)&v100, "beat_time", a1 + 88);
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[9],std::vector<int>&,0>((uint64_t)&v101, "beat_idx", (uint64_t)v75);
    v76[0] = 0;
    v76[1] = 0;
    v77 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v76, v74, a1 + 132684, 0xFuLL);
    std::string::basic_string[abi:ne180100]<0>(v102, "mav_1s");
    v103 = *(_OWORD *)v76;
    v104 = v77;
    v76[1] = 0;
    v77 = 0;
    v76[0] = 0;
    v105 = 3;
    v106 = 6;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)&v82, (unsigned __int8 *)__p, 5);
    v70 = *(_QWORD *)(a1 + 132832);
    if (!v70)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, void **, std::string *))(*(_QWORD *)v70 + 48))(v70, v83, &v82);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)&v82);
    v71 = 360;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v87[v71 / 8]);
      if (*((char *)&v85.__end_cap_.__value_ + v71 + 7) < 0)
        operator delete(*(void **)((char *)&v85.__begin_ + v71));
      v71 -= 72;
    }
    while (v71);
    if (v76[0])
    {
      v76[1] = v76[0];
      operator delete(v76[0]);
    }
    if (v78[0])
    {
      v78[1] = v78[0];
      operator delete(v78[0]);
    }
    if (v80[0])
    {
      v80[1] = v80[0];
      operator delete(v80[0]);
    }
    if (v84 < 0)
      operator delete(v83[0]);
  }
  if (v85.__begin_)
  {
    v85.__end_ = v85.__begin_;
    operator delete(v85.__begin_);
  }
  if (v86)
  {
    v87[0] = v86;
    operator delete(v86);
  }
  if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v88.__r_.__value_.__l.__data_);
}

void sub_24580A150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,void *a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51,void *a52,uint64_t a53,int a54,__int16 a55,char a56,char a57)
{
  uint64_t i;

  for (i = 288; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)&a52 + i);
  if (__p)
    operator delete(__p);
  if (a19)
    operator delete(a19);
  if (a23)
    operator delete(a23);
  if (a39 < 0)
    operator delete(a34);
  if (a40)
    operator delete(a40);
  if (a43)
    operator delete(a43);
  if (a51 < 0)
    operator delete(a46);
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::compute_mav(stats *a1, stats *this, uint64_t a3)
{
  stats *v5;
  stats *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  stats *v10;
  float v11;

  v5 = a1;
  v6 = a1 + 642;
  v7 = 3;
  do
  {
    stats::linear_interp(this, (float *)v5[2].cp_time, (float *)0x3C0, 4);
    Scandium::ScandiumPPG::median_filt((Scandium::ScandiumPPG *)&v5[2], (const float *)v5[642].cp_time, (float *)0x10, 3840, 0);
    this = (stats *)((char *)this + 3840);
    v5 = (stats *)((char *)v5 + 15360);
    --v7;
  }
  while (v7);
  for (i = 0; i != 15; ++i)
  {
    *(_DWORD *)(a3 + 4 * i) = 0;
    v9 = 3;
    v10 = v6;
    do
    {
      v11 = stats::variance(v10, (const float *)0x100, 1);
      if (*(float *)(a3 + 4 * i) >= v11)
        v11 = *(float *)(a3 + 4 * i);
      *(float *)(a3 + 4 * i) = v11;
      v10 = (stats *)((char *)v10 + 15360);
      --v9;
    }
    while (v9);
    v6 = (stats *)((char *)v6 + 1024);
  }
}

float Scandium::ScandiumPPG::iirSos<float,4>::process(unsigned int *a1, float a2)
{
  uint64_t v2;
  double v3;
  double *v4;
  float *v5;
  double v6;
  double v7;
  double v8;

  v2 = *a1;
  if ((int)v2 < 1)
    return 0.0;
  v3 = (float)(*((float *)a1 + 20) * (float)(a2 - *((float *)a1 + 21)));
  v4 = (double *)(a1 + 14);
  v5 = (float *)(a1 + 3);
  do
  {
    v6 = v3;
    v3 = *(v4 - 1) + *(v5 - 2) * v3;
    v7 = *v4 + *(v5 - 1) * v6 - v3 * v5[1];
    v8 = *v5 * v6 - v3 * v5[2];
    *(v4 - 1) = v7;
    *v4 = v8;
    v4 += 2;
    v5 += 5;
    --v2;
  }
  while (v2);
  return v3;
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::get_beats_and_flags(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, int *a7, std::vector<int> *a8, uint64_t *a9)
{
  char **v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int *v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  int v22;
  int v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  float *v34;
  unint64_t v35;
  uint64_t v36;
  float v37;
  char *v38;
  float v39;
  uint64_t *v40;
  std::vector<int>::value_type __u[2];
  std::vector<int>::size_type __n;

  v14 = (char **)(a1 + 132688);
  LODWORD(__n) = 0;
  v15 = a1 + 126864;
  findPeaks((float *)(a3 + 512), 3584, (vDSP_Length *)(a1 + 123024), -INFINITY, a5, 0, (const float *)(a1 + 126864), (float *)(a1 + 128784), a7, (unsigned int *)&__n);
  v16 = __n;
  if ((_DWORD)__n)
  {
    v17 = __n;
    v18 = a7;
    do
    {
      *v18++ += 128;
      --v17;
    }
    while (v17);
  }
  else
  {
    v16 = 0;
  }
  __u[0] = 0;
  std::vector<float>::assign((char **)a6, v16, __u);
  __u[0] = 0;
  std::vector<int>::assign((std::vector<int> *)(a6 + 32), __n, __u);
  v40 = (uint64_t *)a6;
  if ((_DWORD)__n)
  {
    v19 = 0;
    v20 = *(char **)a6;
    v21 = *(_QWORD *)(a6 + 32);
    do
    {
      v22 = a7[v19];
      *(float *)&v20[4 * v19] = (float)(v22 + 1) * 0.0039062;
      if (v22 < 2)
        v23 = v22 + 1;
      else
        v23 = v22 - 2;
      *(_DWORD *)(v21 + 4 * v19++) = v23 >> 2;
      v24 = __n;
    }
    while (v19 < __n);
  }
  else
  {
    v24 = 0;
  }
  __u[0] = 0;
  std::vector<float>::assign(v14, v24, __u);
  __u[0] = 0;
  std::vector<float>::assign(v14 + 3, __n, __u);
  __u[0] = 0;
  std::vector<int>::assign(a8, __n, __u);
  if ((_DWORD)__n)
  {
    v26 = 0;
    do
    {
      if (v26)
      {
        v27 = &a7[v26];
        v28 = *(v27 - 1);
        v29 = a3 + 4 * v28;
        v30 = &(*v14)[4 * v26];
        v31 = *v27 - v28;
      }
      else
      {
        v30 = *v14;
        v31 = *a7;
        v29 = a3;
      }
      vDSP_minv_wrapper(v29, 1, (float *)v30, v31);
      *(_QWORD *)__u = 0;
      v32 = a7[v26];
      v33 = a3 + 4 * v32 + 4;
      v34 = (float *)&v14[3][4 * v26];
      if (v26 == (_DWORD)__n - 1)
      {
        vDSP_minvi_wrapper(v33, 1, v34, (vDSP_Length *)__u, 3839 - v32);
        v35 = v26 + 1;
      }
      else
      {
        v35 = v26 + 1;
        vDSP_minvi_wrapper(v33, 1, v34, (vDSP_Length *)__u, a7[v26 + 1] + ~(_DWORD)v32);
      }
      a8->__begin_[v26] = __u[0] + a7[v26] + 1;
      v36 = a7[v26];
      v37 = (float)(*(float *)(v15 + 4 * v26) - *(float *)&(*v14)[4 * v26]) * 100.0 / *(float *)(a2 + 4 * v36);
      *(float *)&(*v14)[4 * v26] = v37;
      v38 = v14[3];
      v39 = (float)(*(float *)(v15 + 4 * v26) - *(float *)&v38[4 * v26]) * 100.0 / *(float *)(a2 + 4 * v36);
      *(float *)&v38[4 * v26] = v39;
      v26 = v35;
    }
    while (v35 < __n);
  }
  Scandium::ScandiumPPG::scandium_beat_detection_t::pulse_sanitizer(v25, v40, v14, v14 + 3, a4, a9);
}

void std::vector<int>::resize(std::vector<int> *this, std::vector<int>::size_type __sz)
{
  std::vector<int>::size_type v2;

  v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2)
      this->__end_ = &this->__begin_[__sz];
  }
  else
  {
    std::vector<int>::__append(this, __sz - v2);
  }
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::get_hr_from_beat_times(Scandium::ScandiumPPG::scandium_beat_detection_t *this, int32x2_t *a2)
{
  int32x2_t v3;
  uint64_t v4;
  float *v5;
  float *v6;
  float *v7;
  float *v8;
  float v9;
  float v10;
  float *v11;
  float v12;
  float *v13;
  float *v14;
  float *v15;
  float v16;
  void *__p;
  float *v18;

  v3 = *a2;
  v4 = *(_QWORD *)&a2[1] - *(_QWORD *)a2;
  if ((unint64_t)v4 <= 0xB)
  {
    a2[3] = vdup_n_s32(0x7FC00000u);
    a2[1] = v3;
    a2[5] = a2[4];
    return;
  }
  std::vector<float>::vector(&__p, (int)(v4 >> 2));
  v5 = (float *)*a2;
  v6 = (float *)a2[1];
  v7 = (float *)__p;
  if (*(float **)a2 != v6)
  {
    v9 = *v5;
    v8 = v5 + 1;
    v10 = v9;
    *(float *)__p = v9;
    if (v8 != v6)
    {
      v11 = v7 + 1;
      do
      {
        v12 = *v8++;
        *v11++ = v12 - v10;
        v10 = v12;
      }
      while (v8 != v6);
    }
  }
  v13 = v7 + 1;
  v14 = v18;
  if (v7 + 1 != v18)
  {
    while (*v13 <= 2.0 && *v13 >= 0.4)
    {
      if (++v13 == v18)
        goto LABEL_20;
    }
    if (v13 != v18)
    {
      v15 = v13 + 1;
      if (v13 + 1 != v18)
      {
        do
        {
          v16 = *v15;
          if (*v15 <= 2.0 && v16 >= 0.4)
            *v13++ = v16;
          ++v15;
        }
        while (v15 != v14);
      }
    }
    if (v13 != v14)
    {
      v18 = v13;
      goto LABEL_21;
    }
LABEL_20:
    v13 = v14;
  }
LABEL_21:
  if ((unint64_t)((char *)v13 - (char *)v7) > 7)
  {
    *(float *)a2[3].i32 = 60.0
                        / stats::median((stats *)(v7 + 1), (const float *)(((unint64_t)((char *)v13 - (char *)v7) >> 2) - 1));
    *(float *)&a2[3].i32[1] = 60.0
                            / stats::mean((stats *)((char *)__p + 4), (const float *)(((unint64_t)((char *)v18 - (_BYTE *)__p) >> 2) - 1));
    v7 = (float *)__p;
    if (!__p)
      return;
  }
  else
  {
    a2[3] = vdup_n_s32(0x7FC00000u);
    a2[1] = *a2;
    a2[5] = a2[4];
    if (!v7)
      return;
  }
  v18 = v7;
  operator delete(v7);
}

void sub_24580A930(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::find_max_slope(int a1, _QWORD *a2, uint64_t a3, _QWORD *a4, std::vector<int> *this)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int *value;
  std::vector<int>::pointer end;
  int *v15;
  std::vector<int>::pointer begin;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  int *v22;
  int v23;
  int v24;
  vDSP_Length v25;

  v9 = a4[1] - *a4;
  std::vector<int>::reserve(this, (int)(v9 >> 2));
  if ((int)((unint64_t)v9 >> 2) >= 1)
  {
    v10 = 0;
    v25 = 0;
    v24 = 0;
    v11 = ((unint64_t)v9 >> 2);
    do
    {
      vDSP_maxvi_wrapper(*a2 + 4 * *(int *)(a3 + 4 * v10), 1, (float *)&v24, &v25, *(int *)(*a4 + 4 * v10) - (uint64_t)*(int *)(a3 + 4 * v10));
      v12 = *(_DWORD *)(a3 + 4 * v10) + v25;
      end = this->__end_;
      value = this->__end_cap_.__value_;
      if (end >= value)
      {
        begin = this->__begin_;
        v17 = end - this->__begin_;
        v18 = v17 + 1;
        if ((unint64_t)(v17 + 1) >> 62)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v19 = (char *)value - (char *)begin;
        if (v19 >> 1 > v18)
          v18 = v19 >> 1;
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL)
          v20 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v20 = v18;
        if (v20)
        {
          v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&this->__end_cap_, v20);
          begin = this->__begin_;
          end = this->__end_;
        }
        else
        {
          v21 = 0;
        }
        v22 = (int *)&v21[4 * v17];
        *v22 = v12;
        v15 = v22 + 1;
        while (end != begin)
        {
          v23 = *--end;
          *--v22 = v23;
        }
        this->__begin_ = v22;
        this->__end_ = v15;
        this->__end_cap_.__value_ = (int *)&v21[4 * v20];
        if (begin)
          operator delete(begin);
      }
      else
      {
        *end = v12;
        v15 = end + 1;
      }
      this->__end_ = v15;
      ++v10;
    }
    while (v10 != v11);
  }
}

char *std::vector<float>::assign(char **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  char *result;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = (uint64_t)a1[2];
  result = *a1;
  if (a2 <= (v6 - (uint64_t)result) >> 2)
  {
    v13 = a1[1];
    v14 = (v13 - result) >> 2;
    if (v14 >= a2)
      v15 = a2;
    else
      v15 = (v13 - result) >> 2;
    if (v15)
    {
      v16 = result;
      do
      {
        *(_DWORD *)v16 = *a3;
        v16 += 4;
        --v15;
      }
      while (v15);
    }
    if (a2 <= v14)
    {
      a1[1] = &result[4 * a2];
    }
    else
    {
      v17 = &v13[4 * (a2 - v14)];
      v18 = 4 * a2 - 4 * v14;
      do
      {
        *(_DWORD *)v13 = *a3;
        v13 += 4;
        v18 -= 4;
      }
      while (v18);
      a1[1] = v17;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v8 = v6 >> 1;
    if (v6 >> 1 <= a2)
      v8 = a2;
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL)
      v9 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v9 = v8;
    result = std::vector<float>::__vallocate[abi:ne180100](a1, v9);
    v10 = a1[1];
    v11 = &v10[4 * a2];
    v12 = 4 * a2;
    do
    {
      *(_DWORD *)v10 = *a3;
      v10 += 4;
      v12 -= 4;
    }
    while (v12);
    a1[1] = v11;
  }
  return result;
}

void Scandium::ScandiumPPG::median_filt(Scandium::ScandiumPPG *this, const float *a2, float *a3, int a4, int a5)
{
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _DWORD *v13;
  uint64_t v14;
  unint64_t v15;
  _DWORD *v16;
  int v17;
  int v18;
  float v19;
  unint64_t v20;
  float *v21;
  int v22;
  _DWORD *v23;
  uint64_t v24;
  int v25;
  int v27;
  void *__p;
  float *v29;
  uint64_t v30;

  if ((int)a3 <= 0)
    Scandium::ScandiumPPG::median_filt();
  if (!this)
    Scandium::ScandiumPPG::median_filt();
  if (!a2)
    Scandium::ScandiumPPG::median_filt();
  v8 = a3;
  __p = 0;
  v29 = 0;
  v30 = 0;
  std::vector<float>::reserve(&__p, a3);
  if (a4 >= 1)
  {
    v9 = 0;
    v10 = a4;
    v11 = v8 >> 1;
    v23 = (_DWORD *)((char *)this + 4 * a4);
    v24 = a4 - (int)v11;
    v25 = v8 - v11;
    v12 = (v8 & 1) == 0;
    v13 = (_DWORD *)((char *)this + 4 * (2 * a4) + -4 * (int)v11);
    if (v12)
      v14 = 0;
    else
      v14 = -1;
    v22 = v11 - a4;
    v15 = v11;
    v16 = (_DWORD *)((char *)this + 4 * v11);
    do
    {
      std::vector<float>::resize((uint64_t)&__p, 0);
      if (v9 >= v11)
      {
        if (v9 > v24)
        {
          if (a5)
          {
            v27 = 0;
            std::vector<float>::resize((uint64_t)&__p, v22 + (int)v9, &v27);
          }
          else
          {
            std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(v13, v23, (uint64_t)&__p);
          }
          v17 = v9 - v11;
          v18 = v10;
          goto LABEL_21;
        }
        v17 = v9 - v11;
      }
      else
      {
        if (a5)
        {
          v27 = 0;
          std::vector<float>::resize((uint64_t)&__p, v15, &v27);
        }
        else
        {
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(this, v16, (uint64_t)&__p);
        }
        v17 = 0;
      }
      v18 = v25 + v9;
LABEL_21:
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>((_DWORD *)this + v17, (_DWORD *)this + v18, (uint64_t)&__p);
      v20 = (unint64_t)(v14 + (((char *)v29 - (_BYTE *)__p) >> 2)) >> 1;
      v21 = (float *)((char *)__p + 4 * v20);
      if (v21 != v29)
        std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)__p + v20, v29, v19);
      a2[v9++] = *v21;
      --v15;
      --v13;
      --v16;
    }
    while (v10 != v9);
  }
  if (__p)
  {
    v29 = (float *)__p;
    operator delete(__p);
  }
}

void sub_24580ADB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<int>::assign(std::vector<int> *this, std::vector<int>::size_type __n, std::vector<int>::const_reference __u)
{
  uint64_t value;
  int *begin;
  std::vector<int>::size_type v8;
  unint64_t v9;
  std::vector<int>::pointer v10;
  int *v11;
  std::vector<int>::size_type v12;
  std::vector<int>::pointer end;
  std::vector<int>::size_type v14;
  std::vector<int>::size_type v15;
  int *v16;
  int *v17;
  std::vector<int>::size_type v18;

  value = (uint64_t)this->__end_cap_.__value_;
  begin = this->__begin_;
  if (__n <= (value - (uint64_t)begin) >> 2)
  {
    end = this->__end_;
    v14 = end - begin;
    if (v14 >= __n)
      v15 = __n;
    else
      v15 = end - begin;
    if (v15)
    {
      v16 = begin;
      do
      {
        *v16++ = *__u;
        --v15;
      }
      while (v15);
    }
    if (__n <= v14)
    {
      this->__end_ = &begin[__n];
    }
    else
    {
      v17 = &end[__n - v14];
      v18 = 4 * __n - 4 * v14;
      do
      {
        *end++ = *__u;
        v18 -= 4;
      }
      while (v18);
      this->__end_ = v17;
    }
  }
  else
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v8 = value >> 1;
    if (value >> 1 <= __n)
      v8 = __n;
    if ((unint64_t)value >= 0x7FFFFFFFFFFFFFFCLL)
      v9 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v9 = v8;
    std::vector<float>::__vallocate[abi:ne180100](this, v9);
    v10 = this->__end_;
    v11 = &v10[__n];
    v12 = 4 * __n;
    do
    {
      *v10++ = *__u;
      v12 -= 4;
    }
    while (v12);
    this->__end_ = v11;
  }
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::pulse_sanitizer(uint64_t a1, uint64_t *a2, _QWORD *a3, _QWORD *a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  float *v20;
  uint64_t v21;
  float *v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  BOOL v31;
  BOOL v32;
  uint64_t i;
  unint64_t v35;
  float v36;
  float v37;
  uint64_t v38;
  float v39;
  BOOL v40;
  char v41;

  v11 = (a2[1] - *a2) >> 2;
  v41 = 0;
  std::vector<BOOL>::assign((uint64_t)a6, v11, &v41);
  v12 = (v11 - 1);
  v13 = *a2;
  if (v12 >= 2)
  {
    v14 = 0;
    v15 = 0;
    v16 = *a3;
    v17 = *a4;
    v18 = *a6;
    v19 = *(float *)(v13 + 4);
    v20 = (float *)(*a4 + 8);
    v21 = v12 - 1;
    v22 = (float *)(*a3 + 8);
    do
    {
      v23 = *(v22 - 1);
      if (v23 >= *(v20 - 1))
        v23 = *(v20 - 1);
      if (*(float *)(v16 + 4 * v15) <= *(float *)(v17 + 4 * v15))
        v24 = *(float *)(v17 + 4 * v15);
      else
        v24 = *(float *)(v16 + 4 * v15);
      v25 = *v20;
      if (*v22 > *v20)
        v25 = *v22;
      v26 = *(float *)(v13 + 4 * v15);
      v27 = v19 - v26;
      v19 = *(float *)(v13 + 8 + 4 * v14);
      v28 = 60.0 / (float)(v19 - v26);
      v31 = v24 * 0.5 <= v23 || v25 * 0.5 <= v23 || v27 >= 0.5 || v28 < 30.0;
      if (v31 && (v23 < v24 ? (v32 = v23 < v25) : (v32 = 0), !v32 || v27 >= 0.3))
        v15 = v14 + 1;
      else
        *(_QWORD *)(v18 + (((unint64_t)(v14 + 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << (v14
                                                                                                + 1);
      ++v14;
      ++v20;
      ++v22;
    }
    while (v21 != v14);
    v13 = *a2;
  }
  for (i = 0; i != 15; ++i)
  {
    if (*(float *)(a5 + 4 * i) > 0.001 && (_DWORD)v11 != 0)
    {
      v35 = 0;
      v38 = *a6;
      do
      {
        v39 = *(float *)(v13 + 4 * v35);
        v36 = (double)i + -1.0;
        if (v39 >= v36)
        {
          v37 = (double)i + 1.5;
          v40 = v39 > v37;
        }
        else
        {
          v40 = 1;
        }
        if (!v40)
          *(_QWORD *)(v38 + ((v35 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v35;
        ++v35;
      }
      while (v11 != v35);
    }
  }
}

void std::vector<BOOL>::assign(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  char *v14;
  __int128 v15;

  *(_QWORD *)(a1 + 8) = 0;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 16);
    v7 = v6 << 6;
    if (v6 << 6 >= a2)
    {
      *(_QWORD *)(a1 + 8) = a2;
    }
    else
    {
      v14 = 0;
      v15 = 0uLL;
      if ((a2 & 0x8000000000000000) != 0)
        std::vector<float>::__throw_length_error[abi:ne180100]();
      v8 = v6 << 7;
      if (v8 <= ((a2 + 63) & 0xFFFFFFFFFFFFFFC0))
        v8 = (a2 + 63) & 0xFFFFFFFFFFFFFFC0;
      if (v7 <= 0x3FFFFFFFFFFFFFFELL)
        v9 = v8;
      else
        v9 = 0x7FFFFFFFFFFFFFFFLL;
      std::vector<BOOL>::reserve(&v14, v9);
      v11 = v14;
      v12 = *((_QWORD *)&v15 + 1);
      v14 = *(char **)a1;
      v10 = v14;
      v13 = *(_OWORD *)(a1 + 8);
      *(_QWORD *)a1 = v11;
      *(_QWORD *)(a1 + 8) = a2;
      *(_QWORD *)(a1 + 16) = v12;
      v15 = v13;
      if (v10)
        operator delete(v10);
    }
    if (*a3)
    {
      v14 = *(char **)a1;
      LODWORD(v15) = 0;
      std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(&v14, a2);
    }
    else
    {
      v14 = *(char **)a1;
      LODWORD(v15) = 0;
      std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v14, a2);
    }
  }
}

void sub_24580B1F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<int>::reserve(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::__compressed_pair<int *> *p_end_cap;
  int *value;
  int64_t v5;
  char *v6;
  int *v7;
  uint64_t v8;
  int *v9;
  std::vector<int>::pointer begin;
  int *end;
  int *v12;
  int v13;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v5 = (char *)this->__end_ - (char *)this->__begin_;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, __n);
    v7 = (int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = (int *)&v6[4 * v8];
    begin = this->__begin_;
    end = this->__end_;
    v12 = v7;
    if (end != this->__begin_)
    {
      v12 = v7;
      do
      {
        v13 = *--end;
        *--v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
      operator delete(begin);
  }
}

uint64_t Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_get_beats(Scandium::ScandiumPPG::scandium_beat_detection_t *this)
{
  return (uint64_t)this + 88;
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    std::vector<float>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<int>::__append(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::__compressed_pair<int *> *p_end_cap;
  int *v5;
  int *value;
  int *end;
  std::vector<int>::pointer begin;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  int *v16;
  int *v17;
  int v18;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v5 = value;
  end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    begin = this->__begin_;
    v9 = (char *)end - (char *)this->__begin_;
    v10 = __n + (v9 >> 2);
    if (v10 >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 2;
    v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, v13);
      begin = this->__begin_;
      end = this->__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = (int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    v17 = (int *)&v15[4 * __n];
    while (end != begin)
    {
      v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[10],std::vector<float>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD *v5;

  v5 = std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, a2);
  v5[4] = 0;
  v5[5] = 0;
  v5 += 4;
  v5[2] = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v5, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2);
  *(_DWORD *)(a1 + 56) = 3;
  *(_DWORD *)(a1 + 64) = 6;
  return a1;
}

void sub_24580B434(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[9],std::vector<int>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD *v5;

  v5 = std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, a2);
  v5[4] = 0;
  v5[5] = 0;
  v5 += 4;
  v5[2] = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v5, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2);
  *(_DWORD *)(a1 + 56) = 1;
  *(_DWORD *)(a1 + 64) = 6;
  return a1;
}

void sub_24580B4A0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::vector<BOOL>::reserve(char **a1, unint64_t a2)
{
  unint64_t v3;
  char *v4;
  __int128 v5;
  char *v6;
  int v7;
  char *v8;
  int v9;
  char *v10;
  __int128 v11;

  if (a2 > (_QWORD)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v10 = 0;
    v11 = 0uLL;
    std::vector<BOOL>::__vallocate[abi:ne180100](&v10, a2);
    v3 = (unint64_t)a1[1];
    v8 = *a1;
    v9 = 0;
    v6 = &v8[8 * (v3 >> 6)];
    v7 = v3 & 0x3F;
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(&v10, (uint64_t)&v8, (uint64_t)&v6, v3);
    v4 = *a1;
    *a1 = v10;
    v10 = v4;
    v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v11;
    v11 = v5;
    if (v4)
      operator delete(v4);
  }
}

void sub_24580B560(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;

  v4 = a1[1];
  v5 = v4 + a4;
  a1[1] = v4 + a4;
  if (!v4 || ((v5 - 1) ^ (v4 - 1)) >= 0x40)
  {
    if (v5 >= 0x41)
      v6 = (v5 - 1) >> 6;
    else
      v6 = 0;
    *(_QWORD *)(*a1 + 8 * v6) = 0;
  }
  v7 = *(_DWORD *)(a2 + 8);
  v8 = *(_QWORD *)a3;
  v9 = *(_DWORD *)(a3 + 8);
  v10 = *a1 + 8 * (v4 >> 6);
  v16 = *(_QWORD *)a2;
  v17 = v7;
  v14 = v8;
  v15 = v9;
  v12 = v10;
  v13 = v4 & 0x3F;
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(&v16, &v14, &v12, (uint64_t)&v11);
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;

  v5 = *((_DWORD *)a1 + 2);
  v6 = *a2;
  v7 = *((_DWORD *)a2 + 2);
  v16 = *a1;
  v17 = v5;
  v14 = v6;
  v15 = v7;
  v8 = *((_DWORD *)a3 + 2);
  v12 = *a3;
  v13 = v8;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>((uint64_t)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)&v18);
  v9 = v19;
  v10 = v20;
  v11 = v21;
  *(_QWORD *)a4 = v18;
  *(_DWORD *)(a4 + 8) = v9;
  *(_QWORD *)(a4 + 16) = v10;
  *(_DWORD *)(a4 + 24) = v11;
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  _QWORD *v4;
  int v5;
  int i;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;

  v4 = *(_QWORD **)a1;
  v5 = *(_DWORD *)(a1 + 8);
  for (i = *(_DWORD *)(a3 + 8); *(_QWORD *)a1 != *(_QWORD *)a2 || v5 != *(_DWORD *)(a2 + 8); v5 = *(_DWORD *)(a1 + 8))
  {
    v8 = *(uint64_t **)a3;
    v9 = 1 << i;
    if (((*v4 >> v5) & 1) != 0)
      v10 = *v8 | v9;
    else
      v10 = *v8 & ~v9;
    *v8 = v10;
    if (v5 == 63)
    {
      v11 = 0;
      *(_QWORD *)a1 = v4 + 1;
    }
    else
    {
      v11 = v5 + 1;
    }
    *(_DWORD *)(a1 + 8) = v11;
    v12 = *(_DWORD *)(a3 + 8);
    if (v12 == 63)
    {
      i = 0;
      *(_QWORD *)a3 += 8;
    }
    else
    {
      i = v12 + 1;
    }
    *(_DWORD *)(a3 + 8) = i;
    v4 = *(_QWORD **)a1;
  }
  *(_QWORD *)a4 = v4;
  *(_DWORD *)(a4 + 8) = v5;
  *(_QWORD *)(a4 + 16) = *(_QWORD *)a3;
  *(_DWORD *)(a4 + 24) = i;
}

_QWORD *std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(_QWORD *result, unint64_t a2)
{
  unint64_t v2;
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v3 = result;
  v4 = *((_DWORD *)result + 2);
  v5 = (_QWORD *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    v2 = a2 - v6;
    *result = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    result = memset(v5, 255, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v4 = *(_DWORD *)(a1 + 8);
  v5 = *(_QWORD **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    v2 = a2 - v6;
    *(_QWORD *)a1 = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    bzero(v5, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *(_QWORD *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_24580B928(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::__append(void **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _DWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _DWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  int v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 2)
  {
    if (a2)
    {
      v16 = 4 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 2);
    if (v11 >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v12 = v10 >> 2;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 1 > v11)
      v11 = v13 >> 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
      v14 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v6, v14);
    else
      v15 = 0;
    v18 = &v15[4 * v12];
    v19 = &v18[4 * a2];
    v20 = 4 * a2;
    v21 = v18;
    do
    {
      *(_DWORD *)v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    v22 = &v15[4 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 4)
    {
      v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xCu);
}

void OUTLINED_FUNCTION_1_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void vDSP_maxv_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, uint64_t a4)
{
  const float *v8;
  float *v9;
  uint64_t v10;
  vDSP_Length v11;

  v8 = (const float *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  if (v8)
  {
    v9 = (float *)v8;
    if (a4 < 1)
    {
      v11 = 0;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      do
        v8[v11++] = *(const float *)(a1 + 4 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_maxv(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_minv_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, uint64_t a4)
{
  const float *v8;
  float *v9;
  uint64_t v10;
  vDSP_Length v11;

  v8 = (const float *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  if (v8)
  {
    v9 = (float *)v8;
    if (a4 < 1)
    {
      v11 = 0;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      do
        v8[v11++] = *(const float *)(a1 + 4 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_minv(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_maxvi_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, vDSP_Length *a4, uint64_t a5)
{
  const float *v10;
  float *v11;
  uint64_t v12;
  vDSP_Length v13;

  v10 = (const float *)malloc_type_malloc(4 * a5, 0x100004052888210uLL);
  if (v10)
  {
    v11 = (float *)v10;
    if (a5 < 1)
    {
      v13 = 0;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      do
        v10[v13++] = *(const float *)(a1 + 4 * v12++);
      while ((float)(int)v12 < (float)a5);
    }
    vDSP_maxvi(v10, a2, a3, a4, v13);
    free(v11);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_minvi_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, vDSP_Length *a4, uint64_t a5)
{
  const float *v10;
  float *v11;
  uint64_t v12;
  vDSP_Length v13;

  v10 = (const float *)malloc_type_malloc(4 * a5, 0x100004052888210uLL);
  if (v10)
  {
    v11 = (float *)v10;
    if (a5 < 1)
    {
      v13 = 0;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      do
        v10[v13++] = *(const float *)(a1 + 4 * v12++);
      while ((float)(int)v12 < (float)a5);
    }
    vDSP_minvi(v10, a2, a3, a4, v13);
    free(v11);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_meanv_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, uint64_t a4)
{
  const float *v8;
  float *v9;
  uint64_t v10;
  vDSP_Length v11;

  v8 = (const float *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  if (v8)
  {
    v9 = (float *)v8;
    if (a4 < 1)
    {
      v11 = 0;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      do
        v8[v11++] = *(const float *)(a1 + 4 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_meanv(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

uint64_t Scandium::algs_get_log(Scandium *this)
{
  if (Scandium::algs_get_log(void)::onceToken != -1)
    dispatch_once(&Scandium::algs_get_log(void)::onceToken, &__block_literal_global_0);
  return Scandium::algs_get_log(void)::log;
}

os_log_t ___ZN8Scandium12algs_get_logEv_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.scandium", "algorithm");
  Scandium::algs_get_log(void)::log = (uint64_t)result;
  return result;
}

_QWORD *Scandium::ScandiumPPG::scandium_quality_metric_t::reset(_QWORD *this)
{
  *this = 0;
  return this;
}

uint64_t Scandium::ScandiumPPG::scandium_quality_metric_t::scandium_quality_metric_t(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_QWORD *)a1 = 0;
  Scandium::ScandiumPPG::scandium_optical_fom_t::scandium_optical_fom_t(a1 + 8, a3, a4, a5);
  *(_QWORD *)(a1 + 432) = 0;
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 440) = a2;
  return a1;
}

void Scandium::ScandiumPPG::scandium_quality_metric_t::~scandium_quality_metric_t(Scandium::ScandiumPPG::scandium_quality_metric_t *this)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = (char *)this + 408;
  v3 = (char *)*((_QWORD *)this + 54);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  Scandium::ScandiumPPG::scandium_optical_fom_t::~scandium_optical_fom_t((Scandium::ScandiumPPG::scandium_quality_metric_t *)((char *)this + 8));
}

void Scandium::ScandiumPPG::scandium_quality_metric_t::process(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  float v15;
  BOOL v16;
  _BOOL4 v17;
  _BOOL8 v18;
  unint64_t v19;
  uint64_t v20;
  _BYTE v21[40];
  void *__p[2];
  char v23;
  _OWORD v24[2];
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  __int128 v28;
  _BYTE v29[28];
  _QWORD v30[4];
  int v31;
  int v32;
  _QWORD v33[4];
  int v34;
  int v35;
  _QWORD v36[4];
  int v37;
  int v38;
  _QWORD v39[4];
  int v40;
  int v41;
  _QWORD v42[4];
  int v43;
  int v44;
  _QWORD v45[4];
  int v46;
  int v47;
  _QWORD v48[4];
  int v49;
  int v50;
  _QWORD v51[4];
  int v52;
  int v53;
  _QWORD v54[4];
  int v55;
  int v56;
  _QWORD v57[4];
  int v58;
  int v59;
  _QWORD v60[4];
  int v61;
  int v62;
  _QWORD v63[4];
  int v64;
  int v65;
  _QWORD v66[4];
  int v67;
  int v68;
  _QWORD v69[4];
  int v70;
  int v71;
  _QWORD v72[4];
  int v73;
  int v74;
  _QWORD v75[4];
  int v76;
  int v77;
  _QWORD v78[4];
  int v79;
  int v80;
  _QWORD v81[4];
  int v82;
  int v83;
  _QWORD v84[4];
  int v85;
  int v86;
  _QWORD v87[4];
  int v88;
  int v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 432))
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "quality_metric_in");
    std::string::basic_string[abi:ne180100]<0>(v24, "ir_snip_corr");
    LODWORD(v25) = *(_DWORD *)a2;
    LODWORD(v27[0]) = 3;
    std::string::basic_string[abi:ne180100]<0>((_QWORD *)v27 + 1, "red_snip_corr");
    DWORD2(v28) = *(_DWORD *)(a2 + 4);
    *(_DWORD *)&v29[24] = 3;
    std::string::basic_string[abi:ne180100]<0>(v30, "bga_corr");
    v31 = *(_DWORD *)(a2 + 8);
    v32 = 3;
    std::string::basic_string[abi:ne180100]<0>(v33, "spo2");
    v34 = *(_DWORD *)(a2 + 12);
    v35 = 3;
    std::string::basic_string[abi:ne180100]<0>(v36, "hr");
    v37 = *(_DWORD *)(a2 + 16);
    v38 = 3;
    std::string::basic_string[abi:ne180100]<0>(v39, "girpir");
    v40 = *(_DWORD *)(a2 + 28);
    v41 = 3;
    std::string::basic_string[abi:ne180100]<0>(v42, "num_good_beats");
    v43 = *(_DWORD *)(a2 + 20);
    v44 = 1;
    std::string::basic_string[abi:ne180100]<0>(v45, "num_total_beats");
    v46 = *(_DWORD *)(a2 + 24);
    v47 = 1;
    v4 = *(unsigned __int8 *)(a2 + 32);
    std::string::basic_string[abi:ne180100]<0>(v48, "path_type");
    v49 = v4;
    v50 = 1;
    v5 = *(unsigned __int8 *)(a2 + 36);
    std::string::basic_string[abi:ne180100]<0>(v51, "emitter_idx");
    v52 = v5;
    v53 = 1;
    v6 = *(unsigned __int8 *)(a2 + 37);
    std::string::basic_string[abi:ne180100]<0>(v54, "detector_idx");
    v55 = v6;
    v56 = 1;
    std::string::basic_string[abi:ne180100]<0>(v57, "ir_pi");
    v58 = *(_DWORD *)(a2 + 40);
    v59 = 3;
    std::string::basic_string[abi:ne180100]<0>(v60, "red_pi");
    v61 = *(_DWORD *)(a2 + 44);
    v62 = 3;
    std::string::basic_string[abi:ne180100]<0>(v63, "green_pi");
    v64 = *(_DWORD *)(a2 + 48);
    v65 = 3;
    std::string::basic_string[abi:ne180100]<0>(v66, "ir_idc");
    v67 = *(_DWORD *)(a2 + 52);
    v68 = 3;
    std::string::basic_string[abi:ne180100]<0>(v69, "red_idc");
    v70 = *(_DWORD *)(a2 + 56);
    v71 = 3;
    std::string::basic_string[abi:ne180100]<0>(v72, "green_idc");
    v73 = *(_DWORD *)(a2 + 60);
    v74 = 3;
    std::string::basic_string[abi:ne180100]<0>(v75, "ir_idc_agg");
    v76 = *(_DWORD *)(a2 + 64);
    v77 = 3;
    std::string::basic_string[abi:ne180100]<0>(v78, "red_idc_agg");
    v79 = *(_DWORD *)(a2 + 68);
    v80 = 3;
    std::string::basic_string[abi:ne180100]<0>(v81, "green_idc_agg");
    v82 = *(_DWORD *)(a2 + 72);
    v83 = 3;
    std::string::basic_string[abi:ne180100]<0>(v84, "iAmb");
    v85 = *(_DWORD *)(a2 + 76);
    v86 = 3;
    std::string::basic_string[abi:ne180100]<0>(v87, "amb_blankslot_noise");
    v88 = *(_DWORD *)(a2 + 80);
    v89 = 3;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v21, (unsigned __int8 *)v24, 22);
    v7 = *(_QWORD *)(a1 + 432);
    if (!v7)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, void **, _BYTE *))(*(_QWORD *)v7 + 48))(v7, __p, v21);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v21);
    v8 = 1584;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v21[v8 + 24]);
      if ((char)v21[v8 + 15] < 0)
        operator delete(*(void **)((char *)&v24[-4] + v8 - 8));
      v8 -= 72;
    }
    while (v8);
    if (v23 < 0)
      operator delete(__p[0]);
  }
  v9 = *(float *)(a2 + 28);
  v10 = *(unsigned __int8 *)(a2 + 32);
  v11 = *(_OWORD *)(a2 + 116);
  v12 = *(_OWORD *)(a2 + 148);
  v28 = *(_OWORD *)(a2 + 132);
  *(_OWORD *)v29 = v12;
  *(_OWORD *)&v29[12] = *(_OWORD *)(a2 + 160);
  v13 = *(_OWORD *)(a2 + 52);
  v14 = *(_OWORD *)(a2 + 84);
  v25 = *(_OWORD *)(a2 + 68);
  v26 = v14;
  v27[0] = *(_OWORD *)(a2 + 100);
  v27[1] = v11;
  v24[0] = *(_OWORD *)(a2 + 36);
  v24[1] = v13;
  v15 = 10.0;
  v16 = v10 == 2;
  v17 = v10 == 2;
  v18 = v16 || v9 >= 10.0;
  v19 = *(_QWORD *)a1 & 0xFFFFFFFFFFFFFFFCLL | v18;
  if (*(_BYTE *)(a1 + 440) == 1)
    v15 = 5.0;
  if (v15 <= v9)
    v17 = 1;
  v16 = !v17;
  v20 = 2;
  if (v16)
    v20 = 0;
  *(_QWORD *)a1 = v19 | v20;
  Scandium::ScandiumPPG::scandium_quality_metric_t::compute_hw_metric_validity((float *)a1, v24);
}

void sub_24580C41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20)
{
  uint64_t i;

  for (i = 1512; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a20 + i));
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_quality_metric_t::compute_hw_metric_validity(float *a1, _OWORD *a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  float v30;
  int v31;
  _BYTE v32[40];
  void *__p[2];
  char v34;
  unsigned __int8 v35[32];
  float v36;
  int v37;
  _QWORD v38[4];
  float v39;
  int v40;
  _QWORD v41[4];
  float v42;
  int v43;
  _QWORD v44[4];
  float v45;
  int v46;
  _QWORD v47[4];
  float v48;
  int v49;
  _QWORD v50[4];
  float v51;
  int v52;
  _QWORD v53[4];
  float v54;
  int v55;
  _QWORD v56[4];
  float v57;
  int v58;
  _QWORD v59[4];
  int v60;
  int v61;
  _QWORD v62[4];
  float v63;
  int v64;
  _QWORD v65[4];
  int v66;
  int v67;
  _OWORD v68[7];
  _OWORD v69[2];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v3 = a2[7];
  v68[6] = a2[6];
  v69[0] = v3;
  *(_OWORD *)((char *)v69 + 12) = *(_OWORD *)((char *)a2 + 124);
  v4 = a2[3];
  v68[2] = a2[2];
  v68[3] = v4;
  v5 = a2[5];
  v68[4] = a2[4];
  v68[5] = v5;
  v6 = a2[1];
  v68[0] = *a2;
  v68[1] = v6;
  Scandium::ScandiumPPG::scandium_optical_fom_t::process((uint64_t)(a1 + 2), (float *)v68);
  v7 = a1[92];
  v8 = a1[93];
  v9 = a1[94];
  v10 = a1[95];
  v11 = a1[96];
  v12 = a1[97];
  v13 = a1[98];
  v14 = a1[99];
  v15 = v8 < 1.0 || v7 < 1.0;
  v16 = 4;
  if (v15)
    v16 = 0;
  v17 = *(_QWORD *)a1 & 0xFFFFFFFFFFFFFF83 | v16;
  v18 = v12 < 1.0 || v11 < 1.0;
  v19 = 8;
  if (v18)
    v19 = 0;
  v20 = v10 < 1.0 || v9 < 1.0;
  v21 = 16;
  if (v20)
    v21 = 0;
  v22 = v17 | v19 | v21;
  v23 = v14 > 0.01 || v13 > 0.01;
  v24 = 32;
  if (v23)
    v24 = 0;
  v30 = a1[101];
  v31 = *((_DWORD *)a1 + 100);
  v25 = v30 > 0.04 || a1[100] > 0.04;
  v26 = 64;
  if (v25)
    v26 = 0;
  *(_QWORD *)a1 = v22 | v24 | v26;
  if (*((_QWORD *)a1 + 54))
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "optical_fom_out");
    std::string::basic_string[abi:ne180100]<0>(v35, "ir_snr");
    v36 = v7;
    v37 = 3;
    std::string::basic_string[abi:ne180100]<0>(v38, "red_snr");
    v39 = v8;
    v40 = 3;
    std::string::basic_string[abi:ne180100]<0>(v41, "ir_snbr");
    v42 = v9;
    v43 = 3;
    std::string::basic_string[abi:ne180100]<0>(v44, "red_snbr");
    v45 = v10;
    v46 = 3;
    std::string::basic_string[abi:ne180100]<0>(v47, "ir_scnr");
    v48 = v11;
    v49 = 3;
    std::string::basic_string[abi:ne180100]<0>(v50, "red_scnr");
    v51 = v12;
    v52 = 3;
    std::string::basic_string[abi:ne180100]<0>(v53, "ir_sxr");
    v54 = v13;
    v55 = 3;
    std::string::basic_string[abi:ne180100]<0>(v56, "red_sxr");
    v57 = v14;
    v58 = 3;
    std::string::basic_string[abi:ne180100]<0>(v59, "ir_sxr_ch");
    v60 = v31;
    v61 = 3;
    std::string::basic_string[abi:ne180100]<0>(v62, "red_sxr_ch");
    v63 = v30;
    v64 = 3;
    v27 = *(_QWORD *)a1;
    std::string::basic_string[abi:ne180100]<0>(v65, "valid_flags");
    v66 = v27;
    v67 = 1;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v32, v35, 11);
    v28 = *((_QWORD *)a1 + 54);
    if (!v28)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, void **, _BYTE *))(*(_QWORD *)v28 + 48))(v28, __p, v32);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v32);
    v29 = 792;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v32[v29 + 24]);
      if ((char)v32[v29 + 15] < 0)
        operator delete(*(void **)&v35[v29 - 72]);
      v29 -= 72;
    }
    while (v29);
    if (v34 < 0)
      operator delete(__p[0]);
  }
}

void sub_24580C7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  uint64_t i;

  for (i = 720; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a21 + i));
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

Scandium::ScandiumPPG::scandium_spo2_t *Scandium::ScandiumPPG::scandium_spo2_t::scandium_spo2_t(Scandium::ScandiumPPG::scandium_spo2_t *this)
{
  *((_QWORD *)this + 3) = 0;
  Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t::scandium_r_ir_ratio_model_wrapper_t((Scandium::ScandiumPPG::scandium_spo2_t *)((char *)this + 32));
  return this;
}

void sub_24580C8A0(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)v1[3];
  if (v3 == v1)
  {
    v4 = 4;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
    v1 = (_QWORD *)v1[3];
  }
  (*(void (**)(_QWORD *))(*v1 + 8 * v4))(v1);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void Scandium::ScandiumPPG::scandium_spo2_t::~scandium_spo2_t(id **this)
{
  Scandium::ScandiumPPG::scandium_spo2_t *v2;
  uint64_t v3;

  Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t::~scandium_r_ir_ratio_model_wrapper_t(this + 4);
  v2 = (Scandium::ScandiumPPG::scandium_spo2_t *)this[3];
  if (v2 == (Scandium::ScandiumPPG::scandium_spo2_t *)this)
  {
    v3 = 4;
    v2 = (Scandium::ScandiumPPG::scandium_spo2_t *)this;
  }
  else
  {
    if (!v2)
      return;
    v3 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_t::process(uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  float v8;
  float v9;
  float v10;
  int v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  unint64_t v19;
  float *v20;
  uint64_t v21;
  uint64_t v22;
  void *__p[2];
  uint64_t v25;
  void *v26[2];
  uint64_t v27;
  _BYTE v28[40];
  void *v29[2];
  char v30;
  uint64_t v31;
  _QWORD v32[4];
  int v33;
  int v34;
  _QWORD v35[4];
  __int128 v36;
  uint64_t v37;
  int v38;
  int v39;
  _QWORD v40[4];
  __int128 v41;
  uint64_t v42;
  int v43;
  int v44;
  _QWORD v45[4];
  int v46;
  int v47;
  _QWORD v48[4];
  int v49;
  int v50;
  _QWORD v51[4];
  int v52;
  int v53;
  _QWORD v54[4];
  int v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v31 = 0x7FC000007FC00000;
  v6 = Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t::process((Scandium **)(a1 + 32), *((_QWORD *)a2 + 1), *((_QWORD *)a2 + 2), &v31);
  if ((_DWORD)v6)
  {
    v7 = 2143289344;
  }
  else
  {
    **(_DWORD **)(a3 + 8) = HIDWORD(v31);
    v7 = v31;
    v8 = (float)(*(float *)&v31 * 1.04) + -0.02;
    *(float *)&v31 = v8;
    v9 = *((float *)a2 + 8) + (float)(*((float *)a2 + 7) * v8);
    if (v9 == 0.0)
    {
      v6 = 2;
      v10 = 0.0;
    }
    else
    {
      v6 = 0;
      v10 = (float)((float)(1.0 - (float)(*((float *)a2 + 6) * v8)) * 100.0) / v9;
    }
    **(float **)a3 = v10;
  }
  if (*(_QWORD *)(a1 + 24))
  {
    std::string::basic_string[abi:ne180100]<0>(v29, "ratio_dl_model");
    v11 = *a2;
    std::string::basic_string[abi:ne180100]<0>(v32, "path_idx");
    v33 = v11;
    v34 = 1;
    v12 = *((_QWORD *)a2 + 2);
    v13 = *(const void **)v12;
    v14 = *(_QWORD *)(v12 + 8);
    v15 = (v14 - *(_QWORD *)v12) >> 2;
    v26[1] = 0;
    v27 = 0;
    v26[0] = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<std::__wrap_iter<float *>,std::__wrap_iter<float *>>(v26, v13, v14, v15);
    std::string::basic_string[abi:ne180100]<0>(v35, "input_red");
    v36 = *(_OWORD *)v26;
    v37 = v27;
    v26[1] = 0;
    v27 = 0;
    v26[0] = 0;
    v38 = 3;
    v39 = 6;
    v16 = *((_QWORD *)a2 + 1);
    v17 = *(const void **)v16;
    v18 = *(_QWORD *)(v16 + 8);
    v19 = (v18 - *(_QWORD *)v16) >> 2;
    __p[1] = 0;
    v25 = 0;
    __p[0] = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<std::__wrap_iter<float *>,std::__wrap_iter<float *>>(__p, v17, v18, v19);
    std::string::basic_string[abi:ne180100]<0>(v40, "input_ir");
    v41 = *(_OWORD *)__p;
    v42 = v25;
    __p[1] = 0;
    v25 = 0;
    __p[0] = 0;
    v43 = 3;
    v44 = 6;
    std::string::basic_string[abi:ne180100]<0>(v45, "ratio");
    v46 = v31;
    v47 = 3;
    v20 = *(float **)a3;
    std::string::basic_string[abi:ne180100]<0>(v48, "spo2_out");
    v49 = *(_DWORD *)v20;
    v50 = 3;
    std::string::basic_string[abi:ne180100]<0>(v51, "raw_ratio");
    v52 = v7;
    v53 = 3;
    std::string::basic_string[abi:ne180100]<0>(v54, "raw_conf");
    v55 = HIDWORD(v31);
    v56 = 3;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v28, (unsigned __int8 *)v32, 7);
    v21 = *(_QWORD *)(a1 + 24);
    if (!v21)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, void **, _BYTE *))(*(_QWORD *)v21 + 48))(v21, v29, v28);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v28);
    v22 = 504;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v28[v22 + 32]);
      if ((char)v28[v22 + 23] < 0)
        operator delete(*(void **)&v28[v22]);
      v22 -= 72;
    }
    while (v22);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v26[0])
    {
      v26[1] = v26[0];
      operator delete(v26[0]);
    }
    if (v30 < 0)
      operator delete(v29[0]);
  }
  return v6;
}

void sub_24580CC6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,char a28)
{
  uint64_t i;

  for (i = 432; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a28 + i));
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  if (a26 < 0)
    operator delete(a21);
  _Unwind_Resume(a1);
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_t::compute_orthogonal_regression(uint64_t a1, uint64_t a2, uint64_t a3, float *a4)
{
  stats *v5;
  uint64_t v6;
  float v7;
  uint64_t v9;
  uint64_t v10;
  float v12;
  float v13;
  float v14;
  uint64_t result;
  float v16;
  float v17;

  v5 = *(stats **)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = 0.0;
  if (*(_QWORD *)a2 == v6
    || (v9 = *(_QWORD *)(a3 + 8), *(_QWORD *)a3 == v9)
    || (v10 = v6 - (_QWORD)v5, v10 >> 2 != (v9 - *(_QWORD *)a3) >> 2))
  {
    result = 1;
  }
  else
  {
    v12 = stats::variance(v5, (const float *)((unint64_t)v10 >> 2), 1);
    v13 = stats::variance(*(stats **)a3, (const float *)((*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2), 1);
    v14 = stats::covariance(*(stats **)a2, (const float *)((*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2), *(const float **)a3, (const float *)((*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2), 1);
    result = 0;
    v16 = v12 - v13;
    v17 = (float)((float)(v14 * 4.0) * v14) + (float)(v16 * v16);
    if (v17 < 0.0)
      v17 = 0.0;
    v7 = (float)(sqrtf(v17) - v16) / (float)(v14 + v14);
  }
  *a4 = v7;
  return result;
}

_QWORD *std::vector<float>::__init_with_size[abi:ne180100]<std::__wrap_iter<float *>,std::__wrap_iter<float *>>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_24580CE84(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t *Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t::scandium_r_ir_ratio_model_wrapper_t(Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t *this)
{
  uint64_t v2;

  v2 = operator new();
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_QWORD *)(v2 + 32) = 0;
  *(_QWORD *)this = v2;
  Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t::init((Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t *)v2);
  return this;
}

void sub_24580CEEC(_Unwind_Exception *exception_object)
{
  id **v1;
  id *v3;

  v3 = *v1;
  *v1 = 0;
  if (v3)
    std::default_delete<Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t>::operator()[abi:ne180100]((uint64_t)v1, v3);
  _Unwind_Resume(exception_object);
}

uint64_t Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t::init(Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t *this)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  Scandium *v11;
  ScandiumRIrRatioModel *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  Scandium *v17;
  NSObject *v18;
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[16];

  v2 = objc_opt_new();
  v3 = (void *)*((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = v2;

  v4 = (void *)*((_QWORD *)this + 4);
  if (v4)
  {
    objc_msgSend(v4, "setComputeUnits:", 0);
    v22 = 0;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithShape:dataType:error:", &unk_2516A1128, 65568, &v22);
    v6 = v22;
    v7 = *(void **)this;
    *(_QWORD *)this = v5;

    v21 = v6;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithShape:dataType:error:", &unk_2516A1128, 65568, &v21);
    v9 = v21;

    v10 = (void *)*((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v8;

    if (*(_QWORD *)this && *((_QWORD *)this + 1))
    {
      v12 = [ScandiumRIrRatioModel alloc];
      v13 = *((_QWORD *)this + 4);
      v20 = v9;
      v14 = -[ScandiumRIrRatioModel initWithConfiguration:error:]_0(v12, "initWithConfiguration:error:", v13, &v20);
      v15 = v20;

      v16 = (void *)*((_QWORD *)this + 3);
      *((_QWORD *)this + 3) = v14;

      if (!v15)
        return 1;
      Scandium::algs_get_log(v17);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2457F9000, v18, OS_LOG_TYPE_DEFAULT, "scandium r/ir model initialization failed", buf, 2u);
      }
      v9 = v15;
    }
    else
    {
      Scandium::algs_get_log(v11);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2457F9000, v18, OS_LOG_TYPE_DEFAULT, "scandium r/ir model input initialization failed", buf, 2u);
      }
    }

  }
  else
  {
    Scandium::algs_get_log(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2457F9000, v9, OS_LOG_TYPE_DEFAULT, "scandium r/ir model config initialization failed", buf, 2u);
    }
  }

  return 0;
}

void sub_24580D128(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t::~scandium_r_ir_ratio_model_wrapper_t(id **this)
{
  id *v1;

  v1 = *this;
  *this = 0;
  if (v1)
    std::default_delete<Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t>::operator()[abi:ne180100]((uint64_t)this, v1);
}

BOOL Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t::process(Scandium **a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  return !Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t::process(*a1, a2, a3, a4, a4 + 1);
}

BOOL Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t::process(Scandium *a1, uint64_t a2, uint64_t a3, _DWORD *a4, _DWORD *a5)
{
  _BYTE *v9;
  _BYTE *v10;
  void *v11;
  ScandiumRIrRatioModelInput *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  Scandium *v18;
  _BOOL8 v19;
  NSObject *v20;
  ScandiumRIrRatioModelOutput *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  __int16 v31;
  id v32;
  uint8_t buf[16];

  if (*(_QWORD *)(a3 + 8) - *(_QWORD *)a3 == 3840 && *(_QWORD *)(a2 + 8) - *(_QWORD *)a2 == 3840)
  {
    memmove((void *)objc_msgSend(*((id *)a1 + 1), "dataPointer"), *(const void **)a2, 0xF00uLL);
    v10 = *(_BYTE **)a3;
    v9 = *(_BYTE **)(a3 + 8);
    v11 = (void *)objc_msgSend(*(id *)a1, "dataPointer");
    if (v9 != v10)
      memmove(v11, v10, v9 - v10);
    v12 = -[ScandiumRIrRatioModelInput initWithIr:red:]_0([ScandiumRIrRatioModelInput alloc], "initWithIr:red:", *((_QWORD *)a1 + 1), *(_QWORD *)a1);
    v13 = (void *)*((_QWORD *)a1 + 2);
    *((_QWORD *)a1 + 2) = v12;

    objc_msgSend(*((id *)a1 + 3), "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *((_QWORD *)a1 + 2);
    v32 = 0;
    objc_msgSend(v14, "predictionFromFeatures:error:", v15, &v32);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v32;

    v19 = v17 == 0;
    if (v17)
    {
      Scandium::algs_get_log(v18);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 0;
        _os_log_impl(&dword_2457F9000, v20, OS_LOG_TYPE_DEFAULT, "scandium r/ir model prediction failed", (uint8_t *)&v31, 2u);
      }
    }
    else
    {
      v21 = [ScandiumRIrRatioModelOutput alloc];
      objc_msgSend(v16, "featureValueForName:", CFSTR("Identity"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "multiArrayValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[ScandiumRIrRatioModelOutput initWithIdentity:]_0(v21, "initWithIdentity:", v23);

      -[NSObject Identity](v20, "Identity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "floatValue");
      *a4 = v26;

      -[NSObject Identity](v20, "Identity");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "floatValue");
      *a5 = v29;

    }
  }
  else
  {
    Scandium::algs_get_log(a1);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2457F9000, v17, OS_LOG_TYPE_DEFAULT, "scandium r/ir model invalid input size", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

void sub_24580D3E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_24580D450()
{
  JUMPOUT(0x24580D444);
}

void std::default_delete<Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (a2)
  {

    JUMPOUT(0x24953BE38);
  }
}

double Scandium::ScandiumPPG::scandium_channel_combination_t::scandium_channel_combination_t(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_DWORD *)(a1 + 88) = 1065353216;
  *(_QWORD *)(a1 + 136) = a2;
  *(_QWORD *)(a1 + 144) = a3;
  *(_QWORD *)(a1 + 608) = 0;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  return result;
}

void Scandium::ScandiumPPG::scandium_channel_combination_t::~scandium_channel_combination_t(Scandium::ScandiumPPG::scandium_channel_combination_t *this)
{
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (char *)this + 584;
  v3 = (char *)*((_QWORD *)this + 76);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_6:
  v5 = (void *)*((_QWORD *)this + 28);
  if (v5)
    operator delete(v5);
  v6 = (void *)*((_QWORD *)this + 25);
  if (v6)
  {
    *((_QWORD *)this + 26) = v6;
    operator delete(v6);
  }
  v7 = (void *)*((_QWORD *)this + 22);
  if (v7)
  {
    *((_QWORD *)this + 23) = v7;
    operator delete(v7);
  }
  v8 = (void *)*((_QWORD *)this + 19);
  if (v8)
  {
    *((_QWORD *)this + 20) = v8;
    operator delete(v8);
  }
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 56);
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

int32x2_t Scandium::ScandiumPPG::scandium_channel_combination_t::init_module(std::string *this, std::string *__str)
{
  std::string::size_type v4;
  char *v5;
  char *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  std::string::value_type *v10;
  int32x2_t result;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = this[5].__r_.__value_.__r.__words[2];
  if (*(_DWORD *)v4 == 2)
  {
    if (*(_BYTE *)(v4 + 10))
    {
      std::string::__assign_external(this, "BACKGROUND-WRIST-ROTATED", 0x18uLL);
      *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = xmmword_245827DF0;
      this[1].__r_.__value_.__r.__words[2] = 0x4079999A40480000;
      LOWORD(this[2].__r_.__value_.__l.__data_) = 257;
      v12 = xmmword_245826464;
      v13 = 0x3F19999A00000000;
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__assign_unique<std::pair<Scandium::ScandiumPPG::PathType const,float> const*>(&this[2].__r_.__value_.__l.__size_, (uint64_t)&v12, (uint64_t)&v14);
    }
    else
    {
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      {
        this->__r_.__value_.__l.__size_ = 17;
        v6 = (char *)this->__r_.__value_.__r.__words[0];
      }
      else
      {
        *((_BYTE *)&this->__r_.__value_.__s + 23) = 17;
        v6 = (char *)this;
      }
      strcpy(v6, "BACKGROUND-NORMAL");
      *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = xmmword_245827DF0;
      this[1].__r_.__value_.__r.__words[2] = 0x4079999A40480000;
      LOWORD(this[2].__r_.__value_.__l.__data_) = 257;
      v12 = xmmword_245826464;
      v13 = 0x3F19999A00000000;
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__assign_unique<std::pair<Scandium::ScandiumPPG::PathType const,float> const*>(&this[2].__r_.__value_.__l.__size_, (uint64_t)&v12, (uint64_t)&v14);
    }
  }
  else
  {
    if (*(_DWORD *)v4 != 1)
      goto LABEL_14;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    {
      this->__r_.__value_.__l.__size_ = 10;
      v5 = (char *)this->__r_.__value_.__r.__words[0];
    }
    else
    {
      *((_BYTE *)&this->__r_.__value_.__s + 23) = 10;
      v5 = (char *)this;
    }
    strcpy(v5, "FOREGROUND");
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = xmmword_245827E00;
    this[1].__r_.__value_.__r.__words[2] = 0x4079999A40480000;
    LOWORD(this[2].__r_.__value_.__l.__data_) = 256;
    v12 = xmmword_245826464;
    v13 = 0x3F19999A00000000;
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__assign_unique<std::pair<Scandium::ScandiumPPG::PathType const,float> const*>(&this[2].__r_.__value_.__l.__size_, (uint64_t)&v12, (uint64_t)&v14);
  }
  this[4].__r_.__value_.__r.__words[0] = 0xBF80000041266666;
  LODWORD(this[4].__r_.__value_.__r.__words[1]) = -1058642330;
  *(std::string::size_type *)((char *)&this[4].__r_.__value_.__r.__words[1] + 4) = 0;
  *(std::string::size_type *)((char *)this[5].__r_.__value_.__r.__words + 4) = 0;
  *(std::string::size_type *)((char *)&this[4].__r_.__value_.__r.__words[2] + 4) = 0;
LABEL_14:
  if (__str[5].__r_.__value_.__s.__data_[16])
  {
    std::string::operator=(this, __str);
    v7 = *(_OWORD *)&__str[1].__r_.__value_.__l.__data_;
    *(_OWORD *)((char *)&this[1].__r_.__value_.__r.__words[1] + 2) = *(_OWORD *)((char *)&__str[1].__r_.__value_.__r.__words[1]
                                                                               + 2);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v7;
    if (this != __str)
    {
      LODWORD(this[3].__r_.__value_.__r.__words[2]) = __str[3].__r_.__value_.__r.__words[2];
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,void *> *>>(&this[2].__r_.__value_.__l.__size_, (uint64_t *)__str[3].__r_.__value_.__l.__data_, 0);
    }
    v8 = *(_OWORD *)&__str[4].__r_.__value_.__l.__data_;
    v9 = *(_OWORD *)&__str[4].__r_.__value_.__r.__words[2];
    LODWORD(this[5].__r_.__value_.__r.__words[1]) = __str[5].__r_.__value_.__r.__words[1];
    *(_OWORD *)&this[4].__r_.__value_.__l.__data_ = v8;
    *(_OWORD *)&this[4].__r_.__value_.__r.__words[2] = v9;
  }
  Scandium::ScandiumPPG::scandium_channel_combination_t::unpack_input_values((Scandium::ScandiumPPG::scandium_channel_combination_t *)this);
  *(_OWORD *)&this[10].__r_.__value_.__r.__words[1] = 0u;
  v10 = &this[10].__r_.__value_.__s.__data_[8];
  *((_OWORD *)v10 + 18) = 0u;
  *((_OWORD *)v10 + 19) = 0u;
  *((_OWORD *)v10 + 16) = 0u;
  *((_OWORD *)v10 + 17) = 0u;
  *((_OWORD *)v10 + 14) = 0u;
  *((_OWORD *)v10 + 15) = 0u;
  *((_OWORD *)v10 + 12) = 0u;
  *((_OWORD *)v10 + 13) = 0u;
  *((_OWORD *)v10 + 10) = 0u;
  *((_OWORD *)v10 + 11) = 0u;
  *((_OWORD *)v10 + 8) = 0u;
  *((_OWORD *)v10 + 9) = 0u;
  *((_OWORD *)v10 + 6) = 0u;
  *((_OWORD *)v10 + 7) = 0u;
  *((_OWORD *)v10 + 4) = 0u;
  *((_OWORD *)v10 + 5) = 0u;
  *((_OWORD *)v10 + 2) = 0u;
  *((_OWORD *)v10 + 3) = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  result = vdup_n_s32(0x7FC00000u);
  *((int32x2_t *)v10 + 40) = result;
  return result;
}

void Scandium::ScandiumPPG::scandium_channel_combination_t::unpack_input_values(Scandium::ScandiumPPG::scandium_channel_combination_t *this)
{
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t j;
  uint64_t v9;
  uint64_t k;
  char *v11;
  uint64_t v12;
  uint64_t m;
  int v14;
  char *v15;

  *((_QWORD *)this + 20) = *((_QWORD *)this + 19);
  v2 = (char *)this + 176;
  v4 = (char *)this + 200;
  v3 = *((_QWORD *)this + 25);
  *((_QWORD *)this + 23) = *((_QWORD *)this + 22);
  *((_QWORD *)this + 26) = v3;
  *((_QWORD *)this + 29) = 0;
  v5 = *((_QWORD *)this + 18);
  v15 = (char *)this + 152;
  for (i = 20; i != 660; i += 40)
  {
    v14 = *(_DWORD *)(v5 + i);
    std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100]((uint64_t *)&v15, &v14);
  }
  v7 = *((_QWORD *)this + 18);
  v15 = v2;
  for (j = 16; j != 656; j += 40)
  {
    v14 = *(_DWORD *)(v7 + j);
    std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100]((uint64_t *)&v15, &v14);
  }
  v9 = *((_QWORD *)this + 18);
  v15 = v4;
  for (k = 24; k != 664; k += 40)
  {
    v14 = *(_DWORD *)(v9 + k);
    std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100]((uint64_t *)&v15, &v14);
  }
  v11 = (char *)this + 224;
  v12 = *((_QWORD *)this + 18);
  for (m = 36; m != 676; m += 40)
  {
    LOBYTE(v15) = *(_BYTE *)(v12 + m);
    std::vector<BOOL>::push_back((uint64_t)v11, &v15);
  }
}

float Scandium::ScandiumPPG::scandium_channel_combination_t::log_coreanalytics_metrics(uint64_t a1, uint64_t a2)
{
  void **v4;
  __int128 *v5;
  _OWORD *v6;
  _QWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char *v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void **v27;
  __int128 *v28;
  _OWORD *v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _OWORD *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char *v45;
  char *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void **v50;
  __int128 *v51;
  _OWORD *v52;
  unint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _OWORD *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  char *v68;
  char *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  void **v73;
  __int128 *v74;
  _OWORD *v75;
  unint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _OWORD *v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  char *v86;
  char *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  char *v91;
  char *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  void **v96;
  __int128 *v97;
  _OWORD *v98;
  unint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _OWORD *v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  char *v114;
  char *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  float result;

  v4 = *(void ***)a2;
  v5 = (__int128 *)(a1 + 248);
  v6 = *(_OWORD **)(*(_QWORD *)a2 + 8);
  v7 = (_QWORD *)(*(_QWORD *)a2 + 16);
  if ((unint64_t)v6 >= *v7)
  {
    v12 = ((char *)v6 - (_BYTE *)*v4) >> 6;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 58)
      goto LABEL_82;
    v14 = *v7 - (_QWORD)*v4;
    if (v14 >> 5 > v13)
      v13 = v14 >> 5;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFC0)
      v15 = 0x3FFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    if (v15)
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,16ul>>>((uint64_t)v7, v15);
    else
      v16 = 0;
    v17 = &v16[64 * v12];
    v18 = &v16[64 * v15];
    v19 = *v5;
    v20 = v5[1];
    v21 = v5[3];
    *((_OWORD *)v17 + 2) = v5[2];
    *((_OWORD *)v17 + 3) = v21;
    *(_OWORD *)v17 = v19;
    *((_OWORD *)v17 + 1) = v20;
    v11 = v17 + 64;
    v23 = (char *)*v4;
    v22 = (char *)v4[1];
    if (v22 != *v4)
    {
      do
      {
        v24 = *((_OWORD *)v22 - 4);
        v25 = *((_OWORD *)v22 - 3);
        v26 = *((_OWORD *)v22 - 1);
        *((_OWORD *)v17 - 2) = *((_OWORD *)v22 - 2);
        *((_OWORD *)v17 - 1) = v26;
        *((_OWORD *)v17 - 4) = v24;
        *((_OWORD *)v17 - 3) = v25;
        v17 -= 64;
        v22 -= 64;
      }
      while (v22 != v23);
      v22 = (char *)*v4;
    }
    *v4 = v17;
    v4[1] = v11;
    v4[2] = v18;
    if (v22)
      operator delete(v22);
  }
  else
  {
    v8 = *v5;
    v9 = v5[1];
    v10 = v5[3];
    v6[2] = v5[2];
    v6[3] = v10;
    *v6 = v8;
    v6[1] = v9;
    v11 = v6 + 4;
  }
  v4[1] = v11;
  v27 = *(void ***)(a2 + 8);
  v28 = (__int128 *)(a1 + 312);
  v29 = v27[1];
  v30 = (unint64_t)v27[2];
  if ((unint64_t)v29 >= v30)
  {
    v35 = ((char *)v29 - (_BYTE *)*v27) >> 6;
    v36 = v35 + 1;
    if ((unint64_t)(v35 + 1) >> 58)
      goto LABEL_82;
    v37 = v30 - (_QWORD)*v27;
    if (v37 >> 5 > v36)
      v36 = v37 >> 5;
    if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFC0)
      v38 = 0x3FFFFFFFFFFFFFFLL;
    else
      v38 = v36;
    if (v38)
      v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,16ul>>>((uint64_t)(v27 + 2), v38);
    else
      v39 = 0;
    v40 = &v39[64 * v35];
    v41 = &v39[64 * v38];
    v42 = *v28;
    v43 = *(_OWORD *)(a1 + 328);
    v44 = *(_OWORD *)(a1 + 360);
    *((_OWORD *)v40 + 2) = *(_OWORD *)(a1 + 344);
    *((_OWORD *)v40 + 3) = v44;
    *(_OWORD *)v40 = v42;
    *((_OWORD *)v40 + 1) = v43;
    v34 = v40 + 64;
    v46 = (char *)*v27;
    v45 = (char *)v27[1];
    if (v45 != *v27)
    {
      do
      {
        v47 = *((_OWORD *)v45 - 4);
        v48 = *((_OWORD *)v45 - 3);
        v49 = *((_OWORD *)v45 - 1);
        *((_OWORD *)v40 - 2) = *((_OWORD *)v45 - 2);
        *((_OWORD *)v40 - 1) = v49;
        *((_OWORD *)v40 - 4) = v47;
        *((_OWORD *)v40 - 3) = v48;
        v40 -= 64;
        v45 -= 64;
      }
      while (v45 != v46);
      v45 = (char *)*v27;
    }
    *v27 = v40;
    v27[1] = v34;
    v27[2] = v41;
    if (v45)
      operator delete(v45);
  }
  else
  {
    v31 = *v28;
    v32 = *(_OWORD *)(a1 + 328);
    v33 = *(_OWORD *)(a1 + 360);
    v29[2] = *(_OWORD *)(a1 + 344);
    v29[3] = v33;
    *v29 = v31;
    v29[1] = v32;
    v34 = v29 + 4;
  }
  v27[1] = v34;
  v50 = *(void ***)(a2 + 16);
  v51 = (__int128 *)(a1 + 376);
  v52 = v50[1];
  v53 = (unint64_t)v50[2];
  if ((unint64_t)v52 >= v53)
  {
    v58 = ((char *)v52 - (_BYTE *)*v50) >> 6;
    v59 = v58 + 1;
    if ((unint64_t)(v58 + 1) >> 58)
      goto LABEL_82;
    v60 = v53 - (_QWORD)*v50;
    if (v60 >> 5 > v59)
      v59 = v60 >> 5;
    if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFC0)
      v61 = 0x3FFFFFFFFFFFFFFLL;
    else
      v61 = v59;
    if (v61)
      v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,16ul>>>((uint64_t)(v50 + 2), v61);
    else
      v62 = 0;
    v63 = &v62[64 * v58];
    v64 = &v62[64 * v61];
    v65 = *v51;
    v66 = *(_OWORD *)(a1 + 392);
    v67 = *(_OWORD *)(a1 + 424);
    *((_OWORD *)v63 + 2) = *(_OWORD *)(a1 + 408);
    *((_OWORD *)v63 + 3) = v67;
    *(_OWORD *)v63 = v65;
    *((_OWORD *)v63 + 1) = v66;
    v57 = v63 + 64;
    v69 = (char *)*v50;
    v68 = (char *)v50[1];
    if (v68 != *v50)
    {
      do
      {
        v70 = *((_OWORD *)v68 - 4);
        v71 = *((_OWORD *)v68 - 3);
        v72 = *((_OWORD *)v68 - 1);
        *((_OWORD *)v63 - 2) = *((_OWORD *)v68 - 2);
        *((_OWORD *)v63 - 1) = v72;
        *((_OWORD *)v63 - 4) = v70;
        *((_OWORD *)v63 - 3) = v71;
        v63 -= 64;
        v68 -= 64;
      }
      while (v68 != v69);
      v68 = (char *)*v50;
    }
    *v50 = v63;
    v50[1] = v57;
    v50[2] = v64;
    if (v68)
      operator delete(v68);
  }
  else
  {
    v54 = *v51;
    v55 = *(_OWORD *)(a1 + 392);
    v56 = *(_OWORD *)(a1 + 424);
    v52[2] = *(_OWORD *)(a1 + 408);
    v52[3] = v56;
    *v52 = v54;
    v52[1] = v55;
    v57 = v52 + 4;
  }
  v50[1] = v57;
  v73 = *(void ***)(a2 + 24);
  v74 = (__int128 *)(a1 + 440);
  v75 = v73[1];
  v76 = (unint64_t)v73[2];
  if ((unint64_t)v75 >= v76)
  {
    v81 = ((char *)v75 - (_BYTE *)*v73) >> 6;
    v82 = v81 + 1;
    if ((unint64_t)(v81 + 1) >> 58)
      goto LABEL_82;
    v83 = v76 - (_QWORD)*v73;
    if (v83 >> 5 > v82)
      v82 = v83 >> 5;
    if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFC0)
      v84 = 0x3FFFFFFFFFFFFFFLL;
    else
      v84 = v82;
    if (v84)
      v85 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,16ul>>>((uint64_t)(v73 + 2), v84);
    else
      v85 = 0;
    v86 = &v85[64 * v81];
    v87 = &v85[64 * v84];
    v88 = *v74;
    v89 = *(_OWORD *)(a1 + 456);
    v90 = *(_OWORD *)(a1 + 488);
    *((_OWORD *)v86 + 2) = *(_OWORD *)(a1 + 472);
    *((_OWORD *)v86 + 3) = v90;
    *(_OWORD *)v86 = v88;
    *((_OWORD *)v86 + 1) = v89;
    v80 = v86 + 64;
    v92 = (char *)*v73;
    v91 = (char *)v73[1];
    if (v91 != *v73)
    {
      do
      {
        v93 = *((_OWORD *)v91 - 4);
        v94 = *((_OWORD *)v91 - 3);
        v95 = *((_OWORD *)v91 - 1);
        *((_OWORD *)v86 - 2) = *((_OWORD *)v91 - 2);
        *((_OWORD *)v86 - 1) = v95;
        *((_OWORD *)v86 - 4) = v93;
        *((_OWORD *)v86 - 3) = v94;
        v86 -= 64;
        v91 -= 64;
      }
      while (v91 != v92);
      v91 = (char *)*v73;
    }
    *v73 = v86;
    v73[1] = v80;
    v73[2] = v87;
    if (v91)
      operator delete(v91);
  }
  else
  {
    v77 = *v74;
    v78 = *(_OWORD *)(a1 + 456);
    v79 = *(_OWORD *)(a1 + 488);
    v75[2] = *(_OWORD *)(a1 + 472);
    v75[3] = v79;
    *v75 = v77;
    v75[1] = v78;
    v80 = v75 + 4;
  }
  v73[1] = v80;
  v96 = *(void ***)(a2 + 32);
  v97 = (__int128 *)(a1 + 504);
  v98 = v96[1];
  v99 = (unint64_t)v96[2];
  if ((unint64_t)v98 < v99)
  {
    v100 = *v97;
    v101 = *(_OWORD *)(a1 + 520);
    v102 = *(_OWORD *)(a1 + 552);
    v98[2] = *(_OWORD *)(a1 + 536);
    v98[3] = v102;
    *v98 = v100;
    v98[1] = v101;
    v103 = v98 + 4;
    goto LABEL_81;
  }
  v104 = ((char *)v98 - (_BYTE *)*v96) >> 6;
  v105 = v104 + 1;
  if ((unint64_t)(v104 + 1) >> 58)
LABEL_82:
    std::vector<float>::__throw_length_error[abi:ne180100]();
  v106 = v99 - (_QWORD)*v96;
  if (v106 >> 5 > v105)
    v105 = v106 >> 5;
  if ((unint64_t)v106 >= 0x7FFFFFFFFFFFFFC0)
    v107 = 0x3FFFFFFFFFFFFFFLL;
  else
    v107 = v105;
  if (v107)
    v108 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,16ul>>>((uint64_t)(v96 + 2), v107);
  else
    v108 = 0;
  v109 = &v108[64 * v104];
  v110 = &v108[64 * v107];
  v111 = *v97;
  v112 = *(_OWORD *)(a1 + 520);
  v113 = *(_OWORD *)(a1 + 552);
  *((_OWORD *)v109 + 2) = *(_OWORD *)(a1 + 536);
  *((_OWORD *)v109 + 3) = v113;
  *(_OWORD *)v109 = v111;
  *((_OWORD *)v109 + 1) = v112;
  v103 = v109 + 64;
  v115 = (char *)*v96;
  v114 = (char *)v96[1];
  if (v114 != *v96)
  {
    do
    {
      v116 = *((_OWORD *)v114 - 4);
      v117 = *((_OWORD *)v114 - 3);
      v118 = *((_OWORD *)v114 - 1);
      *((_OWORD *)v109 - 2) = *((_OWORD *)v114 - 2);
      *((_OWORD *)v109 - 1) = v118;
      *((_OWORD *)v109 - 4) = v116;
      *((_OWORD *)v109 - 3) = v117;
      v109 -= 64;
      v114 -= 64;
    }
    while (v114 != v115);
    v114 = (char *)*v96;
  }
  *v96 = v109;
  v96[1] = v103;
  v96[2] = v110;
  if (v114)
    operator delete(v114);
LABEL_81:
  v96[1] = v103;
  *(int32x2_t *)(a2 + 44) = vrev64_s32(*(int32x2_t *)(a1 + 568));
  result = *(float *)(a1 + 576);
  *(float *)(a2 + 40) = result;
  return result;
}

uint64_t Scandium::ScandiumPPG::scandium_channel_combination_t::get_return_message@<X0>(unsigned __int8 a1@<W1>, std::string *a2@<X8>)
{
  uint64_t i;
  const std::string *v4;
  _QWORD v6[5];
  unsigned __int8 v7;
  unsigned __int8 *v8;
  _QWORD v9[3];
  char v10;
  _QWORD v11[3];
  char v12;
  _QWORD v13[3];
  char v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[3];
  char v18;
  _QWORD v19[3];
  char v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  LOBYTE(v8) = 0;
  std::string::basic_string[abi:ne180100]<0>(v9, "SUCCESS");
  v10 = 1;
  std::string::basic_string[abi:ne180100]<0>(v11, "MOTION");
  v12 = 2;
  std::string::basic_string[abi:ne180100]<0>(v13, "POSTURE");
  v14 = 5;
  std::string::basic_string[abi:ne180100]<0>(v15, "LOW-Conf");
  v16 = 3;
  std::string::basic_string[abi:ne180100]<0>(v17, "STD-DEV");
  v18 = 4;
  std::string::basic_string[abi:ne180100]<0>(v19, "HWFoMs");
  v20 = 6;
  std::string::basic_string[abi:ne180100]<0>(v21, "NOT_REACHED");
  std::unordered_map<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>::unordered_map((uint64_t)v6, (unsigned __int8 *)&v8, 7);
  for (i = 0; i != -28; i -= 4)
  {
    if (SHIBYTE(v21[i + 2]) < 0)
      operator delete((void *)v21[i]);
  }
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  if (std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>(v6, &v7))
  {
    v8 = &v7;
    v4 = (const std::string *)std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::channel_combination_ret_t,std::piecewise_construct_t const&,std::tuple<Scandium::ScandiumPPG::channel_combination_ret_t const&>,std::tuple<>>((uint64_t)v6, &v7, (uint64_t)&std::piecewise_construct, &v8);
    std::string::operator=(a2, v4 + 1);
  }
  return std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::~__hash_table((uint64_t)v6);
}

void sub_24580DFA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t Scandium::ScandiumPPG::scandium_channel_combination_t::combine_channels(std::string *a1, int a2, float *a3, float *a4, float *a5, int *a6, std::string *__str)
{
  uint64_t v13;
  float v14;
  float v15;
  Scandium *return_message;
  NSObject *log;
  std::string *v19;
  std::string *v20;
  int *v21;
  std::string::size_type v22;
  std::string::size_type v23;
  std::string::size_type size;
  unint64_t v25;
  _BYTE v27[40];
  void *__p[2];
  char v29;
  std::string v30;
  uint8_t buf[4];
  std::string *v32;
  __int16 v33;
  std::string *v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  char v43;
  int v44;
  _QWORD v45[4];
  char v46;
  int v47;
  _QWORD v48[4];
  float v49;
  int v50;
  _QWORD v51[4];
  float v52;
  int v53;
  _QWORD v54[4];
  int v55;
  int v56;
  _QWORD v57[4];
  char v58;
  int v59;
  _QWORD v60[10];

  v60[9] = *MEMORY[0x24BDAC8D0];
  Scandium::ScandiumPPG::scandium_channel_combination_t::init_module(a1, __str);
  *a3 = NAN;
  *a4 = NAN;
  *a5 = NAN;
  if (a2)
  {
    v13 = Scandium::ScandiumPPG::scandium_channel_combination_t::combine_dl((Scandium::ScandiumPPG::scandium_channel_combination_t *)a1, a3, a4, a5);
    *(float *)&a1[24].__r_.__value_.__l.__data_ = *a5;
    if (a1[2].__r_.__value_.__s.__data_[0] && !*(_BYTE *)(a1[5].__r_.__value_.__r.__words[2] + 9))
    {
      *a3 = NAN;
      *a4 = NAN;
      v13 = 1;
    }
    if (a1[2].__r_.__value_.__s.__data_[1] && !*(_BYTE *)(a1[5].__r_.__value_.__r.__words[2] + 8))
    {
      *a3 = NAN;
      *a4 = NAN;
      v13 = 2;
    }
    else if (!(_DWORD)v13)
    {
      v14 = *a3;
      v15 = *a4;
      if (*(_DWORD *)a1[5].__r_.__value_.__r.__words[2] == 2 && v14 < 85.0)
      {
        v15 = v15
            * (float)(*(float *)&a1[1].__r_.__value_.__r.__words[2]
                    + (float)(*((float *)&a1[1].__r_.__value_.__r.__words[1] + 1) * v14));
        *a4 = v15;
      }
      *((float *)&a1[23].__r_.__value_.__r.__words[2] + 1) = v15;
      *(float *)&a1[23].__r_.__value_.__r.__words[2] = *a3;
      if (*a4 >= *(float *)&a1[1].__r_.__value_.__r.__words[1])
      {
        v13 = 0;
      }
      else
      {
        *a3 = NAN;
        if (*a4 == 0.0)
        {
          v13 = 4;
        }
        else if (*a4 == -1.0)
        {
          v13 = 3;
        }
        else
        {
          v13 = 5;
        }
      }
    }
  }
  else
  {
    v13 = 0;
    *a3 = stats::mean((stats *)a1[6].__r_.__value_.__l.__size_, (const float *)((a1[6].__r_.__value_.__r.__words[2] - a1[6].__r_.__value_.__l.__size_) >> 2));
  }
  return_message = (Scandium *)Scandium::ScandiumPPG::scandium_channel_combination_t::get_return_message(v13, &v30);
  log = Scandium::algs_get_log(return_message);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v19 = a1;
    if (SHIBYTE(a1->__r_.__value_.__r.__words[2]) < 0)
      v19 = (std::string *)a1->__r_.__value_.__r.__words[0];
    v20 = &v30;
    if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v20 = (std::string *)v30.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315394;
    v32 = v19;
    v33 = 2080;
    v34 = v20;
    _os_log_impl(&dword_2457F9000, log, OS_LOG_TYPE_DEFAULT, "scandium channel combination mode: %s result: %s", buf, 0x16u);
  }
  if (a1[25].__r_.__value_.__l.__size_)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "channel_combination");
    v21 = (int *)a1[5].__r_.__value_.__r.__words[2];
    std::string::basic_string[abi:ne180100]<0>(buf, "algs_mode");
    v35 = *v21;
    v36 = 1;
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[10],std::string&,0>((uint64_t)&v37, "comb_mode", (__int128 *)a1);
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[11],std::vector<float>&,0>((uint64_t)&v38, "input_spo2", (uint64_t)&a1[6].__r_.__value_.__l.__size_);
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[11],std::vector<float>&,0>((uint64_t)&v39, "input_conf", (uint64_t)&a1[7].__r_.__value_.__l.__size_);
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[13],std::vector<float>&,0>((uint64_t)&v40, "input_girpir", (uint64_t)&a1[8].__r_.__value_.__l.__size_);
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[15],std::vector<BOOL>&,0>((uint64_t)&v41, "input_valid_hw", (uint64_t)&a1[9].__r_.__value_.__l.__size_);
    v22 = a1[5].__r_.__value_.__r.__words[2];
    std::string::basic_string[abi:ne180100]<0>(v42, "input_motion_flag");
    v43 = *(_BYTE *)(v22 + 9);
    v44 = 0;
    v23 = a1[5].__r_.__value_.__r.__words[2];
    std::string::basic_string[abi:ne180100]<0>(v45, "input_posture_flag");
    v46 = *(_BYTE *)(v23 + 8);
    v47 = 0;
    std::string::basic_string[abi:ne180100]<0>(v48, "combined_spo2");
    v49 = *a3;
    v50 = 3;
    std::string::basic_string[abi:ne180100]<0>(v51, "combined_conf");
    v52 = *a4;
    v53 = 3;
    std::string::basic_string[abi:ne180100]<0>(v54, "num_valid_channels");
    v55 = *a6;
    v56 = 1;
    std::string::basic_string[abi:ne180100]<0>(v57, "enable_metrics");
    v58 = a2;
    v59 = 0;
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[7],std::string&,0>((uint64_t)v60, "result", (__int128 *)&v30);
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v27, buf, 13);
    size = a1[25].__r_.__value_.__l.__size_;
    if (!size)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(std::string::size_type, void **, _BYTE *))(*(_QWORD *)size + 48))(size, __p, v27);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v27);
    v25 = 936;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&__p[v25 / 8 + 1]);
      if ((char)v27[v25 + 39] < 0)
        operator delete(*(void **)&v27[v25 + 16]);
      v25 -= 72;
    }
    while (v25);
    if (v29 < 0)
      operator delete(__p[0]);
  }
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__r_.__value_.__l.__data_);
  return v13;
}

void sub_24580E4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27)
{
  uint64_t i;

  for (i = 864; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a27 + i));
  if (a20 < 0)
    operator delete(__p);
  if (a26 < 0)
    operator delete(a21);
  _Unwind_Resume(a1);
}

uint64_t Scandium::ScandiumPPG::scandium_channel_combination_t::combine_dl(Scandium::ScandiumPPG::scandium_channel_combination_t *this, float *a2, float *a3, float *a4)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  float v15;
  float v16;
  _BOOL4 v17;
  uint64_t v18;
  float v19;
  float v20;
  float *v21;
  float v22;
  float v23;
  float v24;
  float *v25;
  float *v26;
  float v27;
  float v28;
  float v29;
  float v30;
  unint64_t v31;
  float *v32;
  float *v33;
  uint64_t v34;
  float v35;
  float v36;
  float v37;
  double v38;
  float v39;
  float v40;
  float v41;
  uint64_t v42;
  double v43;
  float *v44;
  float v45;
  float *v46;
  float *v47;
  float v48;
  float *v49;
  float *v50;
  float *v51;
  float *v52;
  double v53;
  float *v54;
  float *v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float *v61;
  float *v62;
  float *v63;
  float *v64;
  float *v65;
  uint64_t v66;
  void *__p;
  float *v68;
  uint64_t v69;
  char v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  float *v75;
  uint64_t v76;
  void *v77;
  _BYTE *v78;
  uint64_t v79;

  v77 = 0;
  v78 = 0;
  v79 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v77, *((const void **)this + 19), *((_QWORD *)this + 20), (uint64_t)(*((_QWORD *)this + 20) - *((_QWORD *)this + 19)) >> 2);
  v74 = 0;
  v75 = 0;
  v76 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v74, *((const void **)this + 22), *((_QWORD *)this + 23), (uint64_t)(*((_QWORD *)this + 23) - *((_QWORD *)this + 22)) >> 2);
  v71 = 0;
  v72 = 0;
  v73 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v71, *((const void **)this + 25), *((_QWORD *)this + 26), (uint64_t)(*((_QWORD *)this + 26) - *((_QWORD *)this + 25)) >> 2);
  v8 = 0;
  v9 = *((_QWORD *)this + 22);
  v10 = *((_QWORD *)this + 19);
  v11 = (float *)((char *)this + 504);
  v12 = *((_QWORD *)this + 28);
  v13 = *((_QWORD *)this + 25);
  do
  {
    v14 = Scandium::ScandiumPPG::path_idx_to_type[v8];
    *(v11 - 64) = *(float *)(v9 + 4 * v8);
    *(v11 - 48) = *(float *)(v10 + 4 * v8);
    if (((*(_QWORD *)(v12 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
      v15 = 1.0;
    else
      v15 = 0.0;
    *(v11 - 32) = v15;
    *v11 = *(float *)(v13 + 4 * v8);
    v16 = *(float *)(v9 + 4 * v8);
    if (v14 == 2)
      v17 = v16 >= *((float *)this + 7);
    else
      v17 = v16 >= *((float *)this + 6);
    *(v11 - 16) = (float)v17;
    ++v8;
    ++v11;
  }
  while (v8 != 16);
  v61 = a4;
  v62 = a3;
  v63 = a2;
  v18 = 0;
  v19 = 0.0;
  v20 = 0.0;
  do
  {
    v70 = Scandium::ScandiumPPG::path_idx_to_type[v18];
    v21 = (float *)v77;
    v22 = *((float *)v77 + v18);
    v23 = 115.0;
    if (v22 <= 115.0)
      v23 = *((float *)v77 + v18);
    if (v22 >= 50.0)
      v24 = v23;
    else
      v24 = 50.0;
    *((float *)v77 + v18) = v24;
    v25 = (float *)v74;
    __p = &v70;
    v25[v18] = *((float *)std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::piecewise_construct_t const&,std::tuple<Scandium::ScandiumPPG::PathType const&>,std::tuple<>>((uint64_t)this + 56, (unsigned __int8 *)&v70, (uint64_t)&std::piecewise_construct, (_BYTE **)&__p)+ 5)* v25[v18];
    v26 = (float *)v71;
    if (v70 == 2)
    {
      *((_DWORD *)v71 + v18) = 1101004800;
      v27 = 20.0;
    }
    else
    {
      v27 = *((float *)v71 + v18);
    }
    v28 = v27 / 25.0;
    if (v27 > 50.0)
      v28 = 2.0;
    if (v27 >= -25.0)
      v29 = v28;
    else
      v29 = -1.0;
    v26[v18] = v29;
    v30 = v25[v18]
        * (float)(1.0 / (float)(expf(-(float)(*((float *)this + 25) + (float)(*((float *)this + 24) * v29))) + 1.0));
    v25[v18] = v30;
    v19 = v19 + (float)(v21[v18] * v30);
    v20 = v20 + v30;
    ++v18;
  }
  while (v18 != 16);
  v31 = 0;
  v32 = (float *)v77;
  v33 = (float *)v74;
  v34 = *((_QWORD *)this + 28);
  v35 = 0.0;
  v36 = 0.0;
  do
  {
    if (((*(_QWORD *)(v34 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v31) & 1) != 0)
      v37 = 1.0;
    else
      v37 = 0.0;
    v38 = (float)((float)(v32[v31] - (float)((float)(v19 * 0.0625) / (float)(v20 * 0.0625))) / 15.0);
    v39 = exp(v38 * v38 * *((float *)this + 26)) * v33[v31];
    v40 = v37 * v39;
    v33[v31] = v40;
    v36 = v36 + v40;
    v35 = v35 + (float)(v32[v31++] * v40);
  }
  while (v31 != 16);
  v41 = v36 * 0.0625;
  if ((float)(v36 * 0.0625) == 0.0)
  {
    v42 = 0;
    *v63 = NAN;
    *v62 = 0.0;
    *v61 = NAN;
  }
  else
  {
    *v63 = (float)(v35 * 0.0625) / v41;
    v43 = 0.0;
    if (v33 != v75)
    {
      v44 = v33;
      do
      {
        v45 = *v44++;
        v43 = v43 + v45;
      }
      while (v44 != v75);
    }
    __p = 0;
    v68 = 0;
    v69 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v33, (uint64_t)v75, v75 - v33);
    v64 = 0;
    v65 = 0;
    v66 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v64, v77, (uint64_t)v78, (v78 - (_BYTE *)v77) >> 2);
    v46 = (float *)__p;
    v47 = v68;
    if (__p != v68)
    {
      v49 = (float *)__p;
      do
      {
        v48 = v43;
        *v49 = *v49 / v48;
        ++v49;
      }
      while (v49 != v47);
    }
    v50 = v64;
    v51 = v65;
    if (v64 != v65)
    {
      v52 = v64;
      do
      {
        *v52 = (float)(*v52 - *v63) * (float)(*v52 - *v63);
        ++v52;
      }
      while (v52 != v51);
    }
    v53 = 0.0;
    if (v46 != v47)
    {
      v54 = v50;
      v55 = v46;
      do
      {
        v56 = *v55++;
        v57 = v56;
        v58 = *v54++;
        v53 = v53 + (float)(v57 * v58);
      }
      while (v55 != v47);
    }
    v59 = sqrt(v53);
    *v61 = v59;
    if (*((float *)this + 11) <= v59)
    {
      *v63 = NAN;
      *v62 = -1.0;
      if (v50)
      {
        v65 = v50;
        operator delete(v50);
        v46 = (float *)__p;
      }
      if (v46)
      {
        v68 = v46;
        operator delete(v46);
      }
      v42 = 3;
    }
    else
    {
      *v62 = v41;
      if (v50)
      {
        v65 = v50;
        operator delete(v50);
        v46 = (float *)__p;
      }
      if (v46)
      {
        v68 = v46;
        operator delete(v46);
      }
      v42 = 0;
    }
  }
  if (v71)
  {
    v72 = v71;
    operator delete(v71);
  }
  if (v74)
  {
    v75 = (float *)v74;
    operator delete(v74);
  }
  if (v77)
  {
    v78 = v77;
    operator delete(v77);
  }
  return v42;
}

void sub_24580EA58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26)
{
  if (__p)
    operator delete(__p);
  if (a19)
    operator delete(a19);
  if (a22)
    operator delete(a22);
  if (a25)
    operator delete(a25);
  _Unwind_Resume(exception_object);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  unint64_t v6;
  std::string *v7;
  std::string::size_type size;
  unint64_t v9;
  unint64_t v10;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = this->__r_.__value_.__r.__words[2];
    v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    v6 = HIBYTE(v10);
    v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v7 = this;
    if (__n > 0x16)
    {
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0)
    this->__r_.__value_.__l.__size_ = __n;
  else
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,void *> *>>(_QWORD *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t i;
  uint64_t *v8;
  unint64_t v9;
  uint64_t *v10;
  _QWORD *inserted;
  uint64_t *v12;

  v6 = a1[1];
  if (!v6)
    goto LABEL_9;
  for (i = 0; i != v6; *(_QWORD *)(*a1 + 8 * i++) = 0)
    ;
  v8 = (uint64_t *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      v9 = *((unsigned __int8 *)a2 + 16);
      *((_BYTE *)v8 + 16) = v9;
      *((_DWORD *)v8 + 5) = *((_DWORD *)a2 + 5);
      v10 = (uint64_t *)*v8;
      v8[1] = v9;
      inserted = (_QWORD *)std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_multi_prepare((uint64_t)a1, v9, (unsigned __int8 *)v8 + 16);
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_multi_perform(a1, v8, inserted);
      a2 = (uint64_t *)*a2;
      v8 = v10;
      if (!v10)
        goto LABEL_9;
    }
    do
    {
      v12 = (uint64_t *)*v8;
      operator delete(v8);
      v8 = v12;
    }
    while (v12);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_multi<std::pair<Scandium::ScandiumPPG::PathType const,float> const&>(a1, a2 + 2);
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_24580EC58(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  __cxa_begin_catch(a1);
  do
  {
    v2 = (_QWORD *)*v1;
    operator delete(v1);
    v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_24580EC78(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  unint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  _BOOL8 v10;
  size_t v11;
  unint64_t v12;
  size_t v13;
  uint8x8_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t result;
  unint64_t v19;
  unint64_t v20;
  _BOOL4 v21;
  int v22;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 2 * v6;
    v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    v11 = v10 | v9;
    v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = v11;
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__rehash<false>(a1, v13);
    v6 = *(_QWORD *)(a1 + 8);
  }
  v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    v15 = a2;
    if (v6 <= a2)
      v15 = a2 % v6;
  }
  else
  {
    v15 = (v6 - 1) & a2;
  }
  v16 = *(_QWORD *)(*(_QWORD *)a1 + 8 * v15);
  if (!v16)
    return 0;
  v17 = 0;
  do
  {
    result = v16;
    v16 = *(_QWORD *)v16;
    if (!v16)
      break;
    v19 = *(_QWORD *)(v16 + 8);
    if (v14.u32[0] > 1uLL)
    {
      v20 = *(_QWORD *)(v16 + 8);
      if (v19 >= v6)
        v20 = v19 % v6;
    }
    else
    {
      v20 = v19 & (v6 - 1);
    }
    if (v20 != v15)
      break;
    v21 = v19 == a2 && *(unsigned __int8 *)(v16 + 16) == *a3;
    v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_multi_perform(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(_QWORD *)(*result + 8 * v4) = result + 2;
    if (!*a2)
      goto LABEL_19;
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
LABEL_18:
    *(_QWORD *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
    if (v6 != v4)
      goto LABEL_18;
  }
LABEL_19:
  ++result[3];
  return result;
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__rehash<false>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__do_rehash<false>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t **v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  uint64_t *i;
  unint64_t v12;
  uint64_t *v13;
  _QWORD *v14;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(uint64_t ***)(a1 + 16);
    if (v7)
    {
      v8 = (unint64_t)v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      for (i = *v7; *v7; i = *v7)
      {
        v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2)
            v12 %= a2;
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          v7 = (uint64_t **)i;
        }
        else
        {
          v13 = i;
          if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
          {
            do
            {
              v14 = v13;
              v13 = (uint64_t *)*v13;
            }
            while (v13 && *((unsigned __int8 *)i + 16) == *((unsigned __int8 *)v13 + 16));
            *v7 = v13;
            *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = i;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
            v7 = (uint64_t **)i;
            v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_multi<std::pair<Scandium::ScandiumPPG::PathType const,float> const&>(_QWORD *a1, uint64_t *a2)
{
  unsigned __int8 *v4;
  uint64_t v5;
  _QWORD *inserted;

  v4 = (unsigned __int8 *)operator new(0x18uLL);
  v5 = *a2;
  *((_QWORD *)v4 + 2) = *a2;
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = v5;
  inserted = (_QWORD *)std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_multi_prepare((uint64_t)a1, v5, v4 + 16);
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_multi_perform(a1, v4, inserted);
  return v4;
}

void sub_24580F178(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::vector<BOOL>::push_back(uint64_t a1, _BYTE *a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64)
      v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    if (v4 <= 0x3FFFFFFFFFFFFFFELL)
      v7 = v6;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    std::vector<BOOL>::reserve((char **)a1, v7);
    v4 = *(_QWORD *)(a1 + 8);
  }
  *(_QWORD *)(a1 + 8) = v4 + 1;
  v8 = *(char **)a1;
  v9 = v4 >> 6;
  v10 = 1 << v4;
  if (*a2)
    v11 = *(_QWORD *)&v8[8 * v9] | v10;
  else
    v11 = *(_QWORD *)&v8[8 * v9] & ~v10;
  *(_QWORD *)&v8[8 * v9] = v11;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,16ul>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(a2 << 6);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[10],std::string&,0>(uint64_t a1, char *a2, __int128 *a3)
{
  std::string *v5;
  __int128 v6;

  v5 = (std::string *)(std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, a2) + 4);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v6 = *a3;
    v5->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  *(_DWORD *)(a1 + 64) = 5;
  return a1;
}

void sub_24580F2BC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[11],std::vector<float>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD *v5;

  v5 = std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, a2);
  v5[4] = 0;
  v5[5] = 0;
  v5 += 4;
  v5[2] = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v5, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2);
  *(_DWORD *)(a1 + 56) = 3;
  *(_DWORD *)(a1 + 64) = 6;
  return a1;
}

void sub_24580F328(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[13],std::vector<float>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD *v5;

  v5 = std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, a2);
  v5[4] = 0;
  v5[5] = 0;
  v5 += 4;
  v5[2] = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v5, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2);
  *(_DWORD *)(a1 + 56) = 3;
  *(_DWORD *)(a1 + 64) = 6;
  return a1;
}

void sub_24580F394(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[15],std::vector<BOOL>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD *v5;

  v5 = std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, a2);
  std::vector<BOOL>::vector(v5 + 4, a3);
  *(_DWORD *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 64) = 6;
  return a1;
}

void sub_24580F3F0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[7],std::string&,0>(uint64_t a1, char *a2, __int128 *a3)
{
  std::string *v5;
  __int128 v6;

  v5 = (std::string *)(std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, a2) + 4);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v6 = *a3;
    v5->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  *(_DWORD *)(a1 + 64) = 5;
  return a1;
}

void sub_24580F464(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__assign_unique<std::pair<Scandium::ScandiumPPG::PathType const,float> const*>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  BOOL v9;
  _QWORD *v10;
  BOOL v11;
  _QWORD *v12;

  v4 = a2;
  v6 = a1[1];
  if (v6)
  {
    for (i = 0; i != v6; ++i)
      *(_QWORD *)(*a1 + 8 * i) = 0;
    v8 = a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8)
      v9 = a2 == a3;
    else
      v9 = 1;
    if (v9)
    {
      v10 = (_QWORD *)v8;
    }
    else
    {
      do
      {
        *(_BYTE *)(v8 + 16) = *(_BYTE *)v4;
        *(_DWORD *)(v8 + 20) = *(_DWORD *)(v4 + 4);
        v10 = *(_QWORD **)v8;
        std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_unique(a1, v8);
        v4 += 8;
        if (v10)
          v11 = v4 == a3;
        else
          v11 = 1;
        v8 = (uint64_t)v10;
      }
      while (!v11);
    }
    if (v10)
    {
      do
      {
        v12 = (_QWORD *)*v10;
        operator delete(v10);
        v10 = v12;
      }
      while (v12);
    }
  }
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::pair<Scandium::ScandiumPPG::PathType const,float> const&>((uint64_t)a1, (unsigned __int8 *)v4, (_QWORD *)v4);
    v4 += 8;
  }
}

void sub_24580F55C(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  __cxa_begin_catch(a1);
  do
  {
    v2 = (_QWORD *)*v1;
    operator delete(v1);
    v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_24580F57C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_unique(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v4;
  unsigned __int8 *v5;
  uint64_t **v6;

  v2 = (_QWORD *)a2;
  v5 = (unsigned __int8 *)(a2 + 16);
  v4 = *(unsigned __int8 *)(a2 + 16);
  *((_QWORD *)v5 - 1) = v4;
  v6 = std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_unique_prepare[abi:ne180100]((uint64_t)a1, v4, v5);
  if (v6)
    return v6;
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_unique_perform[abi:ne180100](a1, v2);
  return (uint64_t **)v2;
}

uint64_t **std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_unique_prepare[abi:ne180100](uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  unint64_t v3;
  uint8x8_t v4;
  uint64_t v5;
  uint64_t ***v6;
  uint64_t **i;
  unint64_t v8;
  float v9;
  float v10;
  uint64_t v11;
  _BOOL8 v12;
  size_t v13;
  unint64_t v14;
  size_t v15;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
      v5 = v3 <= a2 ? a2 % v3 : a2;
    else
      v5 = (v3 - 1) & a2;
    v6 = *(uint64_t ****)(*(_QWORD *)a1 + 8 * v5);
    if (v6)
    {
      for (i = *v6; i; i = (uint64_t **)*i)
      {
        v8 = (unint64_t)i[1];
        if (v8 == a2)
        {
          if (*((unsigned __int8 *)i + 16) == *a3)
            return i;
        }
        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= v3)
              v8 %= v3;
          }
          else
          {
            v8 &= v3 - 1;
          }
          if (v8 != v5)
            break;
        }
      }
    }
  }
  v9 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v10 = *(float *)(a1 + 32);
  if (!v3 || (float)(v10 * (float)v3) < v9)
  {
    v11 = 2 * v3;
    v12 = v3 < 3 || (v3 & (v3 - 1)) != 0;
    v13 = v12 | v11;
    v14 = vcvtps_u32_f32(v9 / v10);
    if (v13 <= v14)
      v15 = v14;
    else
      v15 = v13;
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v15);
  }
  return 0;
}

_QWORD *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_unique_perform[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  _QWORD *v5;
  unint64_t v6;

  v2 = (int8x8_t)result[1];
  v3 = a2[1];
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(_QWORD *)&v2)
      v3 %= *(_QWORD *)&v2;
  }
  else
  {
    v3 &= *(_QWORD *)&v2 - 1;
  }
  v5 = *(_QWORD **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    *v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(_QWORD *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v2)
        v6 %= *(_QWORD *)&v2;
    }
    else
    {
      v6 &= *(_QWORD *)&v2 - 1;
    }
    v5 = (_QWORD *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::pair<Scandium::ScandiumPPG::PathType const,float> const&>(uint64_t a1, unsigned __int8 *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v7 <= v6)
        v3 = v6 % v7;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (*((unsigned __int8 *)v10 + 16) == (_DWORD)v6)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x18uLL);
  *v10 = 0;
  v10[1] = v6;
  v10[2] = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *v10 = *v19;
LABEL_38:
    *v19 = v10;
    goto LABEL_39;
  }
  *v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    v20 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_24580F9B8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::channel_combination_ret_t,std::pair<Scandium::ScandiumPPG::channel_combination_ret_t const,std::string> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_24580FA2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::channel_combination_ret_t,std::pair<Scandium::ScandiumPPG::channel_combination_ret_t const,std::string> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  uint64_t ***v8;
  uint64_t **result;
  unint64_t v10;
  float v11;
  float v12;
  _BOOL8 v13;
  unint64_t v14;
  unint64_t v15;
  size_t v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD v19[3];

  v5 = *a2;
  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
  {
    v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 <= v5)
        v3 = v5 % v6;
    }
    else
    {
      v3 = ((_DWORD)v6 - 1) & v5;
    }
    v8 = *(uint64_t ****)(*(_QWORD *)a1 + 8 * v3);
    if (v8)
    {
      for (result = *v8; result; result = (uint64_t **)*result)
      {
        v10 = (unint64_t)result[1];
        if (v10 == v5)
        {
          if (*((unsigned __int8 *)result + 16) == (_DWORD)v5)
            return result;
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v10 >= v6)
              v10 %= v6;
          }
          else
          {
            v10 &= v6 - 1;
          }
          if (v10 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__construct_node_hash<std::pair<Scandium::ScandiumPPG::channel_combination_ret_t const,std::string> const&>(a1, *a2, a3, (uint64_t)v19);
  v11 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    v13 = 1;
    if (v6 >= 3)
      v13 = (v6 & (v6 - 1)) != 0;
    v14 = v13 | (2 * v6);
    v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15)
      v16 = v15;
    else
      v16 = v14;
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v16);
    v6 = *(_QWORD *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5)
        v3 = v5 % v6;
      else
        v3 = v5;
    }
    else
    {
      v3 = ((_DWORD)v6 - 1) & v5;
    }
  }
  v17 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v17)
  {
    *(_QWORD *)v19[0] = *v17;
    *v17 = v19[0];
  }
  else
  {
    *(_QWORD *)v19[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v19[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v19[0])
    {
      v18 = *(_QWORD *)(*(_QWORD *)v19[0] + 8);
      if ((v6 & (v6 - 1)) != 0)
      {
        if (v18 >= v6)
          v18 %= v6;
      }
      else
      {
        v18 &= v6 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v18) = v19[0];
    }
  }
  result = (uint64_t **)v19[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_24580FC54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__construct_node_hash<std::pair<Scandium::ScandiumPPG::channel_combination_ret_t const,std::string> const&>(uint64_t a1@<X0>, std::string::size_type a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  std::string *v8;
  std::string *v9;

  v7 = a1 + 16;
  v8 = (std::string *)operator new(0x30uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v8->__r_.__value_.__l.__size_ = a2;
  v8->__r_.__value_.__s.__data_[16] = *(_BYTE *)a3;
  v9 = v8 + 1;
  if (*(char *)(a3 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)(a3 + 8), *(_QWORD *)(a3 + 16));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)(a3 + 8);
    v9->__r_.__value_.__r.__words[2] = *(_QWORD *)(a3 + 24);
  }
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_24580FD0C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 47) < 0)
      operator delete(__p[3]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 47) < 0)
        operator delete(v2[3]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::channel_combination_ret_t,std::piecewise_construct_t const&,std::tuple<Scandium::ScandiumPPG::channel_combination_ret_t const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _BYTE **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((unsigned __int8 *)v11 + 16) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v13 = (_QWORD *)(a1 + 16);
  v11 = operator new(0x30uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_BYTE *)v11 + 16) = **a4;
  v11[4] = 0;
  v11[5] = 0;
  v11[3] = 0;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    v16 = 1;
    if (v8 >= 3)
      v16 = (v8 & (v8 - 1)) != 0;
    v17 = v16 | (2 * v8);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v19);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *v11 = *v21;
LABEL_38:
    *v21 = v11;
    goto LABEL_39;
  }
  *v11 = *v13;
  *v13 = v11;
  *(_QWORD *)(v20 + 8 * v4) = v13;
  if (*v11)
  {
    v22 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8)
        v22 %= v8;
    }
    else
    {
      v22 &= v8 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_245810028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::piecewise_construct_t const&,std::tuple<Scandium::ScandiumPPG::PathType const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _BYTE **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((unsigned __int8 *)v11 + 16) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v11 = operator new(0x18uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_BYTE *)v11 + 16) = **a4;
  *((_DWORD *)v11 + 5) = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *v11 = *v20;
LABEL_38:
    *v20 = v11;
    goto LABEL_39;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v21 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_245810254(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::calc_ppg_ac_metrics(Scandium::ScandiumPPG *this, const float *a2, float *a3, float *a4, float *a5)
{
  signed int v7;
  void **v9;
  uint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  BOOL v16;
  float *v18;
  float *v19;
  float *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  float *v26;
  int v27;
  float *v28;
  float *v29;
  Scandium *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  float *v36;
  int v37;
  Scandium *v38;
  float v39;
  float *v40;
  float *v41;
  Scandium *v42;
  float *v43;
  float *v44;
  void *__p;
  float *v46;
  float *v47;
  void *v48[3];
  void *v49;
  void *v50;
  uint64_t v51;

  v7 = (int)a2;
  v9 = (void **)iirSOS_new(6, (uint64_t)&Scandium::ScandiumPPG::dsc_bpf_coeff_64);
  if (iirSOS_init((uint64_t)v9))
    goto LABEL_59;
  v49 = 0;
  v50 = 0;
  v51 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v49, this, (uint64_t)this + 4 * v7, v7);
  std::vector<float>::vector(v48, v7);
  __p = 0;
  v46 = 0;
  v47 = 0;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  iirSOS_process((uint64_t)v9, (float *)v49, (float *)v48[0], v7);
  if (v7 < 1)
    goto LABEL_50;
  v40 = a4;
  v41 = a3;
  v10 = 0;
  v11 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  do
  {
    v15 = v14;
    v14 = v13;
    v13 = *((float *)v48[0] + v10);
    v16 = v13 <= v14 || v15 <= v14;
    if (v15 < v14 && v14 > v13)
    {
      v18 = v46;
      if (v46 >= v47)
      {
        v20 = (float *)__p;
        v21 = ((char *)v46 - (_BYTE *)__p) >> 2;
        v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 62)
          goto LABEL_62;
        v23 = (char *)v47 - (_BYTE *)__p;
        if (((char *)v47 - (_BYTE *)__p) >> 1 > v22)
          v22 = v23 >> 1;
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL)
          v24 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v24 = v22;
        if (v24)
        {
          v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v47, v24);
          v20 = (float *)__p;
          v18 = v46;
        }
        else
        {
          v25 = 0;
        }
        v26 = (float *)&v25[4 * v21];
        *v26 = v14;
        v19 = v26 + 1;
        while (v18 != v20)
        {
          v27 = *((_DWORD *)v18-- - 1);
          *((_DWORD *)v26-- - 1) = v27;
        }
        __p = v26;
        v46 = v19;
        v47 = (float *)&v25[4 * v24];
        if (v20)
          operator delete(v20);
      }
      else
      {
        *v46 = v14;
        v19 = v18 + 1;
      }
      v46 = v19;
    }
    if (!v16)
    {
      v28 = v43;
      if (v43 >= v44)
      {
        v30 = v42;
        v31 = ((char *)v43 - (char *)v42) >> 2;
        v32 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 62)
LABEL_62:
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v33 = (char *)v44 - (char *)v42;
        if (((char *)v44 - (char *)v42) >> 1 > v32)
          v32 = v33 >> 1;
        if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL)
          v34 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v34 = v32;
        if (v34)
        {
          v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v44, v34);
          v30 = v42;
          v28 = v43;
        }
        else
        {
          v35 = 0;
        }
        v36 = (float *)&v35[4 * v31];
        *v36 = v14;
        v29 = v36 + 1;
        while (v28 != (float *)v30)
        {
          v37 = *((_DWORD *)v28-- - 1);
          *((_DWORD *)v36-- - 1) = v37;
        }
        v42 = (Scandium *)v36;
        v44 = (float *)&v35[4 * v34];
        if (v30)
          operator delete(v30);
      }
      else
      {
        *v43 = v14;
        v29 = v43 + 1;
      }
      v43 = v29;
    }
    v12 = v12 + v13;
    v11 = v11 + (float)(v13 * v13);
    ++v10;
  }
  while (v10 != v7);
  *v40 = sqrtf(fabsf((float)(v11 / (float)v7) - (float)((float)(v12 / (float)v7) * (float)(v12 / (float)v7))));
  if (v46 == __p)
    goto LABEL_50;
  v38 = v42;
  if (v43 != (float *)v42)
  {
    v39 = Scandium::sort_median((Scandium *)__p, (const float *)((unint64_t)((char *)v46 - (_BYTE *)__p) >> 2));
    *v41 = v39 - Scandium::sort_median(v42, (const float *)((unint64_t)((char *)v43 - (char *)v42) >> 2));
LABEL_50:
    v38 = v42;
  }
  if (v38)
    operator delete(v38);
  if (__p)
  {
    v46 = (float *)__p;
    operator delete(__p);
  }
  if (v48[0])
  {
    v48[1] = v48[0];
    operator delete(v48[0]);
  }
  if (v49)
  {
    v50 = v49;
    operator delete(v49);
  }
LABEL_59:
  if (v9)
    iirSOS_delete(v9);
}

void sub_2458105AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void Scandium::ScandiumPPG::calc_session_mavs(Scandium::ScandiumPPG *this@<X0>, float **a2@<X1>, int a3@<W2>, float **a4@<X8>)
{
  float *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  uint64_t v13;
  Scandium::ScandiumPPG *v14;
  float v15;
  float *v16;
  float *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  float *v23;
  int v24;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  if ((int)a2 >= 64)
  {
    v7 = 0;
    v8 = 0;
    v9 = a4 + 2;
    v10 = ((_DWORD)a2 - 63);
    v11 = a3;
    do
    {
      if ((v8 & 0x1F) == 0)
      {
        v12 = 0.0;
        if (a3 >= 1)
        {
          v13 = v11;
          v14 = this;
          do
          {
            v15 = stats::variance((stats *)(*(_QWORD *)v14 + 4 * v8), (const float *)0x40, 0);
            if (v15 > v12)
              v12 = v15;
            v14 = (Scandium::ScandiumPPG *)((char *)v14 + 8);
            --v13;
          }
          while (v13);
          v7 = a4[1];
        }
        if ((unint64_t)v7 >= *v9)
        {
          v17 = *a4;
          v18 = v7 - *a4;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v20 = *v9 - (_QWORD)v17;
          if (v20 >> 1 > v19)
            v19 = v20 >> 1;
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL)
            v21 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v21 = v19;
          if (v21)
          {
            v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v9, v21);
            v17 = *a4;
            v7 = a4[1];
          }
          else
          {
            v22 = 0;
          }
          v23 = (float *)&v22[4 * v18];
          *v23 = v12;
          v16 = v23 + 1;
          while (v7 != v17)
          {
            v24 = *((_DWORD *)v7-- - 1);
            *((_DWORD *)v23-- - 1) = v24;
          }
          *a4 = v23;
          a4[1] = v16;
          a4[2] = (float *)&v22[4 * v21];
          if (v17)
            operator delete(v17);
        }
        else
        {
          *v7 = v12;
          v16 = v7 + 1;
        }
        a4[1] = v16;
        v7 = v16;
      }
      ++v8;
    }
    while (v8 != v10);
  }
}

void sub_245810780(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

id ***Scandium::ScandiumPPG::scandium_spo2_monitor_t::scandium_spo2_monitor_t(id ***a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t i;
  Scandium *optical_gen;
  NSObject *log;
  _BOOL8 v18;
  unsigned __int8 *v19;
  uint64_t *v20;
  _QWORD *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  id **v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  char v38;
  int v39;
  _QWORD v40[5];
  _BYTE v41[24];
  _BYTE *v42;
  _BYTE v43[24];
  _BYTE *v44;
  _BYTE v45[24];
  _BYTE *v46;
  _BYTE v47[24];
  _BYTE *v48;
  __int128 buf[8];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  *a1 = 0;
  LODWORD(buf[0]) = 0;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)buf + 1, "Unknown");
  LODWORD(buf[2]) = 1;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)&buf[2] + 1, "3.0");
  LODWORD(buf[4]) = 2;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)&buf[4] + 1, "3.5");
  LODWORD(buf[6]) = 3;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)&buf[6] + 1, "3.75");
  std::unordered_map<Scandium::sc_optical_gen_e,std::string>::unordered_map((uint64_t)v40, (int *)buf, 4);
  for (i = 0; i != -8; i -= 2)
  {
    if (SHIBYTE(buf[i + 7]) < 0)
      operator delete(*((void **)&buf[i + 6] + 1));
  }
  optical_gen = (Scandium *)Scandium::find_optical_gen((unsigned __int8 **)a2);
  v39 = (int)optical_gen;
  if (v40[3] != 4)
    __assert_rtn("scandium_spo2_monitor_t", "scandium_spo2_processor.cpp", 39, "opt_gen_log.size() == static_cast<size_t>(sc_optical_gen_e::num)");
  log = Scandium::algs_get_log(optical_gen);
  v18 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (*(char *)(a2 + 23) >= 0)
      v19 = (unsigned __int8 *)a2;
    else
      v19 = *(unsigned __int8 **)a2;
    v20 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(v40, &v39);
    if (!v20)
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    v21 = v20 + 3;
    if (*((char *)v20 + 47) < 0)
      v21 = (_QWORD *)*v21;
    LODWORD(buf[0]) = 136315394;
    *(_QWORD *)((char *)buf + 4) = v19;
    WORD6(buf[0]) = 2080;
    *(_QWORD *)((char *)buf + 14) = v21;
    _os_log_impl(&dword_2457F9000, log, OS_LOG_TYPE_DEFAULT, "Scandium HW Model: %s, Opt Gen: %s", (uint8_t *)buf, 0x16u);
  }
  if (!v39 && *(_QWORD *)(a5 + 24))
  {
    v22 = Scandium::algs_get_log((Scandium *)v18);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2457F9000, v22, OS_LOG_TYPE_DEFAULT, "scandium abort handler invalid hw", (uint8_t *)buf, 2u);
    }
    LOBYTE(buf[0]) = 8;
    v23 = *(_QWORD *)(a5 + 24);
    if (!v23)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, __int128 *))(*(_QWORD *)v23 + 48))(v23, buf);
  }
  v24 = *(unsigned int *)(a3 + 116);
  if ((_DWORD)v24 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  *(_QWORD *)&buf[0] = &v38;
  v25 = ((uint64_t (*)(__int128 *, uint64_t))off_25169D468[v24])(buf, a3);
  memset(buf, 0, 115);
  Scandium::convert_legacy_start_pkt(a3, (uint64_t)buf);
  v26 = (id **)operator new();
  v27 = Scandium::find_optical_gen((unsigned __int8 **)a2);
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)v47, a4);
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)v45, a5);
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)v43, a6);
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)v41, a7);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t((uint64_t)v26, v27, buf, (uint64_t)v47, (uint64_t)v45, (uint64_t)v43, (uint64_t)v41, a8, v25);
  std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](a1, v26);
  v28 = v42;
  if (v42 == v41)
  {
    v29 = 4;
    v28 = v41;
  }
  else
  {
    if (!v42)
      goto LABEL_26;
    v29 = 5;
  }
  (*(void (**)(void))(*v28 + 8 * v29))();
LABEL_26:
  v30 = v44;
  if (v44 == v43)
  {
    v31 = 4;
    v30 = v43;
  }
  else
  {
    if (!v44)
      goto LABEL_31;
    v31 = 5;
  }
  (*(void (**)(void))(*v30 + 8 * v31))();
LABEL_31:
  v32 = v46;
  if (v46 == v45)
  {
    v33 = 4;
    v32 = v45;
  }
  else
  {
    if (!v46)
      goto LABEL_36;
    v33 = 5;
  }
  (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_36:
  v34 = v48;
  if (v48 == v47)
  {
    v35 = 4;
    v34 = v47;
    goto LABEL_40;
  }
  if (v48)
  {
    v35 = 5;
LABEL_40:
    (*(void (**)(void))(*v34 + 8 * v35))();
  }
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::~__hash_table((uint64_t)v40);
  return a1;
}

void sub_245810BE0(_Unwind_Exception *a1, uint64_t a2, id ***a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::~__hash_table((uint64_t)va);
  std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](a3, 0);
  _Unwind_Resume(a1);
}

id **std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](id ***a1, id **a2)
{
  id **result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    Scandium::ScandiumPPG::scandium_spo2_processor_t::~scandium_spo2_processor_t(result);
    JUMPOUT(0x24953BE38);
  }
  return result;
}

void Scandium::ScandiumPPG::scandium_spo2_monitor_t::~scandium_spo2_monitor_t(id ***this)
{
  std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0);
  std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0);
}

_QWORD *Scandium::ScandiumPPG::scandium_spo2_processor_t::reset(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  _QWORD *result;

  Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 632656));
  for (i = 0; i != 2048; i += 128)
    Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + i + 765496));
  for (j = 0; j != 2048; j += 128)
    Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + j + 767544));
  for (k = 0; k != 1024; k += 128)
    Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + k + 769592));
  Scandium::ScandiumPPG::scandium_calibration_t::reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 770792));
  Scandium::ScandiumPPG::scandium_calibration_t::reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 770800));
  Scandium::ScandiumPPG::scandium_signal_conditioning_t::reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 770616));
  Scandium::scandium_mvmt_detection_t::reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 770840));
  result = Scandium::ScandiumPPG::scandium_quality_metric_t::reset((_QWORD *)this + 96376);
  *((_BYTE *)this + 772524) = 0;
  *((_DWORD *)this + 193130) = 0;
  *((_QWORD *)this + 96566) = 0;
  *(_QWORD *)((char *)this + 772556) = 0;
  *(_QWORD *)((char *)this + 772548) = 0;
  *((_WORD *)this + 386282) = 0;
  return result;
}

void Scandium::ScandiumPPG::scandium_spo2_monitor_t::scandium_spo2_monitor_process(Scandium::ScandiumPPG::scandium_spo2_processor_t **a1, uint64_t a2)
{
  Scandium::ScandiumPPG::scandium_spo2_processor_t::process(*a1, a2);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::process(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, uint64_t a2)
{
  char *v4;
  char *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  Scandium *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *log;
  uint64_t v36;
  uint64_t v37;
  std::string *p_p;
  std::string *v39;
  int v40;
  int32x2_t v41;
  int v42;
  int v43;
  const float *v44;
  float v45;
  float *v46;
  float v47;
  float *v48;
  float v49;
  float *v50;
  BOOL v51;
  uint64_t v52;
  unint64_t i;
  uint64_t beats;
  _QWORD *v55;
  char *v56;
  float v57;
  int v58;
  int v59;
  unint64_t v60;
  uint64_t v61;
  __int32 v62;
  unint64_t v63;
  __int32 *v64;
  _DWORD *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  char *v75;
  int v76;
  char *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  char *v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  __int32 *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  int v96;
  __int32 v97;
  unint64_t v98;
  char *v99;
  _DWORD *v100;
  char *v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  int v107;
  int v108;
  uint64_t v109;
  float *v110;
  uint64_t v111;
  float *v112;
  uint64_t v113;
  uint64_t v114;
  int data;
  int v116;
  void *v117;
  Scandium *v118;
  NSObject *v119;
  int v120;
  uint64_t v121;
  double v122;
  double v123;
  int v124;
  Scandium *v125;
  const float *v126;
  float v127;
  float *v128;
  Scandium *v129;
  NSObject *v130;
  uint64_t v131;
  uint64_t v132;
  std::string *v133;
  std::string *v134;
  uint64_t v135;
  uint64_t v136;
  void **v137;
  _BYTE *v138;
  char *v139;
  char *v140;
  char *v141;
  char *v142;
  int *v143;
  std::string *v144;
  stats *v145;
  Scandium::ScandiumPPG::scandium_beat_detection_t *v146;
  int v147;
  std::string v148;
  void *v149[2];
  char v150;
  void *v151;
  char *v152;
  char *v153;
  _BYTE __dst[1792];
  void *v155;
  char *v156;
  char *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  void *v163;
  uint64_t v164;
  std::string __p;
  char *v166;
  char *v167;
  int32x2_t v168;
  int v169;
  int v170;
  _QWORD v171[4];
  int v172;
  int v173;
  _QWORD v174[4];
  _DWORD v175[8];
  int v176;
  uint64_t v177[4];
  char v178;
  int v179;
  uint64_t v180[4];
  char v181;
  int v182;
  uint64_t v183[4];
  std::string v184;
  int v185;
  uint64_t v186;
  uint64_t v187[4];
  int v188;
  int v189;
  uint64_t v190[4];
  int v191;
  int v192;
  uint64_t v193[4];
  int v194;
  int v195;
  uint64_t v196[4];
  int v197;
  int v198;
  uint64_t v199[4];
  char v200;
  int v201;
  uint64_t v202[4];
  char v203;
  int v204;
  uint64_t v205;
  uint8_t buf[4];
  _BYTE v207[14];
  __int16 v208;
  double v209;
  uint64_t v210;

  v210 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)this + 772520;
  v143 = (int *)((char *)this + 772112);
  v138 = (char *)this + 770698;
  v5 = (char *)this + 623320;
  v6 = *((_DWORD *)this + 193136);
  if (!v6)
  {
    Scandium::ScandiumPPG::scandium_spo2_processor_t::log_start_packet((uint64_t)this, (unsigned __int8 *)this + 120);
    v6 = *((_DWORD *)v4 + 6);
  }
  v7 = 0;
  v159 = 0;
  v158 = 0;
  v160 = 0;
  v162 = 0;
  v8 = v6;
  v164 = 0;
  v163 = 0;
  v9 = 4 * v6 + 252;
  v10 = *((unsigned __int8 *)this + 250);
  do
  {
    v11 = *(float *)(a2 + 7 + 4 * v7);
    if (v10)
      v11 = v11 * 600.0 / ((double)(*((_DWORD *)this + 61) * *((unsigned __int8 *)this + v7 + 770704)) * 10.0);
    *(float *)((char *)this + v9) = v11;
    ++v7;
    v9 += 6400;
  }
  while (v7 != 8);
  v12 = 0;
  v13 = 4 * v8 + 51452;
  do
  {
    v14 = *(float *)(a2 + 39 + 4 * v12);
    if (v10)
      v14 = v14 * 600.0 / ((double)(*((_DWORD *)this + 61) * *((unsigned __int8 *)this + v12 + 770712)) * 10.0);
    *(float *)((char *)this + v13) = v14;
    ++v12;
    v13 += 6400;
  }
  while (v12 != 16);
  v15 = 0;
  v16 = 4 * v8 + 153852;
  do
  {
    v17 = *(float *)(a2 + 103 + 4 * v15);
    if (v10)
      v17 = v17 * 600.0 / ((double)(*((_DWORD *)this + 61) * *((unsigned __int8 *)this + v15 + 770728)) * 10.0);
    *(float *)((char *)this + v16) = v17;
    ++v15;
    v16 += 6400;
  }
  while (v15 != 16);
  v18 = 0;
  v19 = (char *)this + 770700;
  v20 = 4 * v8 + 256252;
  do
  {
    v21 = *(float *)(a2 + 167 + 4 * v18);
    if (v10)
      v21 = v21 * 600.0 / ((double)(*((_DWORD *)this + 61) * v19[v18]) * 10.0);
    *(float *)((char *)this + v20) = v21;
    ++v18;
    v20 += 6400;
  }
  while (v18 != 4);
  v22 = 0;
  v23 = 4 * v8 + 281852;
  do
  {
    v24 = *(float *)(a2 + 183 + 4 * v22);
    if (v10)
      v24 = v24 * 600.0 / ((double)(*((_DWORD *)this + 61) * v19[v22]) * 10.0);
    *(float *)((char *)this + v23) = v24;
    ++v22;
    v23 += 6400;
  }
  while (v22 != 4);
  v25 = 0;
  v26 = 4 * v8 + 307452;
  do
  {
    *(float *)((char *)this + v26) = (float)*(int *)(a2 + 199 + v25) * 0.000015259;
    v25 += 4;
    v26 += 6400;
  }
  while (v25 != 12);
  v27 = 0;
  v28 = 4 * v8 + 352252;
  do
  {
    *(float *)((char *)this + v28) = (float)*(int *)(a2 + 211 + v27) * 0.0078125;
    v27 += 4;
    v28 += 6400;
  }
  while (v27 != 16);
  v29 = 0;
  v30 = 4 * v8 + 326652;
  do
  {
    *(float *)((char *)this + v30) = (float)*(int *)(a2 + 227 + v29) * 0.0078125;
    v29 += 4;
    v30 += 6400;
  }
  while (v29 != 16);
  *((float *)this + v8 + 94463) = (float)*(int *)(a2 + 243) * 0.0078125;
  *((_DWORD *)this + v8 + 156460) = *(_DWORD *)(a2 + 3);
  ++*((_DWORD *)v4 + 6);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_mvmt_posture_bailout(this);
  if (v4[44])
  {
    v32 = 4;
LABEL_33:
    v33 = *((_QWORD *)v4 + 6) | v32;
    *((_QWORD *)v4 + 6) = v33;
    goto LABEL_34;
  }
  if (v4[45])
  {
    v32 = 2;
    goto LABEL_33;
  }
  v33 = *((_QWORD *)v4 + 6);
LABEL_34:
  v34 = v33 & 0x7FF;
  if ((v33 & 0x7FF) == 0)
    goto LABEL_47;
  log = Scandium::algs_get_log(v31);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v36 = 0;
    *((_BYTE *)&__p.__r_.__value_.__s + 23) = 11;
    strcpy((char *)&__p, "00000000000");
    v37 = 10;
    do
    {
      if (((*((_QWORD *)v4 + 6) >> v36) & 1) != 0)
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        p_p->__r_.__value_.__s.__data_[v37] = 49;
      }
      ++v36;
      --v37;
    }
    while (v36 != 11);
    v39 = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v39 = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v207 = v39;
    _os_log_impl(&dword_2457F9000, log, OS_LOG_TYPE_DEFAULT, "scandium invalid session reason: %s - force processing", buf, 0xCu);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
LABEL_47:
    v40 = *((_DWORD *)v4 + 6);
    if (!v34 && (*((_DWORD *)this + v40 + 156459) & 4) == 0)
      goto LABEL_204;
    goto LABEL_51;
  }
  v40 = *((_DWORD *)v4 + 6);
LABEL_51:
  v143[5] = v40;
  Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_dropped_samples_metrics(this);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal((uint64_t)this);
  v142 = v5;
  *((_DWORD *)v4 + 5) = 0;
  if (*((int *)this + 59) >= 1)
  {
    v145 = (stats *)((char *)this + 568572);
    v146 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 632656);
    v144 = (std::string *)((char *)this + 771456);
    v141 = (char *)this + 623296;
    v139 = (char *)this + 623308;
    v140 = (char *)this + 623368;
    v41 = vdup_n_s32(0x7FC00000u);
    v136 = (uint64_t)(v5 + 16);
    v137 = (void **)(v5 + 24);
    v135 = (uint64_t)(v5 + 40);
    v147 = v40;
    do
    {
      Scandium::ScandiumPPG::scandium_spo2_processor_t::reset(this);
      v42 = *((_DWORD *)v4 + 5);
      v43 = v40 - 320 * v42;
      if (v43 >= 960)
        v43 = 960;
      if (v43 >= 1)
      {
        v44 = (const float *)(v43 & ~(v43 >> 31));
        v45 = stats::mean((stats *)((char *)this + 1280 * v42 + 307452), v44);
        Scandium::fill_valid((float *)this + 193042, v46, v45);
        v47 = stats::mean((stats *)((char *)this + 1280 * *((int *)v4 + 5) + 313852), v44);
        Scandium::fill_valid((float *)this + 193043, v48, v47);
        v49 = stats::mean((stats *)((char *)this + 1280 * *((int *)v4 + 5) + 320252), v44);
        Scandium::fill_valid((float *)this + 193044, v50, v49);
        v42 = *((_DWORD *)v4 + 5);
      }
      v51 = Scandium::ScandiumPPG::scandium_spo2_processor_t::copy_to_bga_window(this, v42, v40);
      if (*((_QWORD *)v4 + 31))
      {
        std::string::basic_string[abi:ne180100]<0>(&v155, "window_process_start");
        std::string::basic_string[abi:ne180100]<0>(&__p, "is_window_valid");
        LOBYTE(v167) = !v51;
        v170 = 0;
        std::string::basic_string[abi:ne180100]<0>(v171, "window_idx");
        v172 = *((_DWORD *)v4 + 5);
        v173 = 1;
        std::string::basic_string[abi:ne180100]<0>(v174, "num_processing_windows");
        v175[0] = *((_DWORD *)this + 59);
        v176 = 1;
        std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)buf, (unsigned __int8 *)&__p, 3);
        v52 = *((_QWORD *)v4 + 31);
        if (!v52)
          std::__throw_bad_function_call[abi:ne180100]();
        (*(void (**)(uint64_t, void **, uint8_t *))(*(_QWORD *)v52 + 48))(v52, &v155, buf);
        std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)buf);
        for (i = 0; i != -216; i -= 72)
        {
          std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v175[i / 4]);
          if (SHIBYTE(v174[i / 8 + 2]) < 0)
            operator delete((void *)v174[i / 8]);
        }
        if (SHIBYTE(v157) < 0)
          operator delete(v155);
        v40 = v147;
      }
      if (!v51)
      {
        Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_ppg(this);
        Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_process((uint64_t)v146, (stats *)((char *)this + 615616), (stats *)((char *)this + 619456), v145);
        beats = Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_get_beats(v146);
        v55 = (_QWORD *)beats;
        if (&v158 != (void **)beats)
        {
          std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&v158, *(char **)beats, *(_QWORD *)(beats + 8), (uint64_t)(*(_QWORD *)(beats + 8) - *(_QWORD *)beats) >> 2);
          v56 = (char *)v55[4];
          v161 = v55[3];
          std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&v162, v56, v55[5], (uint64_t)(v55[5] - (_QWORD)v56) >> 2);
        }
        Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_window_mvmt_posture((uint64_t)this, (uint64_t)v145);
        if (*((float *)&v161 + 1) > 0.0 && *(float *)&v161 > 0.0)
        {
          v57 = stats::mean((stats *)((char *)this + 610812), (const float *)0x3C0);
          if (v57 >= 0.0 && v57 <= 45.0)
          {
            Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga(this, (Scandium::ScandiumPPG::beats_t *)&v158);
            Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_spo2(this);
            Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_quality_metric(this);
            LODWORD(v155) = 2143289344;
            LODWORD(v151) = 2143289344;
            LODWORD(v149[0]) = 2143289344;
            LODWORD(v148.__r_.__value_.__l.__data_) = 0;
            v58 = *((unsigned __int8 *)this + 249);
            __p.__r_.__value_.__s.__data_[0] = 0;
            LOBYTE(v173) = 0;
            v59 = Scandium::ScandiumPPG::scandium_channel_combination_t::combine_channels(v144, v58, (float *)&v155, (float *)&v151, (float *)v149, (int *)&v148, &__p);
            std::__optional_destruct_base<Scandium::ScandiumPPG::channel_combination_param_t,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&__p);
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)this;
            __p.__r_.__value_.__l.__size_ = (std::string::size_type)this + 24;
            __p.__r_.__value_.__r.__words[2] = (std::string::size_type)this + 48;
            v166 = (char *)this + 72;
            v167 = (char *)this + 96;
            v168 = v41;
            v169 = 2143289344;
            Scandium::ScandiumPPG::scandium_channel_combination_t::log_coreanalytics_metrics((uint64_t)v144, (uint64_t)&__p);
            v61 = *((int *)v4 + 4);
            *(_DWORD *)&v141[4 * v61] = (_DWORD)v155;
            v62 = v168.i32[1];
            *(_DWORD *)&v139[4 * v61] = v169;
            if ((v62 & 0x7FFFFFFFu) <= 0x7F7FFFFF)
            {
              v64 = (__int32 *)*((_QWORD *)v142 + 1);
              v63 = *((_QWORD *)v142 + 2);
              if ((unint64_t)v64 >= v63)
              {
                v90 = *(__int32 **)v142;
                v91 = ((uint64_t)v64 - *(_QWORD *)v142) >> 2;
                v92 = v91 + 1;
                if ((unint64_t)(v91 + 1) >> 62)
                  goto LABEL_214;
                v93 = v63 - (_QWORD)v90;
                if (v93 >> 1 > v92)
                  v92 = v93 >> 1;
                if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFFCLL)
                  v60 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v60 = v92;
                if (v60)
                {
                  v94 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v136, v60);
                  v90 = *(__int32 **)v142;
                  v64 = (__int32 *)*((_QWORD *)v142 + 1);
                  v62 = v168.i32[1];
                }
                else
                {
                  v94 = 0;
                }
                v95 = &v94[4 * v91];
                *(_DWORD *)v95 = v62;
                v65 = v95 + 4;
                while (v64 != v90)
                {
                  v96 = *--v64;
                  *((_DWORD *)v95 - 1) = v96;
                  v95 -= 4;
                }
                *(_QWORD *)v142 = v95;
                *((_QWORD *)v142 + 1) = v65;
                *((_QWORD *)v142 + 2) = &v94[4 * v60];
                if (v90)
                  operator delete(v90);
              }
              else
              {
                *v64 = v62;
                v65 = v64 + 1;
              }
              *((_QWORD *)v142 + 1) = v65;
            }
            v97 = v168.i32[0];
            if ((v168.i32[0] & 0x7FFFFFFFu) <= 0x7F7FFFFF)
            {
              v99 = (char *)*((_QWORD *)v142 + 4);
              v98 = *((_QWORD *)v142 + 5);
              if ((unint64_t)v99 >= v98)
              {
                v101 = (char *)*v137;
                v102 = (v99 - (_BYTE *)*v137) >> 2;
                v103 = v102 + 1;
                if ((unint64_t)(v102 + 1) >> 62)
LABEL_214:
                  std::vector<float>::__throw_length_error[abi:ne180100]();
                v104 = v98 - (_QWORD)v101;
                if (v104 >> 1 > v103)
                  v103 = v104 >> 1;
                if ((unint64_t)v104 >= 0x7FFFFFFFFFFFFFFCLL)
                  v60 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v60 = v103;
                if (v60)
                {
                  v105 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v135, v60);
                  v101 = (char *)*((_QWORD *)v142 + 3);
                  v99 = (char *)*((_QWORD *)v142 + 4);
                  v97 = v168.i32[0];
                }
                else
                {
                  v105 = 0;
                }
                v106 = &v105[4 * v102];
                *(_DWORD *)v106 = v97;
                v100 = v106 + 4;
                while (v99 != v101)
                {
                  v107 = *((_DWORD *)v99 - 1);
                  v99 -= 4;
                  *((_DWORD *)v106 - 1) = v107;
                  v106 -= 4;
                }
                *((_QWORD *)v142 + 3) = v106;
                *((_QWORD *)v142 + 4) = v100;
                *((_QWORD *)v142 + 5) = &v105[4 * v60];
                if (v101)
                  operator delete(v101);
              }
              else
              {
                *(_DWORD *)v99 = v168.i32[0];
                v100 = v99 + 4;
              }
              *((_QWORD *)v142 + 4) = v100;
            }
            if (v59 == 3)
              ++v143[8];
            if (*v138 == 2)
            {
              v108 = *((_DWORD *)v4 + 5);
              switch(v108)
              {
                case 2:
                  v114 = *((unsigned int *)v4 + 4);
                  if (v114 > 2)
                    goto LABEL_213;
                  Scandium::fill_valid((float *)this + 193021, (float *)v60, *(float *)&v141[4 * v114]);
                  v111 = *((unsigned int *)v4 + 4);
                  v112 = (float *)((char *)this + 772100);
                  goto LABEL_177;
                case 1:
                  v113 = *((unsigned int *)v4 + 4);
                  if (v113 > 2)
                    goto LABEL_213;
                  Scandium::fill_valid((float *)this + 193020, (float *)v60, *(float *)&v141[4 * v113]);
                  v111 = *((unsigned int *)v4 + 4);
                  v112 = (float *)((char *)this + 772096);
LABEL_177:
                  if (v111 > 2)
LABEL_213:
                    std::__throw_out_of_range[abi:ne180100]("array::at");
                  Scandium::fill_valid(v112, v110, *(float *)&v139[4 * v111]);
                  break;
                case 0:
                  v109 = *((unsigned int *)v4 + 4);
                  if (v109 >= 3)
                    goto LABEL_213;
                  Scandium::fill_valid((float *)this + 193019, (float *)v60, *(float *)&v141[4 * v109]);
                  v111 = *((unsigned int *)v4 + 4);
                  v112 = (float *)((char *)this + 772092);
                  goto LABEL_177;
              }
            }
            data = (int)v148.__r_.__value_.__l.__data_;
            v116 = *v143;
            if (*v143 <= SLODWORD(v148.__r_.__value_.__l.__data_))
              v116 = (int)v148.__r_.__value_.__l.__data_;
            if (SLODWORD(v148.__r_.__value_.__l.__data_) >= v143[1])
              data = v143[1];
            *v143 = v116;
            v143[1] = data;
            v117 = memcpy(__dst, (char *)this + 623384, sizeof(__dst));
            *(float *)&v140[4 * *((int *)v4 + 4)] = Scandium::ScandiumPPG::scandium_spo2_processor_t::median_hr_allpaths((uint64_t)v117, (uint64_t)__dst);
            v119 = Scandium::algs_get_log(v118);
            if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
            {
              v120 = *((_DWORD *)v4 + 5);
              v121 = *((int *)v4 + 4);
              v122 = *(float *)&v141[4 * v121];
              v123 = *(float *)&v140[4 * v121];
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)v207 = v120;
              *(_WORD *)&v207[4] = 2048;
              *(double *)&v207[6] = v122;
              v208 = 2048;
              v209 = v123;
              _os_log_impl(&dword_2457F9000, v119, OS_LOG_TYPE_DEFAULT, "scandium session results: session %d spo2: %.9g hr: %.9g", buf, 0x1Cu);
            }
            v124 = *((_DWORD *)v4 + 4) + 1;
            *((_DWORD *)v4 + 4) = v124;
            v143[4] = v124;
            v40 = v147;
            goto LABEL_78;
          }
        }
        *((_QWORD *)v4 + 1) |= 0x20uLL;
      }
      LOBYTE(v59) = 6;
LABEL_78:
      if (*((_QWORD *)v4 + 31))
      {
        v66 = 0;
        v156 = 0;
        v155 = 0;
        v157 = 0;
        v151 = 0;
        v152 = 0;
        v153 = 0;
        do
        {
          if ((*((_QWORD *)v4 + 1) & (1 << v66)) != 0)
          {
            v67 = v156;
            if (v156 >= v157)
            {
              v69 = (char *)v155;
              v70 = (v156 - (_BYTE *)v155) >> 2;
              v71 = v70 + 1;
              if ((unint64_t)(v70 + 1) >> 62)
                goto LABEL_210;
              v72 = v157 - (_BYTE *)v155;
              if ((v157 - (_BYTE *)v155) >> 1 > v71)
                v71 = v72 >> 1;
              if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFFCLL)
                v73 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v73 = v71;
              if (v73)
              {
                v74 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v157, v73);
                v67 = v156;
                v69 = (char *)v155;
              }
              else
              {
                v74 = 0;
              }
              v75 = &v74[4 * v70];
              *(_DWORD *)v75 = v66;
              v68 = v75 + 4;
              while (v67 != v69)
              {
                v76 = *((_DWORD *)v67 - 1);
                v67 -= 4;
                *((_DWORD *)v75 - 1) = v76;
                v75 -= 4;
              }
              v155 = v75;
              v156 = v68;
              v157 = &v74[4 * v73];
              if (v69)
                operator delete(v69);
            }
            else
            {
              *(_DWORD *)v156 = v66;
              v68 = v67 + 4;
            }
            v156 = v68;
          }
          if ((*((_QWORD *)v4 + 6) & (1 << v66)) != 0)
          {
            v77 = v152;
            if (v152 >= v153)
            {
              v79 = (char *)v151;
              v80 = (v152 - (_BYTE *)v151) >> 2;
              v81 = v80 + 1;
              if ((unint64_t)(v80 + 1) >> 62)
LABEL_210:
                std::vector<float>::__throw_length_error[abi:ne180100]();
              v82 = v153 - (_BYTE *)v151;
              if ((v153 - (_BYTE *)v151) >> 1 > v81)
                v81 = v82 >> 1;
              if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFFCLL)
                v83 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v83 = v81;
              if (v83)
              {
                v84 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v153, v83);
                v79 = (char *)v151;
                v77 = v152;
              }
              else
              {
                v84 = 0;
              }
              v85 = &v84[4 * v80];
              *(_DWORD *)v85 = v66;
              v78 = v85 + 4;
              while (v77 != v79)
              {
                v86 = *((_DWORD *)v77 - 1);
                v77 -= 4;
                *((_DWORD *)v85 - 1) = v86;
                v85 -= 4;
              }
              v151 = v85;
              v152 = v78;
              v153 = &v84[4 * v83];
              if (v79)
                operator delete(v79);
            }
            else
            {
              *(_DWORD *)v152 = v66;
              v78 = v77 + 4;
            }
            v152 = v78;
          }
          ++v66;
        }
        while (v66 != 11);
        std::string::basic_string[abi:ne180100]<0>(v149, "window_process_end");
        std::string::basic_string[abi:ne180100]<0>(&__p, "window_posture_valid");
        LOBYTE(v167) = *v4;
        v170 = 0;
        std::string::basic_string[abi:ne180100]<0>(v171, "window_movement_valid");
        LOBYTE(v172) = v4[1];
        v173 = 0;
        std::string::basic_string[abi:ne180100]<0>(v174, "window_wrist_is_rotated");
        LOBYTE(v175[0]) = v4[2];
        v176 = 0;
        std::string::basic_string[abi:ne180100]<0>(v177, "window_arm_is_hanging");
        v178 = v4[3];
        v179 = 0;
        std::string::basic_string[abi:ne180100]<0>(v180, "window_is_session_full");
        v181 = v4[4];
        v182 = 0;
        Scandium::ScandiumPPG::scandium_channel_combination_t::get_return_message(v59, &v148);
        std::string::basic_string[abi:ne180100]<0>(v183, "channel_combination_return");
        v40 = v147;
        v184 = v148;
        memset(&v148, 0, sizeof(v148));
        v185 = 5;
        std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[23],std::vector<int>&,0>((uint64_t)&v186, "window_invalid_reasons", (uint64_t)&v155);
        std::string::basic_string[abi:ne180100]<0>(v187, "invalid_sample_counter_total");
        v188 = *((_DWORD *)v4 + 7);
        v189 = 1;
        std::string::basic_string[abi:ne180100]<0>(v190, "invalid_sample_counter_cont");
        v191 = *((_DWORD *)v4 + 8);
        v192 = 1;
        std::string::basic_string[abi:ne180100]<0>(v193, "invalid_accl_sample_counter_total");
        v194 = *((_DWORD *)v4 + 9);
        v195 = 1;
        std::string::basic_string[abi:ne180100]<0>(v196, "invalid_accl_sample_counter_cont");
        v197 = *((_DWORD *)v4 + 10);
        v198 = 1;
        std::string::basic_string[abi:ne180100]<0>(v199, "posture_abort");
        v200 = v4[44];
        v201 = 0;
        std::string::basic_string[abi:ne180100]<0>(v202, "movement_abort");
        v203 = v4[45];
        v204 = 0;
        std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[24],std::vector<int>&,0>((uint64_t)&v205, "session_invalid_reasons", (uint64_t)&v151);
        std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)buf, (unsigned __int8 *)&__p, 14);
        v87 = *((_QWORD *)v4 + 31);
        if (!v87)
          std::__throw_bad_function_call[abi:ne180100]();
        (*(void (**)(uint64_t, void **, uint8_t *))(*(_QWORD *)v87 + 48))(v87, v149, buf);
        std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)buf);
        v88 = 1008;
        do
        {
          std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v160 + v88);
          if (*((char *)&v158 + v88 + 7) < 0)
            operator delete((&v156)[(unint64_t)v88 / 8]);
          v88 -= 72;
        }
        while (v88);
        if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v148.__r_.__value_.__l.__data_);
        if (v150 < 0)
          operator delete(v149[0]);
        if (v151)
        {
          v152 = (char *)v151;
          operator delete(v151);
        }
        if (v155)
        {
          v156 = (char *)v155;
          operator delete(v155);
        }
      }
      *((_QWORD *)v4 + 6) |= *((_QWORD *)v4 + 1);
      v89 = *((_DWORD *)v4 + 5) + 1;
      *((_DWORD *)v4 + 5) = v89;
    }
    while (v89 < *((_DWORD *)this + 59));
  }
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_hw_fom_core_analytics(this);
  v126 = (const float *)*((unsigned int *)v4 + 4);
  if ((int)v126 < 1
    || (v127 = stats::max((stats *)((char *)this + 623296), v126),
        (float)(v127 - stats::min((stats *)((char *)this + 623296), (const float *)*((unsigned int *)v4 + 4))) >= 7.0))
  {
    if ((*((_WORD *)v4 + 24) & 0x7FF) != 0)
    {
      v129 = (Scandium *)Scandium::algs_get_log(v125);
      if (v129)
      {
        v130 = Scandium::algs_get_log(v129);
        if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
        {
          v131 = 0;
          *((_BYTE *)&__p.__r_.__value_.__s + 23) = 11;
          strcpy((char *)&__p, "00000000000");
          v132 = 10;
          do
          {
            if (((*((_QWORD *)v4 + 6) >> v131) & 1) != 0)
            {
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v133 = &__p;
              else
                v133 = (std::string *)__p.__r_.__value_.__r.__words[0];
              v133->__r_.__value_.__s.__data_[v132] = 49;
            }
            ++v131;
            --v132;
          }
          while (v131 != 11);
          v134 = &__p;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v134 = (std::string *)__p.__r_.__value_.__r.__words[0];
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v207 = v134;
          _os_log_impl(&dword_2457F9000, v130, OS_LOG_TYPE_DEFAULT, "Scandium algs bailout due to: %s", buf, 0xCu);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
    }
    Scandium::ScandiumPPG::scandium_spo2_processor_t::invoke_abort(this);
  }
  else
  {
    Scandium::ScandiumPPG::scandium_spo2_processor_t::report_rslts(this, v128);
  }
LABEL_204:
  if (v162)
  {
    v163 = v162;
    operator delete(v162);
  }
  if (v158)
  {
    v159 = v158;
    operator delete(v158);
  }
}

void sub_2458121C8(_Unwind_Exception *a1)
{
  Scandium::ScandiumPPG::beats_t::~beats_t((Scandium::ScandiumPPG::beats_t *)&STACK[0x908]);
  _Unwind_Resume(a1);
}

void *Scandium::ScandiumPPG::scandium_spo2_monitor_t::get_core_analytics@<X0>(Scandium::ScandiumPPG::scandium_spo2_monitor_t *this@<X0>, void *a2@<X8>)
{
  return memcpy(a2, (const void *)(*(_QWORD *)this + 772072), 0x1B8uLL);
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, char a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  double v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  std::string *v37;
  int v38;
  uint64_t v39;
  const std::string::value_type *v40;
  NSObject *log;
  std::string *v42;
  int v43;
  int v44;
  __int128 v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  __int128 v53;
  uint64_t v58;
  _QWORD *v59;
  std::string v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  std::string *v64;
  _QWORD v65[3];
  _QWORD *v66;
  _QWORD v67[3];
  _QWORD *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  v12 = a1 + 772348;
  v13 = a1 + 770680;
  v14 = a1 + 632488;
  v58 = a1 + 772616;
  v59 = (_QWORD *)(a1 + 625816);
  v15 = (_OWORD *)(a1 + 623320);
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  v16 = *a3;
  v17 = a3[1];
  v18 = a3[2];
  *(_OWORD *)(a1 + 168) = a3[3];
  *(_OWORD *)(a1 + 152) = v18;
  *(_OWORD *)(a1 + 136) = v17;
  *(_OWORD *)(a1 + 120) = v16;
  v19 = a3[4];
  v20 = a3[5];
  v21 = a3[6];
  *(_DWORD *)(a1 + 231) = *(_DWORD *)((char *)a3 + 111);
  *(_OWORD *)(a1 + 216) = v21;
  *(_OWORD *)(a1 + 200) = v20;
  *(_OWORD *)(a1 + 184) = v19;
  *(_BYTE *)(a1 + 249) = a8;
  *(_BYTE *)(a1 + 250) = a9;
  bzero((void *)(a1 + 614656), 0x3C0uLL);
  v22 = 0;
  v15[1] = 0u;
  v15[2] = 0u;
  *v15 = 0u;
  do
  {
    Scandium::ScandiumPPG::BGA_t::reset((Scandium::ScandiumPPG::BGA_t *)(a1 + 623384 + v22));
    v22 += 112;
  }
  while (v22 != 1792);
  *v59 = 0;
  v59[1] = 0;
  v59[2] = 0;
  *(_OWORD *)v14 = 0u;
  *(_OWORD *)(v14 + 16) = 0u;
  *(_OWORD *)(v14 + 32) = 0u;
  *(_OWORD *)(v14 + 48) = 0u;
  *(_OWORD *)(v14 + 64) = 0u;
  *(_OWORD *)(v14 + 80) = 0u;
  *(_OWORD *)(v14 + 96) = 0u;
  *(_QWORD *)(v14 + 112) = 0;
  Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_t((Scandium::ScandiumPPG::scandium_beat_detection_t *)(a1 + 632656));
  for (i = 0; i != 2048; i += 128)
    Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)(a1 + 765496 + i));
  for (j = 0; j != 2048; j += 128)
    Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)(a1 + 767544 + j));
  for (k = 0; k != 1024; k += 128)
    v26 = Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)(a1 + 769592 + k));
  Scandium::ScandiumPPG::scandium_signal_conditioning_t::scandium_signal_conditioning_t(a1 + 770616, a2, v26);
  Scandium::ScandiumPPG::scandium_calibration_t::reset((Scandium::ScandiumPPG::scandium_calibration_t *)(a1 + 770792));
  Scandium::ScandiumPPG::scandium_spo2_t::scandium_spo2_t((Scandium::ScandiumPPG::scandium_spo2_t *)(a1 + 770800));
  v67[0] = &off_25169D488;
  v67[1] = a1;
  v68 = v67;
  v65[0] = &off_25169D508;
  v65[1] = a1;
  v66 = v65;
  Scandium::scandium_mvmt_detection_t::scandium_mvmt_detection_t(a1 + 770840, v67, v65);
  v27 = v66;
  if (v66 == v65)
  {
    v29 = 4;
    v27 = v65;
    v28 = v58;
  }
  else
  {
    v28 = v58;
    if (!v66)
      goto LABEL_14;
    v29 = 5;
  }
  (*(void (**)(void))(*v27 + 8 * v29))();
LABEL_14:
  v30 = v68;
  if (v68 == v67)
  {
    v31 = 4;
    v30 = v67;
  }
  else
  {
    if (!v68)
      goto LABEL_19;
    v31 = 5;
  }
  (*(void (**)(void))(*v30 + 8 * v31))();
LABEL_19:
  Scandium::ScandiumPPG::scandium_quality_metric_t::scandium_quality_metric_t(a1 + 771008, *((_BYTE *)a3 + 13), a2, *((unsigned __int8 *)a3 + 107), *((unsigned __int16 *)a3 + 54));
  Scandium::ScandiumPPG::scandium_channel_combination_t::scandium_channel_combination_t(a1 + 771456, v12 + 164, a1 + 625176);
  __asm { FMOV            V0.4S, #-1.0 }
  *(_OWORD *)v12 = _Q0;
  *(_OWORD *)(v12 + 16) = _Q0;
  *(_OWORD *)(v12 + 32) = _Q0;
  *(_OWORD *)(v12 + 48) = _Q0;
  *(_OWORD *)(v12 + 64) = _Q0;
  *(_OWORD *)(v12 + 80) = _Q0;
  *(_OWORD *)(v12 + 96) = _Q0;
  *(_OWORD *)(v12 + 112) = _Q0;
  *(_OWORD *)(v12 + 128) = _Q0;
  *(_OWORD *)(v12 + 144) = _Q0;
  v53 = _Q0;
  *(_QWORD *)(v12 + 180) = 0;
  *(_QWORD *)(v12 + 220) = 0;
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100](v28, a4);
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100](v28 + 32, a5);
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100](v28 + 64, a6);
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100](v28 + 96, a7);
  *(_QWORD *)(v28 + 152) = 0;
  v37 = (std::string *)std::string::basic_string[abi:ne180100]<0>(&v60, "ppg");
  v38 = *(unsigned __int8 *)(v13 + 18);
  if (v38 == 1)
  {
    v39 = 0x200000001;
    v40 = "-foreground";
  }
  else
  {
    if (v38 != 2)
      goto LABEL_24;
    v39 = 0x400000003;
    v40 = "-background";
  }
  *(_QWORD *)(a1 + 236) = v39;
  v37 = std::string::append(&v60, v40, 0xBuLL);
LABEL_24:
  log = Scandium::algs_get_log((Scandium *)v37);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v42 = &v60;
    if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v42 = (std::string *)v60.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315394;
    v62 = "11.1.3";
    v63 = 2080;
    v64 = v42;
    _os_log_impl(&dword_2457F9000, log, OS_LOG_TYPE_DEFAULT, "Scandium Algs v%s Mode: %s", buf, 0x16u);
  }
  Scandium::ScandiumPPG::scandium_spo2_processor_t::reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)a1);
  if ((_DWORD)a2 == 1)
    v43 = 2388286;
  else
    v43 = 4608846;
  *(_DWORD *)(a1 + 244) = v43;
  *(_DWORD *)(v12 + 168) = a2;
  v44 = *((unsigned __int8 *)a3 + 13);
  *(_DWORD *)(v12 + 164) = v44;
  *(_DWORD *)(v12 + 196) = 0;
  *(_DWORD *)(v12 + 188) = 0;
  *(_BYTE *)v13 = *(_BYTE *)a3;
  *(_WORD *)(v13 + 2) = *(_WORD *)((char *)a3 + 1);
  *(_QWORD *)(v13 + 8) = *(_QWORD *)((char *)a3 + 3);
  *(_WORD *)(v13 + 16) = *(_WORD *)((char *)a3 + 11);
  *(_BYTE *)(v13 + 18) = v44;
  *(_BYTE *)(v13 + 19) = *((_BYTE *)a3 + 14);
  *(_OWORD *)(a1 + 772072) = 0u;
  *(_OWORD *)(a1 + 772088) = 0u;
  *(_OWORD *)(a1 + 772104) = 0u;
  *(_QWORD *)(a1 + 772117) = 0;
  *(_OWORD *)(a1 + 772128) = 0u;
  *(_OWORD *)(a1 + 772144) = 0u;
  *(_OWORD *)(a1 + 772160) = 0u;
  *(_OWORD *)(a1 + 772176) = 0u;
  *(_OWORD *)(a1 + 772192) = 0u;
  *(_OWORD *)(a1 + 772208) = 0u;
  *(_QWORD *)(a1 + 772222) = 0;
  *(_OWORD *)(a1 + 772232) = 0u;
  *(_OWORD *)(a1 + 772248) = 0u;
  *(_OWORD *)(a1 + 772264) = 0u;
  *(_OWORD *)(a1 + 772280) = 0u;
  *(_OWORD *)(a1 + 772296) = 0u;
  *(_OWORD *)(a1 + 772312) = 0u;
  *(_OWORD *)(a1 + 772328) = 0u;
  *(_DWORD *)(a1 + 772344) = 0;
  *(_BYTE *)(v12 + 160) = 0;
  *(_WORD *)(v12 + 162) = 0;
  *(_OWORD *)(v13 + 1408) = v53;
  *(_OWORD *)(v13 + 1424) = xmmword_245827E10;
  *(_WORD *)(v13 + 1440) = *((_WORD *)a3 + 55);
  *(_BYTE *)(v13 + 1442) = *((_BYTE *)a3 + 112);
  *(_WORD *)(v13 + 1443) = *(_WORD *)((char *)a3 + 113);
  __asm { FMOV            V0.2S, #-1.0 }
  *(_QWORD *)(v13 + 1512) = _D0;
  *(_OWORD *)(v13 + 1480) = xmmword_245827E20;
  *(_OWORD *)(v13 + 1496) = xmmword_245827E30;
  *(_QWORD *)&v46 = -1;
  *((_QWORD *)&v46 + 1) = -1;
  *(_QWORD *)(v13 + 1452) = -1;
  *(_OWORD *)(a1 + 772316) = v46;
  *(_OWORD *)(a1 + 772332) = v46;
  *(_OWORD *)v12 = v53;
  *(_OWORD *)(v12 + 16) = v53;
  *(_DWORD *)(v12 + 32) = -1082130432;
  *(_OWORD *)(v12 + 36) = v53;
  *(_OWORD *)(v12 + 52) = v53;
  *(_OWORD *)(v12 + 68) = v53;
  *(_OWORD *)(v12 + 84) = v53;
  *(_OWORD *)(v12 + 100) = v53;
  *(_OWORD *)(v12 + 116) = v53;
  *(_OWORD *)(v12 + 132) = v53;
  *(_QWORD *)(v12 + 148) = _D0;
  *(_DWORD *)(v12 + 156) = -1082130432;
  *(_DWORD *)(v13 + 1600) = -1082130432;
  *(_QWORD *)(v13 + 1520) = 0xBF800000C0000000;
  *(_BYTE *)(v12 + 160) = *((_BYTE *)a3 + 107);
  *(_WORD *)(v12 + 162) = *((_WORD *)a3 + 54);
  *(_BYTE *)(a1 + 248) = 1;
  v47 = *(unsigned __int8 *)(v13 + 18);
  if (v47 == 1)
  {
    v50 = 0x4000000020;
    v48 = 0x200000001;
    v49 = 0x40C000003F800000;
    v51 = 64;
  }
  else
  {
    if (v47 != 2)
      goto LABEL_36;
    v48 = 0x400000003;
    v49 = 981668463;
    v50 = 0xA0000000A0;
    v51 = 1600;
  }
  *(_QWORD *)(a1 + 236) = v48;
  *(_QWORD *)(v12 + 228) = v50;
  *(_DWORD *)(v12 + 236) = v51;
  *(_DWORD *)(v12 + 240) = 981668463;
  *(_QWORD *)(v12 + 244) = v49;
  *(_DWORD *)(v12 + 260) = 1060439283;
  *(_DWORD *)(v12 + 252) = 0;
  *(_DWORD *)(v12 + 256) = 0;
LABEL_36:
  Scandium::scandium_mvmt_detection_t::set_config((int32x2_t *)(a1 + 770840), a1 + 772576);
  *(_DWORD *)(v13 + 20) = *(_DWORD *)((char *)a3 + 15);
  *(_QWORD *)(v13 + 24) = *(_QWORD *)((char *)a3 + 19);
  *(_OWORD *)(a1 + 770712) = *(__int128 *)((char *)a3 + 27);
  *(_OWORD *)(a1 + 770728) = *(__int128 *)((char *)a3 + 43);
  *(_OWORD *)(a1 + 770744) = *(__int128 *)((char *)a3 + 59);
  *(_OWORD *)(a1 + 770760) = *(__int128 *)((char *)a3 + 75);
  *(_OWORD *)(a1 + 770776) = *(__int128 *)((char *)a3 + 91);
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v60.__r_.__value_.__l.__data_);
  return a1;
}

void sub_245812A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, Scandium::ScandiumPPG::scandium_channel_combination_t *a10, Scandium::ScandiumPPG::scandium_quality_metric_t *a11, id **a12, Scandium::ScandiumPPG::scandium_calibration_t *a13, Scandium::ScandiumPPG::scandium_signal_conditioning_t *a14, Scandium::ScandiumPPG::scandium_beat_detection_t *a15, uint64_t a16, uint64_t a17, uint64_t a18, Scandium::scandium_mvmt_detection_t *a19, uint64_t a20,uint64_t a21,_QWORD *a22,_QWORD *a23,_QWORD *a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD *v57;
  uint64_t v58;
  void *v59;
  _QWORD *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;

  if (a31 < 0)
    operator delete(__p);
  v36 = (_QWORD *)a24[19];
  if (v36 == a24 + 16)
  {
    v37 = 4;
    v36 = a24 + 16;
  }
  else
  {
    if (!v36)
      goto LABEL_8;
    v37 = 5;
  }
  (*(void (**)(void))(*v36 + 8 * v37))();
LABEL_8:
  v38 = (_QWORD *)a24[15];
  if (v38 == v32)
  {
    v39 = 4;
    v38 = v32;
  }
  else
  {
    if (!v38)
      goto LABEL_13;
    v39 = 5;
  }
  (*(void (**)(void))(*v38 + 8 * v39))();
LABEL_13:
  v40 = (_QWORD *)a24[11];
  if (v40 == a22)
  {
    v41 = 4;
    v40 = a22;
  }
  else
  {
    if (!v40)
      goto LABEL_18;
    v41 = 5;
  }
  (*(void (**)(void))(*v40 + 8 * v41))();
LABEL_18:
  v42 = (_QWORD *)a24[7];
  if (v42 == a23)
  {
    v43 = 4;
    v42 = a23;
  }
  else
  {
    if (!v42)
      goto LABEL_23;
    v43 = 5;
  }
  (*(void (**)(void))(*v42 + 8 * v43))();
LABEL_23:
  v44 = (_QWORD *)a24[3];
  if (v44 == a24)
  {
    v45 = 4;
  }
  else
  {
    if (!v44)
    {
LABEL_28:
      Scandium::ScandiumPPG::scandium_channel_combination_t::~scandium_channel_combination_t(a10);
      Scandium::ScandiumPPG::scandium_quality_metric_t::~scandium_quality_metric_t(a11);
      Scandium::scandium_mvmt_detection_t::~scandium_mvmt_detection_t(a19);
      Scandium::ScandiumPPG::scandium_spo2_t::~scandium_spo2_t(a12);
      Scandium::ScandiumPPG::scandium_calibration_t::reset(a13);
      Scandium::ScandiumPPG::scandium_signal_conditioning_t::~scandium_signal_conditioning_t(a14);
      for (i = 0; i != -1024; i -= 128)
        Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)(v31 + 770488 + i));
      for (j = 0; j != -2048; j -= 128)
        Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)(v31 + 769464 + j));
      for (k = 0; k != -2048; k -= 128)
        Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)(v31 + 767416 + k));
      Scandium::ScandiumPPG::scandium_beat_detection_t::~scandium_beat_detection_t(a15);
      v49 = *(void **)(v33 + 96);
      if (v49)
      {
        *(_QWORD *)(v33 + 104) = v49;
        operator delete(v49);
      }
      v50 = *(void **)(v33 + 72);
      if (v50)
      {
        *(_QWORD *)(v33 + 80) = v50;
        operator delete(v50);
      }
      v51 = *(void **)(v33 + 48);
      if (v51)
      {
        *(_QWORD *)(v33 + 56) = v51;
        operator delete(v51);
      }
      v52 = *(void **)(v33 + 24);
      if (v52)
      {
        *(_QWORD *)(v33 + 32) = v52;
        operator delete(v52);
      }
      v53 = *(void **)v33;
      if (*(_QWORD *)v33)
      {
        *(_QWORD *)(v33 + 8) = v53;
        operator delete(v53);
      }
      v54 = *(void **)a25;
      if (*(_QWORD *)a25)
      {
        *(_QWORD *)(a25 + 8) = v54;
        operator delete(v54);
      }
      v55 = *(void **)(a16 + 24);
      if (v55)
      {
        *(_QWORD *)(a16 + 32) = v55;
        operator delete(v55);
      }
      v56 = *(void **)a16;
      if (*(_QWORD *)a16)
      {
        *(_QWORD *)(a16 + 8) = v56;
        operator delete(v56);
      }
      v57 = v34 + 96;
      v58 = -384;
      while (1)
      {
        v59 = (void *)*(v57 - 1);
        if (v59)
        {
          *v57 = v59;
          operator delete(v59);
        }
        v57 -= 3;
        v58 += 24;
        if (!v58)
        {
          v60 = v34 + 48;
          v61 = -384;
          while (1)
          {
            v62 = (void *)*(v60 - 1);
            if (v62)
            {
              *v60 = v62;
              operator delete(v62);
            }
            v60 -= 3;
            v61 += 24;
            if (!v61)
            {
              v63 = -192;
              while (1)
              {
                v64 = (void *)*(v34 - 1);
                if (v64)
                {
                  *v34 = v64;
                  operator delete(v64);
                }
                v34 -= 3;
                v63 += 24;
                if (!v63)
                {
                  v65 = *(void **)(v31 + 96);
                  if (v65)
                  {
                    *(_QWORD *)(v31 + 104) = v65;
                    operator delete(v65);
                  }
                  v66 = *(void **)(v31 + 72);
                  if (v66)
                  {
                    *(_QWORD *)(v31 + 80) = v66;
                    operator delete(v66);
                  }
                  v67 = *(void **)(v31 + 48);
                  if (v67)
                  {
                    *(_QWORD *)(v31 + 56) = v67;
                    operator delete(v67);
                  }
                  v68 = *(void **)(v31 + 24);
                  if (v68)
                  {
                    *(_QWORD *)(v31 + 32) = v68;
                    operator delete(v68);
                  }
                  v69 = *(void **)v31;
                  if (*(_QWORD *)v31)
                  {
                    *(_QWORD *)(v31 + 8) = v69;
                    operator delete(v69);
                  }
                  _Unwind_Resume(a1);
                }
              }
            }
          }
        }
      }
    }
    v45 = 5;
    a24 = (_QWORD *)a24[3];
  }
  (*(void (**)(void))(*a24 + 8 * v45))();
  goto LABEL_28;
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::~scandium_spo2_processor_t(id **this)
{
  NSObject *log;
  int v3;
  Scandium::ScandiumPPG::scandium_spo2_processor_t *v4;
  uint64_t v5;
  Scandium::ScandiumPPG::scandium_spo2_processor_t *v6;
  uint64_t v7;
  Scandium::ScandiumPPG::scandium_spo2_processor_t *v8;
  uint64_t v9;
  Scandium::ScandiumPPG::scandium_spo2_processor_t *v10;
  uint64_t v11;
  void **v12;
  void **v13;
  void **v14;
  _QWORD *v15;
  Scandium::ScandiumPPG::scandium_spo2_processor_t *v16;
  uint64_t v17;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  id *v21;
  id *v22;
  id *v23;
  id *v24;
  id *v25;
  id *v26;
  id *v27;
  id *v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  _QWORD *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id *v37;
  id *v38;
  id *v39;
  id *v40;
  id *v41;
  _DWORD v42[2];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  log = Scandium::algs_get_log((Scandium *)this);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *((_DWORD *)this + 193136);
    v42[0] = 67109120;
    v42[1] = v3;
    _os_log_impl(&dword_2457F9000, log, OS_LOG_TYPE_DEFAULT, "scandium process packet counts: %d", (uint8_t *)v42, 8u);
  }
  v4 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)this[96596];
  if (v4 == (Scandium::ScandiumPPG::scandium_spo2_processor_t *)(this + 96593))
  {
    v5 = 4;
    v4 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)(this + 96593);
  }
  else
  {
    if (!v4)
      goto LABEL_8;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
LABEL_8:
  v6 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)this[96592];
  if (v6 == (Scandium::ScandiumPPG::scandium_spo2_processor_t *)(this + 96589))
  {
    v7 = 4;
    v6 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)(this + 96589);
  }
  else
  {
    if (!v6)
      goto LABEL_13;
    v7 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v6 + 8 * v7))();
LABEL_13:
  v8 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)this[96588];
  if (v8 == (Scandium::ScandiumPPG::scandium_spo2_processor_t *)(this + 96585))
  {
    v9 = 4;
    v8 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)(this + 96585);
  }
  else
  {
    if (!v8)
      goto LABEL_18;
    v9 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v8 + 8 * v9))();
LABEL_18:
  v10 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)this[96584];
  if (v10 == (Scandium::ScandiumPPG::scandium_spo2_processor_t *)(this + 96581))
  {
    v11 = 4;
    v10 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)(this + 96581);
  }
  else
  {
    if (!v10)
      goto LABEL_23;
    v11 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v10 + 8 * v11))();
LABEL_23:
  v12 = (void **)(this + 79061);
  v13 = (void **)(this + 78227);
  v14 = (void **)(this + 77915);
  v15 = this + 76854;
  v16 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)this[96580];
  if (v16 == (Scandium::ScandiumPPG::scandium_spo2_processor_t *)(this + 96577))
  {
    v17 = 4;
    v16 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)(this + 96577);
    goto LABEL_27;
  }
  if (v16)
  {
    v17 = 5;
LABEL_27:
    (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
  }
  Scandium::ScandiumPPG::scandium_channel_combination_t::~scandium_channel_combination_t((Scandium::ScandiumPPG::scandium_channel_combination_t *)(this + 96432));
  Scandium::ScandiumPPG::scandium_quality_metric_t::~scandium_quality_metric_t((Scandium::ScandiumPPG::scandium_quality_metric_t *)(this + 96376));
  Scandium::scandium_mvmt_detection_t::~scandium_mvmt_detection_t((Scandium::scandium_mvmt_detection_t *)(this + 96355));
  Scandium::ScandiumPPG::scandium_spo2_t::~scandium_spo2_t(this + 96350);
  Scandium::ScandiumPPG::scandium_calibration_t::reset((Scandium::ScandiumPPG::scandium_calibration_t *)(this + 96349));
  Scandium::ScandiumPPG::scandium_signal_conditioning_t::~scandium_signal_conditioning_t((Scandium::ScandiumPPG::scandium_signal_conditioning_t *)(this + 96327));
  for (i = 0; i != -128; i -= 16)
    Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)&this[i + 96311]);
  for (j = 0; j != -256; j -= 16)
    Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)&this[j + 96183]);
  for (k = 0; k != -256; k -= 16)
    Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)&this[k + 95927]);
  Scandium::ScandiumPPG::scandium_beat_detection_t::~scandium_beat_detection_t((Scandium::ScandiumPPG::scandium_beat_detection_t *)(this + 79082));
  v21 = this[79073];
  if (v21)
  {
    this[79074] = v21;
    operator delete(v21);
  }
  v22 = this[79070];
  if (v22)
  {
    this[79071] = v22;
    operator delete(v22);
  }
  v23 = this[79067];
  if (v23)
  {
    this[79068] = v23;
    operator delete(v23);
  }
  v24 = this[79064];
  if (v24)
  {
    this[79065] = v24;
    operator delete(v24);
  }
  v25 = (id *)*v12;
  if (*v12)
  {
    this[79062] = v25;
    operator delete(v25);
  }
  v26 = (id *)*v13;
  if (*v13)
  {
    this[78228] = v26;
    operator delete(v26);
  }
  v27 = this[77918];
  if (v27)
  {
    this[77919] = v27;
    operator delete(v27);
  }
  v28 = (id *)*v14;
  if (*v14)
  {
    this[77916] = v28;
    operator delete(v28);
  }
  v29 = this + 76950;
  v30 = -384;
  do
  {
    v31 = (void *)*(v29 - 1);
    if (v31)
    {
      *v29 = v31;
      operator delete(v31);
    }
    v29 -= 3;
    v30 += 24;
  }
  while (v30);
  v32 = this + 76902;
  v33 = -384;
  do
  {
    v34 = (void *)*(v32 - 1);
    if (v34)
    {
      *v32 = v34;
      operator delete(v34);
    }
    v32 -= 3;
    v33 += 24;
  }
  while (v33);
  v35 = -192;
  do
  {
    v36 = (void *)*(v15 - 1);
    if (v36)
    {
      *v15 = v36;
      operator delete(v36);
    }
    v15 -= 3;
    v35 += 24;
  }
  while (v35);
  v37 = this[12];
  if (v37)
  {
    this[13] = v37;
    operator delete(v37);
  }
  v38 = this[9];
  if (v38)
  {
    this[10] = v38;
    operator delete(v38);
  }
  v39 = this[6];
  if (v39)
  {
    this[7] = v39;
    operator delete(v39);
  }
  v40 = this[3];
  if (v40)
  {
    this[4] = v40;
    operator delete(v40);
  }
  v41 = *this;
  if (*this)
  {
    this[1] = v41;
    operator delete(v41);
  }
}

void sub_2458131F0(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

float Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_median_hr(int a1, const float *a2, stats *this)
{
  float result;

  if ((_DWORD)a2 == 3)
    return stats::median(this, a2);
  if ((_DWORD)a2 == 2)
    return stats::mean(this, a2);
  result = 0.0;
  if ((_DWORD)a2 == 1)
    return *(float *)this->cp_time;
  return result;
}

float Scandium::ScandiumPPG::scandium_spo2_processor_t::median_hr_allpaths(uint64_t a1, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  int *v5;
  int *v6;
  stats *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  stats *v13;
  int v14;
  float v15;
  stats *__p;
  char *v18;
  char *v19;

  v3 = 0;
  v4 = 0;
  __p = 0;
  v18 = 0;
  v19 = 0;
  do
  {
    v5 = (int *)(a2 + 112 * v4 + 96);
    if (v3 >= v19)
    {
      v7 = __p;
      v8 = (v3 - (char *)__p) >> 2;
      v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 62)
        std::vector<float>::__throw_length_error[abi:ne180100]();
      v10 = v19 - (char *)__p;
      if ((v19 - (char *)__p) >> 1 > v9)
        v9 = v10 >> 1;
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL)
        v11 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v11 = v9;
      if (v11)
      {
        v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v19, v11);
        v7 = __p;
        v3 = v18;
      }
      else
      {
        v12 = 0;
      }
      v13 = (stats *)&v12[4 * v8];
      v13->cp_time[0] = *v5;
      v6 = &v13->cp_time[1];
      while (v3 != (char *)v7)
      {
        v14 = *((_DWORD *)v3 - 1);
        v3 -= 4;
        v13[-1].if_opackets = v14;
        v13 = (stats *)((char *)v13 - 4);
      }
      __p = v13;
      v19 = &v12[4 * v11];
      if (v7)
        operator delete(v7);
    }
    else
    {
      *(_DWORD *)v3 = *v5;
      v6 = (int *)(v3 + 4);
    }
    v18 = (char *)v6;
    ++v4;
    v3 = (char *)v6;
  }
  while (v4 != 16);
  v15 = stats::median(__p, (const float *)0x10);
  if (__p)
    operator delete(__p);
  return v15;
}

void sub_245813384(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL Scandium::ScandiumPPG::scandium_spo2_processor_t::copy_to_bga_window(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, int a2, int a3)
{
  char *v5;
  int v6;
  int v7;
  int v8;
  char *v9;
  unsigned int *v10;
  int v11;
  unsigned int v12;
  _BOOL8 v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;

  v5 = (char *)this + 772524;
  v6 = 320 * a2;
  v7 = 320 * a2 + 960;
  if (v7 >= a3)
    v8 = a3;
  else
    v8 = 320 * a2 + 960;
  v9 = (char *)this + 4 * v6;
  if (v8 > 320 * a2)
  {
    v10 = (unsigned int *)(v9 + 625840);
    v11 = v8 - v6;
    do
    {
      v12 = *v10++;
      Scandium::flag_to_abort_reason(v12, (_QWORD *)this + 96566);
      --v11;
    }
    while (v11);
  }
  v13 = (*((_WORD *)v5 + 2) & 0x7FF) != 0;
  if (v7 <= a3)
  {
    *v5 = 1;
    v14 = v6;
    v15 = v9 + 252;
    v16 = -30720;
    do
    {
      memmove((char *)this + v16 + 414972, v15, 0xF00uLL);
      v15 += 6400;
      v16 += 3840;
    }
    while (v16);
    v17 = 0;
    v18 = (char *)this + 4 * v14 + 51452;
    do
    {
      memmove((char *)this + v17 + 414972, v18, 0xF00uLL);
      v17 += 3840;
      v18 += 6400;
    }
    while (v17 != 61440);
    v19 = 0;
    v20 = (char *)this + 4 * v14 + 153852;
    do
    {
      memmove((char *)this + v19 + 476412, v20, 0xF00uLL);
      v19 += 3840;
      v20 += 6400;
    }
    while (v19 != 61440);
    v21 = (char *)this + 4 * v14 + 256252;
    v22 = -15360;
    do
    {
      memmove((char *)this + v22 + 553212, v21, 0xF00uLL);
      v21 += 6400;
      v22 += 3840;
    }
    while (v22);
    v23 = (char *)this + 4 * v14 + 281852;
    v24 = -15360;
    do
    {
      memmove((char *)this + v24 + 568572, v23, 0xF00uLL);
      v23 += 6400;
      v24 += 3840;
    }
    while (v24);
    v25 = (char *)this + 4 * v14 + 307452;
    v26 = -11520;
    do
    {
      memmove((char *)this + v26 + 580092, v25, 0xF00uLL);
      v25 += 6400;
      v26 += 3840;
    }
    while (v26);
    v27 = (char *)this + 4 * v14 + 352252;
    v28 = -15360;
    do
    {
      memmove((char *)this + v28 + 610812, v27, 0xF00uLL);
      v27 += 6400;
      v28 += 3840;
    }
    while (v28);
    v29 = (char *)this + 4 * v14 + 326652;
    v30 = -15360;
    do
    {
      memmove((char *)this + v30 + 595452, v29, 0xF00uLL);
      v29 += 6400;
      v30 += 3840;
    }
    while (v30);
    memmove((char *)this + 610812, (char *)this + 4 * v14 + 377852, 0xF00uLL);
  }
  else
  {
    *v5 = 0;
    return 1;
  }
  return v13;
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_processor_t::invoke_abort(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v1;
  unsigned __int8 v2;

  v1 = *((_QWORD *)this + 96571);
  if ((v1 & 1) != 0)
  {
    v2 = 0;
  }
  else if ((v1 & 2) != 0)
  {
    v2 = 1;
  }
  else if ((v1 & 4) != 0)
  {
    v2 = 2;
  }
  else if ((v1 & 0x20) != 0)
  {
    v2 = 5;
  }
  else if ((v1 & 0x200) != 0)
  {
    v2 = 9;
  }
  else if ((v1 & 0x40) != 0)
  {
    v2 = 6;
  }
  else if ((v1 & 0x400) != 0)
  {
    v2 = 10;
  }
  else if ((v1 & 0x80) != 0)
  {
    v2 = 7;
  }
  else
  {
    v2 = 8;
  }
  return Scandium::ScandiumPPG::scandium_spo2_processor_t::abort_handler_proxy((unsigned __int8 *)this, v2);
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_processor_t::abort_handler_proxy(unsigned __int8 *a1, int a2)
{
  int *v4;
  NSObject *log;
  int v6;
  const char *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  NSObject *v18;
  uint32_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  NSObject *v24;
  int v25;
  void *__p[2];
  uint64_t v27;
  void *v28[2];
  uint64_t v29;
  void *v30[2];
  uint64_t v31;
  _BYTE v32[8];
  _BYTE v33[40];
  void *v34[2];
  char v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  int v39;
  uint64_t v40[4];
  int v41;
  int v42;
  uint64_t v43[4];
  __int128 v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t v48[4];
  __int128 v49;
  uint64_t v50;
  int v51;
  int v52;
  uint64_t v53[4];
  __int128 v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58[4];
  int v59;
  int v60;
  uint64_t v61[4];
  int v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = (int *)(a1 + 772536);
  switch(a2)
  {
    case 0:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v6 = v4[2];
        *(_DWORD *)buf = 67109120;
        v37 = v6;
        v7 = "scandium abort handler pkt %d: thermistor_broken";
        goto LABEL_24;
      }
      break;
    case 1:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v4[2];
        *(_DWORD *)buf = 67109120;
        v37 = v13;
        v7 = "scandium abort handler pkt %d: motion";
        goto LABEL_24;
      }
      break;
    case 2:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v4[2];
        *(_DWORD *)buf = 67109120;
        v37 = v10;
        v7 = "scandium abort handler pkt %d: posture";
        goto LABEL_24;
      }
      break;
    case 3:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v4[2];
        *(_DWORD *)buf = 67109120;
        v37 = v11;
        v7 = "scandium abort handler pkt %d: low HR";
        goto LABEL_24;
      }
      break;
    case 4:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v4[2];
        *(_DWORD *)buf = 67109120;
        v37 = v8;
        v7 = "scandium abort handler pkt %d: high HR";
        goto LABEL_24;
      }
      break;
    case 5:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v4[2];
        *(_DWORD *)buf = 67109120;
        v37 = v14;
        v7 = "scandium abort handler pkt %d: poor_signal";
        goto LABEL_24;
      }
      break;
    case 6:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v4[2];
        *(_DWORD *)buf = 67109120;
        v37 = v15;
        v7 = "scandium abort handler pkt %d: samples_dropped";
        goto LABEL_24;
      }
      break;
    case 7:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v4[2];
        *(_DWORD *)buf = 67109120;
        v37 = v12;
        v7 = "scandium abort handler pkt %d: hardware_recovery";
        goto LABEL_24;
      }
      break;
    case 8:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v4[2];
        *(_DWORD *)buf = 67109120;
        v37 = v17;
        v7 = "scandium abort handler pkt %d: err_failed";
        goto LABEL_24;
      }
      break;
    case 9:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v4[2];
        *(_DWORD *)buf = 67109120;
        v37 = v9;
        v7 = "scandium abort handler pkt %d: accel_poor_signal";
        goto LABEL_24;
      }
      break;
    case 10:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v4[2];
        *(_DWORD *)buf = 67109120;
        v37 = v16;
        v7 = "scandium abort handler pkt %d: excessive_invalid_samples";
LABEL_24:
        v18 = log;
        v19 = 8;
        goto LABEL_25;
      }
      break;
    default:
      v24 = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v4[2];
        *(_DWORD *)buf = 67109376;
        v37 = v25;
        v38 = 1024;
        v39 = a2;
        v7 = "scandium abort handler pkt %d: %d";
        v18 = v24;
        v19 = 14;
LABEL_25:
        _os_log_impl(&dword_2457F9000, v18, OS_LOG_TYPE_DEFAULT, v7, buf, v19);
      }
      break;
  }
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics((Scandium::ScandiumPPG::scandium_spo2_processor_t *)a1);
  if (*((_QWORD *)v4 + 29))
  {
    std::string::basic_string[abi:ne180100]<0>(v34, "abort");
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[13],char const(&)[7],0>((uint64_t)buf, "algs_version", "11.1.3");
    std::string::basic_string[abi:ne180100]<0>(v40, "algs_mode");
    v41 = a1[770698];
    v42 = 1;
    v20 = *v4;
    v30[1] = 0;
    v31 = 0;
    v30[0] = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v30, a1 + 623296, (uint64_t)&a1[4 * v20 + 623296], v20);
    std::string::basic_string[abi:ne180100]<0>(v43, "window_spo2");
    v44 = *(_OWORD *)v30;
    v45 = v31;
    v30[1] = 0;
    v31 = 0;
    v30[0] = 0;
    v46 = 3;
    v47 = 6;
    v28[0] = 0;
    v28[1] = 0;
    v29 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v28, a1 + 623308, (uint64_t)(a1 + 623320), 3uLL);
    std::string::basic_string[abi:ne180100]<0>(v48, "window_spo2_no_conf_gate");
    v49 = *(_OWORD *)v28;
    v50 = v29;
    v28[1] = 0;
    v29 = 0;
    v28[0] = 0;
    v51 = 3;
    v52 = 6;
    __p[0] = 0;
    __p[1] = 0;
    v27 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(__p, a1 + 623368, (uint64_t)(a1 + 623380), 3uLL);
    std::string::basic_string[abi:ne180100]<0>(v53, "window_hr");
    v54 = *(_OWORD *)__p;
    v55 = v27;
    __p[1] = 0;
    v27 = 0;
    __p[0] = 0;
    v56 = 3;
    v57 = 6;
    std::string::basic_string[abi:ne180100]<0>(v58, "abort_reason");
    v59 = a2;
    v60 = 1;
    std::string::basic_string[abi:ne180100]<0>(v61, "packet_idx");
    v62 = v4[2];
    v63 = 1;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v33, buf, 7);
    v21 = *((_QWORD *)v4 + 29);
    if (!v21)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, void **, _BYTE *))(*(_QWORD *)v21 + 48))(v21, v34, v33);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v33);
    v22 = 504;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v33[v22 + 24]);
      if ((char)v33[v22 + 15] < 0)
        operator delete(*(void **)&v32[v22]);
      v22 -= 72;
    }
    while (v22);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v28[0])
    {
      v28[1] = v28[0];
      operator delete(v28[0]);
    }
    if (v30[0])
    {
      v30[1] = v30[0];
      operator delete(v30[0]);
    }
    if (v35 < 0)
      operator delete(v34[0]);
    Scandium::ScandiumPPG::scandium_spo2_processor_t::log_core_analytics((Scandium::ScandiumPPG::scandium_spo2_processor_t *)a1);
  }
  result = *((_QWORD *)v4 + 17);
  if (result)
  {
    buf[0] = a2;
    return (*(uint64_t (**)(uint64_t, uint8_t *))(*(_QWORD *)result + 48))(result, buf);
  }
  return result;
}

void sub_245813D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,char a32)
{
  uint64_t i;

  for (i = 432; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a32 + i));
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  if (a17)
    operator delete(a17);
  if (a31 < 0)
    operator delete(a26);
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::log_start_packet(uint64_t a1, unsigned __int8 *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  void *__p[2];
  uint64_t v7;
  void *v8[2];
  uint64_t v9;
  void *v10[2];
  uint64_t v11;
  void *v12[2];
  uint64_t v13;
  void *v14[2];
  uint64_t v15;
  void *v16[2];
  uint64_t v17;
  void *v18[2];
  uint64_t v19;
  _BYTE v20[8];
  _BYTE v21[40];
  void *v22[2];
  char v23;
  _QWORD v24[4];
  int v25;
  int v26;
  _QWORD v27[4];
  int v28;
  int v29;
  _QWORD v30[8];
  int v31;
  _QWORD v32[4];
  int v33;
  int v34;
  _QWORD v35[4];
  int v36;
  int v37;
  _QWORD v38[4];
  int v39;
  int v40;
  _QWORD v41[4];
  __int128 v42;
  uint64_t v43;
  int v44;
  int v45;
  _QWORD v46[4];
  __int128 v47;
  uint64_t v48;
  int v49;
  int v50;
  _QWORD v51[4];
  __int128 v52;
  uint64_t v53;
  int v54;
  int v55;
  _QWORD v56[4];
  __int128 v57;
  uint64_t v58;
  int v59;
  int v60;
  _QWORD v61[4];
  __int128 v62;
  uint64_t v63;
  int v64;
  int v65;
  _QWORD v66[4];
  __int128 v67;
  uint64_t v68;
  int v69;
  int v70;
  _QWORD v71[4];
  __int128 v72;
  uint64_t v73;
  int v74;
  int v75;
  _QWORD v76[4];
  int v77;
  int v78;
  _QWORD v79[4];
  int v80;
  int v81;
  _QWORD v82[4];
  int v83;
  int v84;
  _QWORD v85[4];
  int v86;
  int v87;
  _QWORD v88[4];
  int v89;
  int v90;
  _QWORD v91[4];
  int v92;
  int v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)(a1 + 772768);
  if (*(_QWORD *)(a1 + 772768))
  {
    std::string::basic_string[abi:ne180100]<0>(v22, "start_packet");
    std::string::basic_string[abi:ne180100]<0>(v24, "frame_type");
    v25 = *a2;
    v26 = 1;
    std::string::basic_string[abi:ne180100]<0>(v27, "frame_index");
    v28 = *(unsigned __int16 *)(a2 + 1);
    v29 = 1;
    v4 = *(_QWORD *)(a2 + 3);
    std::string::basic_string[abi:ne180100]<0>(v30, "rtp_timestamp");
    v30[4] = v4;
    v31 = 2;
    std::string::basic_string[abi:ne180100]<0>(v32, "num_of_samples");
    v33 = *(unsigned __int16 *)(a2 + 11);
    v34 = 1;
    std::string::basic_string[abi:ne180100]<0>(v35, "sc_algs_mode");
    v36 = a2[13];
    v37 = 1;
    std::string::basic_string[abi:ne180100]<0>(v38, "cookie");
    v39 = a2[14];
    v40 = 1;
    v18[0] = 0;
    v18[1] = 0;
    v19 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((char *)v18, a2 + 15, a2 + 19, 4uLL);
    std::string::basic_string[abi:ne180100]<0>(v41, "blank_tia_gains");
    v42 = *(_OWORD *)v18;
    v43 = v19;
    v18[1] = 0;
    v19 = 0;
    v18[0] = 0;
    v44 = 1;
    v45 = 6;
    v16[0] = 0;
    v16[1] = 0;
    v17 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((char *)v16, a2 + 19, a2 + 27, 8uLL);
    std::string::basic_string[abi:ne180100]<0>(v46, "green_tia_gains");
    v47 = *(_OWORD *)v16;
    v48 = v17;
    v16[1] = 0;
    v17 = 0;
    v16[0] = 0;
    v49 = 1;
    v50 = 6;
    v14[0] = 0;
    v14[1] = 0;
    v15 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((char *)v14, a2 + 27, a2 + 43, 0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(v51, "red_tia_gains");
    v52 = *(_OWORD *)v14;
    v53 = v15;
    v14[1] = 0;
    v15 = 0;
    v14[0] = 0;
    v54 = 1;
    v55 = 6;
    v12[0] = 0;
    v12[1] = 0;
    v13 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((char *)v12, a2 + 43, a2 + 59, 0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(v56, "ir_tia_gains");
    v57 = *(_OWORD *)v12;
    v58 = v13;
    v12[1] = 0;
    v13 = 0;
    v12[0] = 0;
    v59 = 1;
    v60 = 6;
    v10[0] = 0;
    v10[1] = 0;
    v11 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(v10, a2 + 59, (uint64_t)(a2 + 75), 4uLL);
    std::string::basic_string[abi:ne180100]<0>(v61, "green_iled");
    v62 = *(_OWORD *)v10;
    v63 = v11;
    v10[1] = 0;
    v11 = 0;
    v10[0] = 0;
    v64 = 3;
    v65 = 6;
    v8[0] = 0;
    v8[1] = 0;
    v9 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(v8, a2 + 75, (uint64_t)(a2 + 91), 4uLL);
    std::string::basic_string[abi:ne180100]<0>(v66, "red_iled");
    v67 = *(_OWORD *)v8;
    v68 = v9;
    v8[1] = 0;
    v9 = 0;
    v8[0] = 0;
    v69 = 3;
    v70 = 6;
    __p[0] = 0;
    __p[1] = 0;
    v7 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(__p, a2 + 91, (uint64_t)(a2 + 107), 4uLL);
    std::string::basic_string[abi:ne180100]<0>(v71, "ir_iled");
    v72 = *(_OWORD *)__p;
    v73 = v7;
    __p[1] = 0;
    v7 = 0;
    __p[0] = 0;
    v74 = 3;
    v75 = 6;
    std::string::basic_string[abi:ne180100]<0>(v76, "hfw");
    v77 = a2[107];
    v78 = 1;
    std::string::basic_string[abi:ne180100]<0>(v79, "win_len");
    v80 = *((unsigned __int16 *)a2 + 54);
    v81 = 1;
    std::string::basic_string[abi:ne180100]<0>(v82, "agc_opc_duration_ms");
    v83 = *((unsigned __int16 *)a2 + 55);
    v84 = 1;
    std::string::basic_string[abi:ne180100]<0>(v85, "agc_opc_green_fs_enum");
    v86 = a2[112];
    v87 = 1;
    std::string::basic_string[abi:ne180100]<0>(v88, "agc_opc_num_retries");
    v89 = a2[113];
    v90 = 1;
    std::string::basic_string[abi:ne180100]<0>(v91, "agc_opc_num_converged");
    v92 = a2[114];
    v93 = 1;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v21, (unsigned __int8 *)v24, 19);
    if (!*v2)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(_QWORD, void **, _BYTE *))(*(_QWORD *)*v2 + 48))(*v2, v22, v21);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v21);
    v5 = 1368;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v21[v5 + 24]);
      if ((char)v21[v5 + 15] < 0)
        operator delete(*(void **)&v20[v5]);
      v5 -= 72;
    }
    while (v5);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v8[0])
    {
      v8[1] = v8[0];
      operator delete(v8[0]);
    }
    if (v10[0])
    {
      v10[1] = v10[0];
      operator delete(v10[0]);
    }
    if (v12[0])
    {
      v12[1] = v12[0];
      operator delete(v12[0]);
    }
    if (v14[0])
    {
      v14[1] = v14[0];
      operator delete(v14[0]);
    }
    if (v16[0])
    {
      v16[1] = v16[0];
      operator delete(v16[0]);
    }
    if (v18[0])
    {
      v18[1] = v18[0];
      operator delete(v18[0]);
    }
    if (v23 < 0)
      operator delete(v22[0]);
  }
}

void sub_2458143D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47,char a48)
{
  uint64_t i;

  for (i = 1296; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a48 + i));
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  if (a17)
    operator delete(a17);
  if (a21)
    operator delete(a21);
  if (a25)
    operator delete(a25);
  if (a29)
    operator delete(a29);
  if (a33)
    operator delete(a33);
  if (a47 < 0)
    operator delete(a42);
  _Unwind_Resume(a1);
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(uint64_t this)
{
  _QWORD *v1;
  uint64_t v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t i;
  void *__p[2];
  uint64_t v13;
  void *v14[2];
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD v19[2];
  int v20;
  void *v21[2];
  char v22;
  __int128 v23;
  uint64_t v24;
  int v25;
  int v26;
  _QWORD v27[4];
  __int128 v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v1 = (_QWORD *)(this + 772768);
  if (*(_QWORD *)(this + 772768))
  {
    v2 = this;
    memset(v19, 0, sizeof(v19));
    v20 = 1065353216;
    v17 = 115;
    v18 = 0x900000000000000;
    v16 = *(void **)"green_dcs";
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(this + 252), (char *)(this + 51452), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      v17 = 7;
      v3 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 7;
      v3 = (char *)&v16;
    }
    strcpy(v3, "red_dcs");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 51452), (char *)(v2 + 153852), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      v17 = 6;
      v4 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 6;
      v4 = (char *)&v16;
    }
    strcpy(v4, "ir_dcs");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 153852), (char *)(v2 + 256252), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      v17 = 9;
      v5 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 9;
      v5 = (char *)&v16;
    }
    strcpy(v5, "blank_dcs");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 256252), (char *)(v2 + 281852), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      v17 = 11;
      v6 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 11;
      v6 = (char *)&v16;
    }
    strcpy(v6, "blank_light");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 281852), (char *)(v2 + 307452), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      v17 = 5;
      v7 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 5;
      v7 = (char *)&v16;
    }
    strcpy(v7, "accel");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 307452), (char *)(v2 + 326652), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      v17 = 13;
      v8 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 13;
      v8 = (char *)&v16;
    }
    strcpy(v8, "ir_wavelength");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 326652), (char *)(v2 + 352252), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      v17 = 14;
      v9 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 14;
      v9 = (char *)&v16;
    }
    strcpy(v9, "red_wavelength");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 352252), (char *)(v2 + 377852), (uint64_t)v19, (const void **)&v16);
    v14[0] = 0;
    v14[1] = 0;
    v15 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v14, (const void *)(v2 + 377852), v2 + 384252, 0x640uLL);
    std::string::basic_string[abi:ne180100]<0>(v21, "temperature");
    v23 = *(_OWORD *)v14;
    v24 = v15;
    v14[1] = 0;
    v15 = 0;
    v14[0] = 0;
    v25 = 3;
    v26 = 6;
    __p[0] = 0;
    __p[1] = 0;
    v13 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)__p, (int *)(v2 + 625840), (int *)(v2 + 632240), 0x640uLL);
    std::string::basic_string[abi:ne180100]<0>(v27, "failure_flags");
    v10 = 0;
    v28 = *(_OWORD *)__p;
    v29 = v13;
    __p[1] = 0;
    v13 = 0;
    __p[0] = 0;
    v30 = 1;
    v31 = 6;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&>((uint64_t)v19, (unsigned __int8 *)&v21[v10], (__int128 *)&v21[v10]);
      v10 += 9;
    }
    while (v10 != 18);
    for (i = 0; i != -18; i -= 9)
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v28 + i * 8);
      if (SHIBYTE(v27[i + 2]) < 0)
        operator delete((void *)v27[i]);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v14[0])
    {
      v14[1] = v14[0];
      operator delete(v14[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(v21, "input_buffer");
    if (!*v1)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(_QWORD, void **, _OWORD *))(*(_QWORD *)*v1 + 48))(*v1, v21, v19);
    if (v22 < 0)
      operator delete(v21[0]);
    if (SHIBYTE(v18) < 0)
      operator delete(v16);
    return std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v19);
  }
  return this;
}

void sub_245814A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a21 < 0)
    operator delete(__p);
  std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)&a22);
  _Unwind_Resume(a1);
}

void std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>(char *a1, char *a2, uint64_t a3, const void **a4)
{
  char *v7;
  int v8;
  size_t v9;
  std::string *v10;
  const void *v11;
  std::string *v12;
  std::string::size_type size;
  std::string *v14;
  void *v15;
  char v16;
  char *v17;
  void *v18[2];
  uint64_t v19;
  std::string v20;
  std::string v21;
  _QWORD v22[2];
  void *__p;
  _BYTE v24[15];
  char v25;
  __int128 v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a1 != a2)
  {
    v7 = a1;
    v8 = 0;
    do
    {
      if (*((char *)a4 + 23) >= 0)
        v9 = *((unsigned __int8 *)a4 + 23);
      else
        v9 = (size_t)a4[1];
      std::string::basic_string[abi:ne180100]((uint64_t)&v21, v9 + 1);
      if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v10 = &v21;
      else
        v10 = (std::string *)v21.__r_.__value_.__r.__words[0];
      if (v9)
      {
        if (*((char *)a4 + 23) >= 0)
          v11 = a4;
        else
          v11 = *a4;
        memmove(v10, v11, v9);
      }
      *(_WORD *)((char *)&v10->__r_.__value_.__l.__data_ + v9) = 95;
      std::to_string(&v20, v8);
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v12 = &v20;
      else
        v12 = (std::string *)v20.__r_.__value_.__r.__words[0];
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v20.__r_.__value_.__r.__words[2]);
      else
        size = v20.__r_.__value_.__l.__size_;
      v14 = std::string::append(&v21, (const std::string::value_type *)v12, size);
      v15 = (void *)v14->__r_.__value_.__r.__words[0];
      v22[0] = v14->__r_.__value_.__l.__size_;
      *(_QWORD *)((char *)v22 + 7) = *(std::string::size_type *)((char *)&v14->__r_.__value_.__r.__words[1] + 7);
      v16 = HIBYTE(v14->__r_.__value_.__r.__words[2]);
      v14->__r_.__value_.__l.__size_ = 0;
      v14->__r_.__value_.__r.__words[2] = 0;
      v14->__r_.__value_.__r.__words[0] = 0;
      v17 = v7 + 6400;
      v18[0] = 0;
      v18[1] = 0;
      v19 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(v18, v7, (uint64_t)(v7 + 6400), 0x640uLL);
      __p = v15;
      *(_QWORD *)v24 = v22[0];
      *(_QWORD *)&v24[7] = *(_QWORD *)((char *)v22 + 7);
      v25 = v16;
      v26 = *(_OWORD *)v18;
      v27 = v19;
      v18[0] = 0;
      v18[1] = 0;
      v19 = 0;
      v28 = 3;
      v29 = 6;
      std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&>(a3, (unsigned __int8 *)&__p, (__int128 *)&__p);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v26);
      if (v25 < 0)
        operator delete(__p);
      if (v18[0])
      {
        v18[1] = v18[0];
        operator delete(v18[0]);
      }
      if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v20.__r_.__value_.__l.__data_);
      if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v21.__r_.__value_.__l.__data_);
      ++v8;
      v7 += 6400;
    }
    while (v17 != a2);
  }
}

void sub_245814CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  uint64_t v31;

  std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor(v31);
  if (a31 < 0)
    operator delete(__p);
  if (a9)
    operator delete(a9);
  if (a17 < 0)
    operator delete(a12);
  if (a23 < 0)
    operator delete(a18);
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_mvmt_posture_bailout(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  char *v1;
  signed int v2;
  char *v4;
  const float *v5;
  char *v6;
  uint64_t v7;
  float *v8;
  float *v9;
  float *v10;
  float v11;
  float *v12;
  float v13;
  float v14;
  float *v15;
  float *v16;
  float *v17;
  float v19;
  float *v20;
  float v21;
  float v22;
  float v23;
  float *v24;
  float *v25;
  NSObject *log;
  char *v27;
  void *__p;
  _QWORD v29[2];
  _BYTE v30[11528];

  v1 = (char *)this + 772512;
  v2 = *((_DWORD *)this + 193136);
  if (!(v2 % *((_DWORD *)this + 193144)) && *((_DWORD *)this + 193146) <= v2)
  {
    if (v2 >= 0x641)
      Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_mvmt_posture_bailout();
    v4 = (char *)this + 770984;
    v27 = (char *)this + 770698;
    v5 = (const float *)*((int *)this + 193145);
    v6 = (char *)this + 4 * (v2 - (_DWORD)v5) + 307452;
    v7 = -11520;
    do
    {
      if ((_DWORD)v5)
        memcpy(&v30[v7 + 11520], v6, 4 * (_QWORD)v5);
      v6 += 6400;
      v7 += 3840;
    }
    while (v7);
    Scandium::scandium_mvmt_detection_t::process((uint64_t)this + 770840, (uint64_t)v30, 0, v5);
    if (*(_DWORD *)v1 == 1)
    {
      v1[52] |= v27[175];
      v1[53] |= v27[174];
    }
    __p = 0;
    v29[0] = 0;
    v29[1] = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, *(const void **)v4, *((_QWORD *)v4 + 1), (uint64_t)(*((_QWORD *)v4 + 1) - *(_QWORD *)v4) >> 2);
    v9 = (float *)__p;
    if ((void *)v29[0] != __p)
    {
      if (*v27 == 1)
      {
        v10 = (float *)((char *)__p + 4);
        if ((char *)__p + 4 != (void *)v29[0])
        {
          v11 = *(float *)__p;
          v12 = (float *)((char *)__p + 4);
          do
          {
            v13 = *v12++;
            v14 = v13;
            if (v11 < v13)
            {
              v11 = v14;
              v9 = v10;
            }
            v10 = v12;
          }
          while (v12 != (float *)v29[0]);
        }
        Scandium::fill_valid((float *)this + 193038, v8, *v9);
        v16 = (float *)__p;
        v17 = (float *)((char *)__p + 4);
        if (__p != (void *)v29[0] && v17 != (float *)v29[0])
        {
          v19 = *(float *)__p;
          v20 = (float *)((char *)__p + 4);
          do
          {
            v21 = *v20++;
            v22 = v21;
            if (v21 < v19)
            {
              v19 = v22;
              v16 = v17;
            }
            v17 = v20;
          }
          while (v20 != (float *)v29[0]);
        }
        Scandium::fill_valid((float *)this + 193037, v15, *v16);
        v23 = Scandium::sort_median((Scandium *)__p, (const float *)((v29[0] - (_QWORD)__p) >> 2));
        v25 = Scandium::fill_valid((float *)this + 193039, v24, v23);
        log = Scandium::algs_get_log((Scandium *)v25);
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_mvmt_posture_bailout(v29, log);
      }
      v9 = (float *)__p;
    }
    if (v9)
    {
      v29[0] = v9;
      operator delete(v9);
    }
  }
}

void sub_245814FC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_dropped_samples_metrics(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v1;
  int v2;
  int v3;
  char *v4;
  char *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  char *v10;
  int *v11;
  char *v12;

  v1 = 0;
  v2 = 0;
  v3 = 0;
  v11 = (int *)((char *)this + 772544);
  v12 = (char *)this + 770698;
  v4 = (char *)this + 632608;
  v5 = (char *)this + 625840;
  v10 = (char *)this + 632608;
  do
  {
    v6 = 0;
    switch((int)v1)
    {
      case 0:
        v6 = 0;
        v3 = *v11;
        break;
      case 1:
        goto LABEL_6;
      case 2:
        v6 = 320;
        goto LABEL_6;
      case 3:
        v6 = 640;
LABEL_6:
        if (*v12 == 1)
        {
          v3 = 0;
          v6 = 0;
        }
        else if (((*v11 - v6) & ~((int)(*v11 - v6) >> 31)) >= 0x3C0)
        {
          v3 = 960;
        }
        else
        {
          v3 = (*v11 - v6) & ~((int)(*v11 - v6) >> 31);
        }
        break;
      default:
        break;
    }
    v7 = 0;
    v8 = (uint64_t)v4;
    do
    {
      if (v7 <= 2)
        v2 = dword_2458268EC[v7];
      Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_dropped_samples_metrics_for_window_and_type((uint64_t)this, v8, (int *)&v5[4 * v6], v3, v2);
      ++v7;
      v8 += 4;
    }
    while (v7 != 3);
    ++v1;
    v4 += 12;
  }
  while (v1 != 4);
  result = *(double *)v10;
  *(_QWORD *)(v12 + 1510) = *(_QWORD *)v10;
  *((_WORD *)v12 + 765) = *((_WORD *)v10 + 4);
  *((_WORD *)v12 + 759) = *((_WORD *)v10 + 6);
  *((_WORD *)v12 + 760) = *((_WORD *)v10 + 8);
  *((_WORD *)v12 + 761) = *((_WORD *)v10 + 12);
  *((_WORD *)v12 + 762) = *((_WORD *)v10 + 14);
  *((_WORD *)v12 + 763) = *((_WORD *)v10 + 18);
  *((_WORD *)v12 + 764) = *((_WORD *)v10 + 20);
  return result;
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_ppg(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  int v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  float *__A;
  float *__C;
  char *v29;
  int v30;
  uint64_t *v31;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  _DWORD v38[2];
  char *v39;
  int v40;
  char v41;
  _DWORD v42[2];
  char *v43;
  int v44;
  char v45;
  _DWORD v46[2];
  char *v47;
  int v48;
  char v49;
  char *__B;
  char *v51;

  v1 = 632240;
  v2 = 614848;
  v3 = 414972;
  __A = (float *)((char *)this + 615616);
  __C = (float *)((char *)this + 619456);
  v31 = (uint64_t *)((char *)this + 770616);
  v25 = (char *)this + 614656;
  v26 = (char *)this + 384252;
  bzero((char *)this + 615616, 0x1E00uLL);
  v30 = 0;
  v4 = 0;
  v5 = 476412;
  v6 = 615232;
  v7 = 632304;
  v8 = 632368;
  v35 = -1;
  v9 = 770712;
  do
  {
    v10 = 0;
    v21 = v4;
    v22 = v3;
    v29 = (char *)&Scandium::ScandiumPPG::path_array + 4 * byte_245827C40[v4];
    v17 = v8;
    v18 = v7;
    v36 = v8;
    v11 = v7;
    v23 = v2;
    v24 = v1;
    v19 = v6;
    v20 = v5;
    v16 = v9;
    do
    {
      v37 = v3;
      v34 = v29[byte_245827C40[v10]];
      v12 = *((_BYTE *)this + v9 + 16);
      v33 = v35 + 1;
      __B = (char *)this + v1;
      v51 = (char *)this + v6;
      v46[0] = 0;
      v46[1] = v30 + v10;
      v47 = (char *)this + v5;
      v48 = 960;
      v49 = v12;
      Scandium::ScandiumPPG::scandium_signal_conditioning_t::process(v31, (uint64_t)v46, (uint64_t)&__B);
      vDSP_vadd(__C, 1, *(const float **)((char *)this + v6), 1, __C, 1, 0x3C0uLL);
      v13 = *((_BYTE *)this + v9);
      __B = (char *)this + v11;
      v51 = (char *)this + v2;
      v42[0] = 1;
      v42[1] = v30 + v10;
      v43 = (char *)this + v3;
      v44 = 960;
      v45 = v13;
      Scandium::ScandiumPPG::scandium_signal_conditioning_t::process(v31, (uint64_t)v42, (uint64_t)&__B);
      if (v34 == 2)
        v14 = v35;
      else
        v14 = v35 + 1;
      v35 = v14;
      if (v34 != 2)
      {
        v15 = *((_BYTE *)this + v33 + 770704);
        __B = (char *)this + v36;
        v51 = &v25[24 * v33];
        v38[0] = 2;
        v38[1] = v30 + v10;
        v39 = &v26[3840 * v33];
        v40 = 960;
        v41 = v15;
        Scandium::ScandiumPPG::scandium_signal_conditioning_t::process(v31, (uint64_t)v38, (uint64_t)&__B);
        vDSP_vadd(__A, 1, (const float *)&v26[3840 * v33], 1, __A, 1, 0x3C0uLL);
      }
      ++v10;
      v5 += 3840;
      v6 += 24;
      v1 += 4;
      v2 += 24;
      v11 += 4;
      v36 += 4;
      ++v9;
      v3 = v37 + 3840;
    }
    while (v10 != 4);
    v4 = v21 + 1;
    v9 = v16 + 4;
    v5 = v20 + 15360;
    v6 = v19 + 96;
    v1 = v24 + 16;
    v3 = v22 + 15360;
    v2 = v23 + 96;
    v7 = v18 + 16;
    v8 = v17 + 16;
    v30 += 4;
  }
  while (v21 != 3);
  LODWORD(__B) = 1090519040;
  vDSP_vsdiv(__A, 1, (const float *)&__B, __A, 1, 0x3C0uLL);
  LODWORD(__B) = 1098907648;
  vDSP_vsdiv(__C, 1, (const float *)&__B, __C, 1, 0x3C0uLL);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_window_mvmt_posture(uint64_t a1, uint64_t a2)
{
  _DWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  float v9;
  int v10;
  int v11;
  unsigned int v12;
  BOOL v13;
  float v14;
  float v15;
  float v16;
  _BYTE v17[24];
  _BYTE *v18;
  _BYTE v19[24];
  _BYTE *v20;
  int8x8_t v21[2];
  unsigned __int8 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v18 = 0;
  Scandium::scandium_mvmt_detection_t::scandium_mvmt_detection_t(v21, v19, v17);
  v4 = (_DWORD *)(a1 + 772512);
  v5 = v18;
  if (v18 == v17)
  {
    v6 = 4;
    v5 = v17;
  }
  else
  {
    if (!v18)
      goto LABEL_6;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_6:
  v7 = v20;
  if (v20 == v19)
  {
    v8 = 4;
    v7 = v19;
  }
  else
  {
    if (!v20)
      goto LABEL_11;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_11:
  if (*v4 == 2)
    v9 = 3.4028e38;
  else
    v9 = *(float *)(a1 + 772604);
  v10 = 0;
  v11 = 0;
  v12 = -160;
  do
  {
    Scandium::scandium_mvmt_detection_t::processMvmt(v21, a2, v12 + 160, (const float *)0xA0, *(float *)(a1 + 772592));
    Scandium::scandium_mvmt_detection_t::processPosture(v21, a2, v12 + 160, (const float *)0xA0, *(float *)(a1 + 772608), v9);
    v10 += v21[0].u8[0];
    v11 += v22;
    v12 += 160;
  }
  while (v12 < 0x320);
  v13 = *v4 != 2 || *(float *)(a1 + 772596) >= (float)v10;
  *(_BYTE *)(a1 + 772521) = v13;
  *(_BYTE *)(a1 + 772520) = *(float *)(a1 + 772600) >= (float)v11;
  v14 = stats::mean((stats *)a2, (const float *)0x3C0);
  v15 = stats::mean((stats *)(a2 + 7680), (const float *)0x3C0);
  v16 = *(float *)(a1 + 772604);
  *(_BYTE *)(a1 + 772523) = fabsf(v14) >= *(float *)(a1 + 772608);
  *(_BYTE *)(a1 + 772522) = v15 >= v16;
  Scandium::scandium_mvmt_detection_t::~scandium_mvmt_detection_t((Scandium::scandium_mvmt_detection_t *)v21);
}

void sub_2458156C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  Scandium::scandium_mvmt_detection_t::~scandium_mvmt_detection_t((Scandium::scandium_mvmt_detection_t *)va);
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, Scandium::ScandiumPPG::beats_t *a2)
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  _QWORD *v18;
  const float *v19;
  float v20;
  Scandium::ScandiumPPG::scandium_spo2_processor_t *v21;
  _OWORD *v22;
  __int128 v23;
  __int128 v24;
  char *v25;
  float *v26;
  uint64_t v27;
  char *v28;
  float v29;
  float v30;
  uint64_t v31;
  float v32;
  std::string *v33;
  uint64_t v34;
  std::string *v35;
  __int128 v36;
  const std::string::value_type *v37;
  std::string::size_type v38;
  std::string *v39;
  NSObject *log;
  std::string *v41;
  uint64_t v42;
  std::string *v43;
  __int128 v44;
  const std::string::value_type *v45;
  std::string::size_type v46;
  std::string *v47;
  NSObject *v48;
  int *v49;
  float *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t *v66;
  uint64_t *v67;
  char *v68;
  uint64_t v69;
  int v71;
  int v72;
  Scandium::ScandiumPPG::scandium_spo2_processor_t *v73;
  uint64_t *v74;
  std::string v75;
  __int128 v76;
  int v77;
  __int128 v78;
  int v79;
  __int128 v80;
  int v81;
  __int128 v82;
  int v83;
  __int128 v84;
  int v85;
  __int128 v86;
  int v87;
  void *__p[3];
  __int128 v89;
  int v90;
  __int128 v91;
  int v92;
  __int128 v93;
  int v94;
  __int128 v95;
  int64_t v96;
  _OWORD v97[4];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  int v102;
  std::string v103;

  memset(&v103, 0, sizeof(v103));
  *(double *)&v3 = Scandium::ScandiumPPG::BGA_t::reset((Scandium::ScandiumPPG::BGA_t *)v97);
  v4 = 0;
  v73 = this;
  v74 = (uint64_t *)((char *)this + 625816);
  v49 = (int *)((char *)this + 772536);
  v50 = (float *)((char *)this + 623456);
  v5 = 765496;
  v6 = 623384;
  v7 = 614848;
  v63 = 0;
  v64 = (char *)this + 614656;
  v51 = (char *)this + 595452;
  v52 = (char *)this + 580092;
  v8 = 615232;
  v9 = 615240;
  v10 = 625176;
  v11 = 767544;
  v12 = -1;
  do
  {
    v13 = 0;
    v65 = (char *)&Scandium::ScandiumPPG::path_array + 4 * byte_245827C40[v4];
    v59 = v5;
    v60 = v4;
    v62 = (uint64_t)&v52[3840 * v4];
    v61 = (uint64_t)&v51[3840 * v4];
    v54 = v10;
    v55 = v9;
    v57 = v7;
    v58 = v6;
    v14 = v6;
    v56 = v8;
    v53 = v11;
    do
    {
      v15 = byte_245827C40[v13];
      v74[1] = *v74;
      v72 = v65[v15];
      v69 = v12 + 1;
      if (v72 != 2)
        ++v12;
      v71 = v12;
      if (*(_QWORD *)((char *)v73 + v9) - *(_QWORD *)((char *)v73 + v9 - 8) <= 8uLL)
      {
        *(double *)&v3 = Scandium::ScandiumPPG::BGA_t::reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)v73 + v14));
      }
      else
      {
        v16 = (char *)v73 + v5;
        Scandium::ScandiumPPG::scandium_bga_t::compute_bga_measures(a2, 960, (uint64_t)&v95, *(int32x2_t *)&v3);
        v101 = v95;
        v17 = (int)v96;
        v102 = v96;
        *(_QWORD *)&v100 = *((_QWORD *)&v95 + 1);
        v95 = 0uLL;
        v96 = 0;
        v75.__r_.__value_.__s.__data_[0] = 1;
        std::vector<BOOL>::assign((uint64_t)&v95, v17, &v75);
        v93 = v101;
        v94 = v102;
        v67 = (uint64_t *)((char *)v73 + v8);
        Scandium::ScandiumPPG::scandium_bga_t::compute_ppg_snips((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)v73 + v5), (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)v73 + v8), (uint64_t)a2, (int *)&v93, (uint64_t)v97, (uint64_t *)&v95, 0);
        v91 = v101;
        v92 = v102;
        v68 = (char *)v73 + v11;
        v66 = (uint64_t *)((char *)v73 + v7);
        Scandium::ScandiumPPG::scandium_bga_t::compute_ppg_snips((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)v73 + v11), (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)v73 + v7), (uint64_t)a2, (int *)&v91, (uint64_t)v97, (uint64_t *)&v95, 1);
        if (v72 != 2)
        {
          v89 = v101;
          v90 = v102;
          Scandium::ScandiumPPG::scandium_bga_t::compute_ppg_snips((_QWORD *)v73 + 16 * v69 + 96199, &v64[24 * v69], (uint64_t)a2, (int *)&v89, (uint64_t)v97, (uint64_t *)&v95, 2);
        }
        v18 = std::vector<BOOL>::vector(__p, (uint64_t)&v95);
        Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_good_snips((uint64_t)v18, (uint64_t)v74, (uint64_t)&v101, __p, (uint64_t)v97);
        if (__p[0])
          operator delete(__p[0]);
        if (v74[1] != *v74)
        {
          v86 = v101;
          v87 = v102;
          Scandium::ScandiumPPG::scandium_bga_t::compile_bga_metrics((uint64_t)v16, v67, v74, (unsigned int *)&v86, (uint64_t)v97, 0);
          v84 = v101;
          v85 = v102;
          Scandium::ScandiumPPG::scandium_bga_t::compile_bga_metrics((uint64_t)v68, v66, v74, (unsigned int *)&v84, (uint64_t)v97, 1);
          Scandium::ScandiumPPG::scandium_bga_t::compute_wavelength(v16, v63 + v13, v62, v74, (unsigned int *)&v101, (uint64_t)v97, 0);
          Scandium::ScandiumPPG::scandium_bga_t::compute_wavelength(v68, v63 + v13, v61, v74, (unsigned int *)&v101, (uint64_t)v97, 1);
          if (v72 != 2)
          {
            v82 = v101;
            v83 = v102;
            Scandium::ScandiumPPG::scandium_bga_t::compile_bga_metrics((uint64_t)v73 + 128 * (uint64_t)(int)v69 + 769592, (uint64_t *)&v64[24 * (int)v69], v74, (unsigned int *)&v82, (uint64_t)v97, 2);
          }
          v80 = v101;
          v81 = v102;
          Scandium::ScandiumPPG::scandium_bga_t::compute_snip_corr((uint64_t)v16, v67, v74, (unsigned int *)&v80, (float *)v97, 0);
          v78 = v101;
          v79 = v102;
          Scandium::ScandiumPPG::scandium_bga_t::compute_snip_corr((uint64_t)v68, v66, v74, (unsigned int *)&v78, (float *)v97, 1);
          if (v72 != 2)
          {
            v76 = v101;
            v77 = v102;
            Scandium::ScandiumPPG::scandium_bga_t::compute_snip_corr((uint64_t)v73 + 128 * (uint64_t)(int)v69 + 769592, &v64[24 * (int)v69], v74, (unsigned int *)&v76, (float *)v97, 2);
          }
          v19 = (const float *)v101;
          v20 = stats::pearsonr(**(stats ***)&v97[0], **((stats ***)&v97[0] + 1), (const float *)v101);
          *((_QWORD *)&v99 + 1) = __PAIR64__(COERCE_UNSIGNED_INT(Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga_openness(v21, **(stats ***)&v97[0], **((stats ***)&v97[0] + 1), v19)), LODWORD(v20));
        }
        v22 = (_OWORD *)((char *)v73 + v14);
        v23 = v99;
        v22[4] = v98;
        v22[5] = v23;
        v22[6] = v100;
        v24 = v97[1];
        *v22 = v97[0];
        v22[1] = v24;
        v3 = v97[3];
        v22[2] = v97[2];
        v22[3] = v3;
        LODWORD(v3) = HIDWORD(v98);
        *(_DWORD *)((char *)v73 + v10) = HIDWORD(v98);
        if ((_QWORD)v95)
          operator delete((void *)v95);
      }
      ++v13;
      v5 += 128;
      v11 += 128;
      v8 += 24;
      v7 += 24;
      v14 += 112;
      v10 += 40;
      v9 += 24;
      v12 = v71;
    }
    while (v13 != 4);
    v4 = v60 + 1;
    v5 = v59 + 512;
    v11 = v53 + 512;
    v8 = v56 + 96;
    v7 = v57 + 96;
    v6 = v58 + 448;
    v10 = v54 + 160;
    v9 = v55 + 96;
    v63 += 4;
  }
  while (v60 != 3);
  v25 = (char *)v73 + 632464;
  v26 = v50;
  v27 = *v49;
  v28 = (char *)v73 + 632476;
  v29 = *((float *)v73 + v27 + 158116);
  v30 = *((float *)v73 + v27 + 158119);
  v31 = 16;
  do
  {
    v29 = *(v26 - 1) + v29;
    *(float *)&v25[4 * v27] = v29;
    v32 = *v26;
    v26 += 28;
    v30 = v32 + v30;
    *(float *)&v28[4 * v27] = v30;
    --v31;
  }
  while (v31);
  *(float *)&v25[4 * v27] = v29 * 0.0625;
  *(float *)&v28[4 * v27] = v30 * 0.0625;
  std::string::resize(&v103, 0, 0);
  if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0)
  {
    v103.__r_.__value_.__l.__size_ = 20;
    v33 = (std::string *)v103.__r_.__value_.__r.__words[0];
  }
  else
  {
    *((_BYTE *)&v103.__r_.__value_.__s + 23) = 20;
    v33 = &v103;
  }
  v34 = 0;
  strcpy((char *)v33, "scandium median HR: ");
  do
  {
    std::to_string(&v75, *(float *)((char *)v73 + v34 + 623480));
    v35 = std::string::append(&v75, " ", 1uLL);
    v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
    v96 = v35->__r_.__value_.__r.__words[2];
    v95 = v36;
    v35->__r_.__value_.__l.__size_ = 0;
    v35->__r_.__value_.__r.__words[2] = 0;
    v35->__r_.__value_.__r.__words[0] = 0;
    if (v96 >= 0)
      v37 = (const std::string::value_type *)&v95;
    else
      v37 = (const std::string::value_type *)v95;
    if (v96 >= 0)
      v38 = HIBYTE(v96);
    else
      v38 = *((_QWORD *)&v95 + 1);
    v39 = std::string::append(&v103, v37, v38);
    if (SHIBYTE(v96) < 0)
      operator delete((void *)v95);
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v75.__r_.__value_.__l.__data_);
    v34 += 112;
  }
  while (v34 != 1792);
  log = Scandium::algs_get_log((Scandium *)v39);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga();
  std::string::resize(&v103, 0, 0);
  if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0)
  {
    v103.__r_.__value_.__l.__size_ = 18;
    v41 = (std::string *)v103.__r_.__value_.__r.__words[0];
  }
  else
  {
    *((_BYTE *)&v103.__r_.__value_.__s + 23) = 18;
    v41 = &v103;
  }
  v42 = 0;
  strcpy((char *)v41, "scandium mean HR: ");
  do
  {
    std::to_string(&v75, *(float *)((char *)v73 + v42 + 623484));
    v43 = std::string::append(&v75, " ", 1uLL);
    v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
    v96 = v43->__r_.__value_.__r.__words[2];
    v95 = v44;
    v43->__r_.__value_.__l.__size_ = 0;
    v43->__r_.__value_.__r.__words[2] = 0;
    v43->__r_.__value_.__r.__words[0] = 0;
    if (v96 >= 0)
      v45 = (const std::string::value_type *)&v95;
    else
      v45 = (const std::string::value_type *)v95;
    if (v96 >= 0)
      v46 = HIBYTE(v96);
    else
      v46 = *((_QWORD *)&v95 + 1);
    v47 = std::string::append(&v103, v45, v46);
    if (SHIBYTE(v96) < 0)
      operator delete((void *)v95);
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v75.__r_.__value_.__l.__data_);
    v42 += 112;
  }
  while (v42 != 1792);
  v48 = Scandium::algs_get_log((Scandium *)v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga();
  if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v103.__r_.__value_.__l.__data_);
}

void sub_245815F80(_Unwind_Exception *a1)
{
  uint64_t v1;

  if (*(char *)(v1 - 113) < 0)
    operator delete(*(void **)(v1 - 136));
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_spo2(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float *v8;
  uint64_t v9;
  int v10;
  std::string *v11;
  uint64_t v12;
  std::string *v13;
  __int128 v14;
  void **v15;
  std::string::size_type v16;
  std::string *v17;
  NSObject *log;
  std::string *v19;
  uint64_t v20;
  std::string *v21;
  __int128 v22;
  void **v23;
  std::string::size_type v24;
  std::string *v25;
  NSObject *v26;
  float *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  int v36;
  std::string v37;
  void *__p[2];
  int64_t v39;
  int v40[2];
  char *v41;
  char *v42;
  uint64_t v43;
  int v44;
  int v45;
  char v46;
  std::string v47;

  v2 = 0;
  v3 = 623452;
  v4 = 614848;
  memset(&v47, 0, sizeof(v47));
  v35 = (char *)this + 770792;
  v36 = 0;
  v34 = (char *)this + 770800;
  v5 = 615232;
  v6 = 625192;
  v7 = 625196;
  v8 = (float *)&v46;
  do
  {
    v9 = 0;
    v32 = v3;
    v33 = v2;
    v10 = byte_245827C40[v2];
    v28 = v7;
    v29 = v6;
    v30 = v5;
    v31 = v4;
    v27 = v8;
    do
    {
      Scandium::ScandiumPPG::scandium_calibration_t::process(*(float *)((char *)this + v3 + 4), *(float *)((char *)this + v3), (uint64_t)v35, v10, byte_245827C40[v9], v8);
      v43 = *(_QWORD *)v8;
      v44 = *((_DWORD *)v8 + 2);
      __p[0] = (char *)this + v7;
      __p[1] = (char *)this + v6;
      v40[0] = v36 + v9;
      v40[1] = 0;
      v41 = (char *)this + v5;
      v42 = (char *)this + v4;
      v45 = 0;
      Scandium::ScandiumPPG::scandium_spo2_t::process((uint64_t)v34, v40, (uint64_t)__p);
      ++v9;
      v8 += 3;
      v5 += 24;
      v4 += 24;
      v3 += 112;
      v7 += 40;
      v6 += 40;
    }
    while (v9 != 4);
    v2 = v33 + 1;
    v8 = v27 + 12;
    v5 = v30 + 96;
    v4 = v31 + 96;
    v3 = v32 + 448;
    v7 = v28 + 160;
    v6 = v29 + 160;
    v36 += 4;
  }
  while (v33 != 3);
  std::string::resize(&v47, 0, 0);
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
  {
    v47.__r_.__value_.__l.__size_ = 15;
    v11 = (std::string *)v47.__r_.__value_.__r.__words[0];
  }
  else
  {
    *((_BYTE *)&v47.__r_.__value_.__s + 23) = 15;
    v11 = &v47;
  }
  v12 = 0;
  strcpy((char *)v11, "scandium spo2: ");
  do
  {
    std::to_string(&v37, *(float *)((char *)this + v12 + 625196));
    v13 = std::string::append(&v37, " ", 1uLL);
    v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v39 = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    if (v39 >= 0)
      v15 = __p;
    else
      v15 = (void **)__p[0];
    if (v39 >= 0)
      v16 = HIBYTE(v39);
    else
      v16 = (std::string::size_type)__p[1];
    v17 = std::string::append(&v47, (const std::string::value_type *)v15, v16);
    if (SHIBYTE(v39) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v37.__r_.__value_.__l.__data_);
    v12 += 40;
  }
  while (v12 != 640);
  log = Scandium::algs_get_log((Scandium *)v17);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga();
  std::string::resize(&v47, 0, 0);
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
  {
    v47.__r_.__value_.__l.__size_ = 19;
    v19 = (std::string *)v47.__r_.__value_.__r.__words[0];
  }
  else
  {
    *((_BYTE *)&v47.__r_.__value_.__s + 23) = 19;
    v19 = &v47;
  }
  v20 = 0;
  strcpy((char *)v19, "scandium raw conf: ");
  do
  {
    std::to_string(&v37, *(float *)((char *)this + v20 + 625192));
    v21 = std::string::append(&v37, " ", 1uLL);
    v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
    v39 = v21->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v22;
    v21->__r_.__value_.__l.__size_ = 0;
    v21->__r_.__value_.__r.__words[2] = 0;
    v21->__r_.__value_.__r.__words[0] = 0;
    if (v39 >= 0)
      v23 = __p;
    else
      v23 = (void **)__p[0];
    if (v39 >= 0)
      v24 = HIBYTE(v39);
    else
      v24 = (std::string::size_type)__p[1];
    v25 = std::string::append(&v47, (const std::string::value_type *)v23, v24);
    if (SHIBYTE(v39) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v37.__r_.__value_.__l.__data_);
    v20 += 40;
  }
  while (v20 != 640);
  v26 = Scandium::algs_get_log((Scandium *)v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga();
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v47.__r_.__value_.__l.__data_);
}

void sub_2458163D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  uint64_t v31;

  if (*(char *)(v31 - 89) < 0)
    operator delete(*(void **)(v31 - 112));
  _Unwind_Resume(exception_object);
}

float *Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_quality_metric(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v1;
  void **v2;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  float v9;
  float v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t *v17;
  stats *v18;
  stats *v19;
  uint64_t v20;
  int v21;
  char *v22;
  _DWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  unsigned int v32;
  char *v33;
  unsigned int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  unsigned int v51;
  __int128 v52;
  _QWORD *v53;
  unint64_t v54;
  stats *v55;
  int *v56;
  unint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  stats *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  char *v71;
  _DWORD *v72;
  int v73;
  void **v74;
  unint64_t v75;
  char *v76;
  _DWORD *v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  char *v84;
  int v85;
  char *v86;
  int if_opackets;
  unint64_t v88;
  char *v89;
  _DWORD *v90;
  char *v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  char *v97;
  int v98;
  int v99;
  int v100;
  void **v101;
  _BYTE *v102;
  float v103;
  float *v104;
  stats *v105;
  stats *v106;
  float v107;
  float *v108;
  stats *v109;
  stats *v110;
  float v111;
  float *v112;
  stats *v113;
  stats *v114;
  float v115;
  float *v116;
  float *result;
  float *v118;
  float v119;
  float *v120;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void **v126;
  void **v127;
  void **v128;
  void **v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  char *v134;
  int v135;
  char *v136;
  char *v137;
  _QWORD *v138;
  unsigned int v139;
  unsigned int v140;
  uint64_t v141;
  stats *v142;
  __int128 v143;
  void *v144;
  _BYTE *v145;
  uint64_t v146;
  void *__p;
  __int128 v148;
  _QWORD v149[2];
  _QWORD v150[2];
  _QWORD v151[2];
  uint64_t v152;
  unsigned int v153;
  int v154;
  unsigned int v155;
  uint64_t v156;
  int v157;
  char v158;
  __int16 v159;
  char v160;
  char v161;
  char v162;
  __int16 v163;
  int v164;
  uint64_t v165;
  int v166;
  int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  __int128 v174;
  _DWORD v175[19];
  uint64_t v176;

  v1 = 0;
  v176 = *MEMORY[0x24BDAC8D0];
  v2 = (void **)((char *)this + 632488);
  v151[0] = 0;
  v151[1] = 0;
  v3 = (char *)this + 632240;
  v4 = (char *)this + 632304;
  v150[0] = 0;
  v150[1] = 0;
  v149[0] = 0;
  v149[1] = 0;
  v137 = (char *)this + 632368;
  v138 = (_QWORD *)((char *)this + 771008);
  do
  {
    v5 = 0;
    v6 = byte_245827C40[v1];
    v7 = (char *)&Scandium::ScandiumPPG::path_array[4 * v6];
    v8 = 4 * v6;
    v9 = *((float *)v151 + v1);
    v10 = *((float *)v150 + v1);
    do
    {
      v11 = byte_245827C40[v5];
      v12 = v7[v11];
      v13 = v8 + v11;
      if (v12 != 2)
        *((float *)v149 + v1) = *(float *)&v137[4 * v13] + *((float *)v149 + v1);
      v9 = *(float *)&v3[4 * v13] + v9;
      v10 = *(float *)&v4[4 * v13] + v10;
      ++v5;
    }
    while (v5 != 4);
    *((float *)v151 + v1) = v9;
    *((float *)v150 + v1++) = v10;
  }
  while (v1 != 4);
  v14 = 0;
  v15 = (char *)this + 553212;
  v16 = (char *)this + 537852;
  v17 = (uint64_t *)((char *)this + 770616);
  v133 = (char *)this + 632448;
  v134 = (char *)this + 632432;
  do
  {
    __p = 0;
    v148 = 0uLL;
    v144 = 0;
    v145 = 0;
    v146 = 0;
    v142 = 0;
    v143 = 0uLL;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v142, &v15[3840 * v14], (uint64_t)&v15[3840 * v14 + 3840], 0x3C0uLL);
    if (__p)
    {
      *(_QWORD *)&v148 = __p;
      operator delete(__p);
    }
    __p = v142;
    v148 = v143;
    *(float *)&v134[4 * v14] = stats::mean(v142, (const float *)(((_QWORD)v143 - (_QWORD)v142) >> 2)) / 1000000.0;
    *(_QWORD *)&v148 = __p;
    v142 = 0;
    v143 = 0uLL;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v142, &v16[3840 * v14], (uint64_t)&v16[3840 * v14 + 3840], 0x3C0uLL);
    if (__p)
    {
      *(_QWORD *)&v148 = __p;
      operator delete(__p);
    }
    v18 = v142;
    __p = v142;
    v148 = v143;
    v19 = (stats *)v143;
    while (v18 != v19)
    {
      *(float *)v18->cp_time = *(float *)v18->cp_time / 1000000.0;
      v18 = (stats *)((char *)v18 + 4);
    }
    Scandium::ScandiumPPG::scandium_signal_conditioning_t::compute_ac(v17, (uint64_t)&__p, (float **)&v144);
    *(float *)&v133[4 * v14] = stats::std((stats *)v144, (const float *)((unint64_t)(v145 - (_BYTE *)v144) >> 2), 1);
    if (v144)
    {
      v145 = v144;
      operator delete(v144);
    }
    if (__p)
    {
      *(_QWORD *)&v148 = __p;
      operator delete(__p);
    }
    ++v14;
  }
  while (v14 != 4);
  v130 = v4;
  v20 = 0;
  v21 = 0;
  v136 = (char *)this + 625176;
  v22 = (char *)this + 623384;
  v122 = (uint64_t)(v2 + 8);
  v126 = v2 + 6;
  v127 = v2 + 3;
  v123 = (uint64_t)(v2 + 5);
  v124 = (uint64_t)(v2 + 2);
  v128 = v2 + 9;
  v129 = v2;
  v125 = (uint64_t)(v2 + 11);
  v23 = v138;
  do
  {
    v24 = 0;
    v131 = byte_245827C40[v20];
    v132 = 4 * v20;
    do
    {
      v25 = byte_245827C40[v24];
      v26 = v24 + v132;
      v27 = Scandium::ScandiumPPG::path_array[4 * v131 + v25];
      v28 = *(_QWORD *)&v22[112 * v24 + 112 * v132];
      if (v28)
      {
        v29 = *(_QWORD *)&v22[112 * v26 + 16];
        if (v29)
        {
          Scandium::ScandiumPPG::scandium_spo2_t::compute_orthogonal_regression((uint64_t)this + 770800, v28, v29, (float *)&v136[40 * v26 + 24]);
          v23 = v138;
          v22 = (char *)this + 623384;
        }
      }
      v160 = 0;
      v159 = 0;
      v30 = &v22[112 * v26];
      v31 = *(_QWORD *)(v30 + 76);
      v32 = *((_DWORD *)v30 + 22);
      v33 = &v136[40 * v26];
      v34 = *((_DWORD *)v30 + 24);
      v35 = *((_DWORD *)v33 + 5);
      v36 = *((_DWORD *)v33 + 6);
      v37 = *((_DWORD *)v30 + 14);
      v38 = *(_DWORD *)&v3[4 * v26];
      v39 = *(_DWORD *)&v130[4 * v26];
      v40 = *(_DWORD *)&v137[4 * v26];
      v41 = *((_DWORD *)v151 + v20);
      v42 = *((_DWORD *)v150 + v20);
      v43 = *((_DWORD *)v149 + v20);
      v44 = *(_DWORD *)&v134[4 * v24];
      v45 = *(_DWORD *)&v133[4 * v24];
      v46 = *(_QWORD *)(v30 + 60);
      *(_OWORD *)&v175[3] = *(_OWORD *)((char *)this + 770728);
      v47 = *(_OWORD *)((char *)this + 770716);
      v174 = *(_OWORD *)((char *)this + 770700);
      *(_OWORD *)v175 = v47;
      v140 = v32;
      v141 = v31;
      v152 = v31;
      v153 = v32;
      v154 = v35;
      v139 = v34;
      v155 = v34;
      v157 = v36;
      v158 = v27;
      v161 = v131;
      v162 = v25;
      v163 = 0;
      v135 = v46;
      v165 = v46;
      v164 = v37;
      v166 = v38;
      v167 = v39;
      v168 = v40;
      v169 = v41;
      v170 = v42;
      v171 = v43;
      v172 = v44;
      v173 = v45;
      v48 = *((_QWORD *)v30 + 13);
      v156 = v48;
      v49 = *(_OWORD *)((char *)this + 770760);
      *(_OWORD *)&v175[7] = *(_OWORD *)((char *)this + 770744);
      *(_OWORD *)&v175[11] = v49;
      *(_OWORD *)&v175[15] = *(_OWORD *)((char *)this + 770776);
      Scandium::ScandiumPPG::scandium_quality_metric_t::process((uint64_t)v23, (uint64_t)&v152);
      v23 = v138;
      v50 = *v138;
      if (v27 == 2)
        v51 = 0;
      else
        v51 = (*v138 >> 1) & 1;
      *(_QWORD *)&v52 = v141;
      *((_QWORD *)&v52 + 1) = __PAIR64__(v139, v140);
      v33[36] = (~*(_DWORD *)v138 & 0x7CLL) == 0;
      *(_OWORD *)v33 = v52;
      *(_QWORD *)(v33 + 28) = v48;
      if ((v50 & 1) != 0)
      {
        if (v27)
        {
          if (v27 == 1)
          {
            v58 = (char *)v129[4];
            v57 = (unint64_t)v129[5];
            if ((unint64_t)v58 >= v57)
            {
              v59 = (char *)*v127;
              v60 = (v58 - (_BYTE *)*v127) >> 2;
              v61 = v60 + 1;
              if ((unint64_t)(v60 + 1) >> 62)
                goto LABEL_121;
              v62 = v57 - (_QWORD)v59;
              if (v62 >> 1 > v61)
                v61 = v62 >> 1;
              if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFFCLL)
                v63 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v63 = v61;
              if (v63)
              {
                v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v123, v63);
                v59 = (char *)v129[3];
                v58 = (char *)v129[4];
              }
              else
              {
                v64 = 0;
              }
              v71 = &v64[4 * v60];
              *(_DWORD *)v71 = v37;
              v72 = v71 + 4;
              while (v58 != v59)
              {
                v73 = *((_DWORD *)v58 - 1);
                v58 -= 4;
                *((_DWORD *)v71 - 1) = v73;
                v71 -= 4;
              }
              v129[3] = v71;
              v129[4] = v72;
              v129[5] = &v64[4 * v63];
              if (v59)
                operator delete(v59);
              v129[4] = v72;
              v23 = v138;
            }
            else
            {
              *(_DWORD *)v58 = v37;
              v129[4] = v58 + 4;
            }
          }
          else if (v27 == 2)
          {
            v53 = v129;
            v55 = (stats *)v129[1];
            v54 = (unint64_t)v129[2];
            if ((unint64_t)v55 >= v54)
            {
              v65 = (stats *)*v129;
              v66 = ((char *)v55 - (_BYTE *)*v129) >> 2;
              v67 = v66 + 1;
              if ((unint64_t)(v66 + 1) >> 62)
                goto LABEL_121;
              v68 = v54 - (_QWORD)v65;
              if (v68 >> 1 > v67)
                v67 = v68 >> 1;
              if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFFCLL)
                v69 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v69 = v67;
              if (v69)
              {
                v70 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v124, v69);
                v53 = v129;
                v65 = (stats *)*v129;
                v55 = (stats *)v129[1];
              }
              else
              {
                v70 = 0;
              }
              v86 = &v70[4 * v66];
              *(_DWORD *)v86 = v37;
              v56 = (int *)(v86 + 4);
              while (v55 != v65)
              {
                if_opackets = v55[-1].if_opackets;
                v55 = (stats *)((char *)v55 - 4);
                *((_DWORD *)v86 - 1) = if_opackets;
                v86 -= 4;
              }
              *v53 = v86;
              v53[1] = v56;
              v53[2] = &v70[4 * v69];
              if (v65)
                operator delete(v65);
              v23 = v138;
            }
            else
            {
              v55->cp_time[0] = v37;
              v56 = &v55->cp_time[1];
            }
            v53[1] = v56;
            v89 = (char *)v53[7];
            v88 = v53[8];
            if ((unint64_t)v89 >= v88)
            {
              v91 = (char *)*v126;
              v92 = (v89 - (_BYTE *)*v126) >> 2;
              v93 = v92 + 1;
              if ((unint64_t)(v92 + 1) >> 62)
LABEL_121:
                std::vector<float>::__throw_length_error[abi:ne180100]();
              v94 = v88 - (_QWORD)v91;
              if (v94 >> 1 > v93)
                v93 = v94 >> 1;
              if ((unint64_t)v94 >= 0x7FFFFFFFFFFFFFFCLL)
                v95 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v95 = v93;
              if (v95)
              {
                v96 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v122, v95);
                v53 = v129;
                v91 = (char *)v129[6];
                v89 = (char *)v129[7];
              }
              else
              {
                v96 = 0;
              }
              v97 = &v96[4 * v92];
              *(_DWORD *)v97 = v135;
              v90 = v97 + 4;
              while (v89 != v91)
              {
                v98 = *((_DWORD *)v89 - 1);
                v89 -= 4;
                *((_DWORD *)v97 - 1) = v98;
                v97 -= 4;
              }
              v53[6] = v97;
              v53[7] = v90;
              v53[8] = &v96[4 * v95];
              if (v91)
                operator delete(v91);
              v23 = v138;
            }
            else
            {
              *(_DWORD *)v89 = v135;
              v90 = v89 + 4;
            }
            v53[7] = v90;
          }
        }
        else
        {
          v74 = v129;
          v76 = (char *)v129[10];
          v75 = (unint64_t)v129[11];
          if ((unint64_t)v76 >= v75)
          {
            v78 = (char *)*v128;
            v79 = (v76 - (_BYTE *)*v128) >> 2;
            v80 = v79 + 1;
            if ((unint64_t)(v79 + 1) >> 62)
              goto LABEL_121;
            v81 = v75 - (_QWORD)v78;
            if (v81 >> 1 > v80)
              v80 = v81 >> 1;
            if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFFCLL)
              v82 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v82 = v80;
            if (v82)
            {
              v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v125, v82);
              v74 = v129;
              v78 = (char *)v129[9];
              v76 = (char *)v129[10];
            }
            else
            {
              v83 = 0;
            }
            v84 = &v83[4 * v79];
            *(_DWORD *)v84 = v135;
            v77 = v84 + 4;
            while (v76 != v78)
            {
              v85 = *((_DWORD *)v76 - 1);
              v76 -= 4;
              *((_DWORD *)v84 - 1) = v85;
              v84 -= 4;
            }
            v74[9] = v84;
            v74[10] = v77;
            v74[11] = &v83[4 * v82];
            if (v78)
              operator delete(v78);
            v23 = v138;
          }
          else
          {
            *(_DWORD *)v76 = v135;
            v77 = v76 + 4;
          }
          v74[10] = v77;
        }
      }
      v21 += v51;
      ++v24;
      v22 = (char *)this + 623384;
    }
    while (v24 != 4);
    ++v20;
  }
  while (v20 != 4);
  v99 = v23[274];
  if (v99 <= v21)
    v99 = v21;
  v23[274] = v99;
  v100 = v23[275];
  if (v21 < v100)
    v100 = v21;
  v23[275] = v100;
  if (v21 <= 0)
    ++v23[283];
  v101 = v129;
  v102 = v129[1];
  if (*v129 != v102)
  {
    v103 = stats::mean((stats *)*v129, (const float *)((unint64_t)(v102 - (_BYTE *)*v129) >> 2));
    Scandium::fill_valid((float *)this + 193045, v104, v103);
    v101 = v129;
  }
  v105 = (stats *)v101[3];
  v106 = (stats *)v101[4];
  if (v105 != v106)
  {
    v107 = stats::mean(v105, (const float *)((unint64_t)((char *)v106 - (char *)v105) >> 2));
    Scandium::fill_valid((float *)this + 193046, v108, v107);
    v101 = v129;
  }
  v109 = (stats *)v101[6];
  v110 = (stats *)v101[7];
  if (v109 != v110)
  {
    v111 = stats::mean(v109, (const float *)((unint64_t)((char *)v110 - (char *)v109) >> 2));
    Scandium::fill_valid((float *)this + 193047, v112, v111);
    v101 = v129;
  }
  v113 = (stats *)v101[9];
  v114 = (stats *)v101[10];
  if (v113 != v114)
  {
    v115 = stats::mean(v113, (const float *)((unint64_t)((char *)v114 - (char *)v113) >> 2));
    Scandium::fill_valid((float *)this + 193048, v116, v115);
    v101 = v129;
  }
  result = (float *)v101[12];
  v118 = (float *)v101[13];
  if (result != v118)
  {
    v119 = stats::mean((stats *)result, (const float *)((unint64_t)((char *)v118 - (char *)result) >> 2));
    return Scandium::fill_valid((float *)this + 193049, v120, v119);
  }
  return result;
}

void sub_245816DBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,void *__p,uint64_t a46,uint64_t a47,void *a48,uint64_t a49)
{
  if (__p)
    operator delete(__p);
  if (a48)
    operator delete(a48);
  _Unwind_Resume(exception_object);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_hw_fom_core_analytics(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  char *v2;
  char *v3;
  float v4;
  float median_of_path;
  float *v6;
  float v7;
  float v8;
  float *v9;
  float v10;
  float v11;
  float *v12;
  float v13;
  float v14;
  float *v15;
  float v16;
  float v17;
  float *v18;
  float v19;
  float v20;
  float *v21;
  float v22;
  float v23;
  float *v24;
  float v25;
  float v26;
  float *v27;
  void *v28;
  float v29;
  float *v30;
  void *v31;
  float v32;
  float *v33;
  void *v34;
  float v35;
  float *v36;
  float *v37;
  float *v38;
  uint64_t v39;
  Scandium::ScandiumPPG *v40;
  float v41;
  uint64_t v42;
  Scandium::ScandiumPPG *v43;
  float v44;
  uint64_t v45;
  Scandium::ScandiumPPG *v46;
  float v47;
  uint64_t v48;
  Scandium::ScandiumPPG *v49;
  float v50;
  float v51;
  float *v52;
  float v53;
  float *v54;
  float v55;
  float *v56;
  float v57;
  float *v58;
  float v59;
  float *v60;
  float v61;
  float *v62;
  float v63;
  float *v64;
  float v65;
  float *v66;
  float v67;
  float *v68;
  float v69;
  float *v70;
  float v71;
  float *v72;
  float v73;
  float *v74;
  float v75;
  float *v76;
  float v77;
  float *v78;
  float v79;
  float *v80;
  float v81;
  float *v82;
  float v83;
  float *v84;
  float v85;
  float *v86;
  float v87;
  float *v88;
  float v89;
  float *v90;
  float v91;
  float *v92;
  float v93;
  float *v94;
  float v95;
  float *v96;
  float v97;
  float *v98;
  void *v99;
  float v100;
  float *v101;
  float v102;
  float *v103;
  float v104;
  float *v105;
  float v106;
  float *v107;
  float v108;
  float *v109;
  void *__p;
  void *v111;
  _QWORD v112[3];
  void *v113[3];
  void *v114[3];
  void *v115[3];
  void *v116[3];
  void *v117[3];
  void *v118[3];
  void *v119[3];
  void *v120[3];
  void *v121[3];
  void *v122[3];
  void *v123[3];
  char *v124;
  char *v125;
  uint64_t v126;

  v2 = (char *)this + 770728;
  v3 = (char *)this + 770744;
  v124 = 0;
  v125 = 0;
  v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, (char *)this + 770728, (uint64_t)this + 770744, 0x10uLL);
  median_of_path = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 258, v4);
  Scandium::fill_valid((float *)this + 193111, v6, median_of_path);
  if (v124)
  {
    v125 = v124;
    operator delete(v124);
  }
  v124 = 0;
  v125 = 0;
  v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, v2, (uint64_t)v3, 0x10uLL);
  v8 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 257, v7);
  Scandium::fill_valid((float *)this + 193112, v9, v8);
  if (v124)
  {
    v125 = v124;
    operator delete(v124);
  }
  v124 = 0;
  v125 = 0;
  v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, v2, (uint64_t)v3, 0x10uLL);
  v11 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 256, v10);
  Scandium::fill_valid((float *)this + 193113, v12, v11);
  if (v124)
  {
    v125 = v124;
    operator delete(v124);
  }
  v124 = 0;
  v125 = 0;
  v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, (char *)this + 770712, (uint64_t)v2, 0x10uLL);
  v14 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 258, v13);
  Scandium::fill_valid((float *)this + 193114, v15, v14);
  if (v124)
  {
    v125 = v124;
    operator delete(v124);
  }
  v124 = 0;
  v125 = 0;
  v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, (char *)this + 770712, (uint64_t)v2, 0x10uLL);
  v17 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 257, v16);
  Scandium::fill_valid((float *)this + 193115, v18, v17);
  if (v124)
  {
    v125 = v124;
    operator delete(v124);
  }
  v124 = 0;
  v125 = 0;
  v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, (char *)this + 770712, (uint64_t)v2, 0x10uLL);
  v20 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 256, v19);
  Scandium::fill_valid((float *)this + 193116, v21, v20);
  if (v124)
  {
    v125 = v124;
    operator delete(v124);
  }
  v124 = 0;
  v125 = 0;
  v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, (char *)this + 770704, (uint64_t)this + 770712, 8uLL);
  v23 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 0, v22);
  Scandium::fill_valid((float *)this + 193117, v24, v23);
  if (v124)
  {
    v125 = v124;
    operator delete(v124);
  }
  v124 = 0;
  v125 = 0;
  v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, (char *)this + 770700, (uint64_t)this + 770704, 4uLL);
  v26 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 0, v25);
  Scandium::fill_valid((float *)this + 193118, v27, v26);
  if (v124)
  {
    v125 = v124;
    operator delete(v124);
  }
  v124 = 0;
  v125 = 0;
  v126 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v124, (char *)this + 770776, (uint64_t)this + 770792, 4uLL);
  v28 = v124;
  v29 = Scandium::sort_median((Scandium *)v124, (const float *)((unint64_t)(v125 - v124) >> 2));
  Scandium::fill_valid((float *)this + 193119, v30, v29);
  v124 = 0;
  v125 = 0;
  v126 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v124, (char *)this + 770760, (uint64_t)this + 770776, 4uLL);
  if (v28)
    operator delete(v28);
  v31 = v124;
  v32 = Scandium::sort_median((Scandium *)v124, (const float *)((unint64_t)(v125 - v124) >> 2));
  Scandium::fill_valid((float *)this + 193120, v33, v32);
  v124 = 0;
  v125 = 0;
  v126 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v124, v3, (uint64_t)this + 770760, 4uLL);
  if (v31)
    operator delete(v31);
  v34 = v124;
  v35 = Scandium::sort_median((Scandium *)v124, (const float *)((unint64_t)(v125 - v124) >> 2));
  Scandium::fill_valid((float *)this + 193121, v36, v35);
  v37 = (float *)*((unsigned int *)this + 193136);
  if ((int)v37 >= 1)
  {
    LODWORD(v123[0]) = -1082130432;
    std::vector<float>::vector(&v124, 8uLL, v123);
    LODWORD(v122[0]) = -1082130432;
    std::vector<float>::vector(v123, 8uLL, v122);
    LODWORD(v121[0]) = -1082130432;
    std::vector<float>::vector(v122, 8uLL, v121);
    LODWORD(v120[0]) = -1082130432;
    std::vector<float>::vector(v121, 0x10uLL, v120);
    LODWORD(v119[0]) = -1082130432;
    std::vector<float>::vector(v120, 0x10uLL, v119);
    LODWORD(v118[0]) = -1082130432;
    std::vector<float>::vector(v119, 0x10uLL, v118);
    LODWORD(v117[0]) = -1082130432;
    std::vector<float>::vector(v118, 0x10uLL, v117);
    LODWORD(v116[0]) = -1082130432;
    std::vector<float>::vector(v117, 0x10uLL, v116);
    LODWORD(v115[0]) = -1082130432;
    std::vector<float>::vector(v116, 0x10uLL, v115);
    LODWORD(v114[0]) = -1082130432;
    std::vector<float>::vector(v115, 4uLL, v114);
    LODWORD(v113[0]) = -1082130432;
    std::vector<float>::vector(v114, 4uLL, v113);
    LODWORD(v112[0]) = -1082130432;
    std::vector<float>::vector(v113, 4uLL, v112);
    v39 = 0;
    v40 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 153852);
    do
    {
      Scandium::ScandiumPPG::calc_ppg_ac_metrics(v40, v37, (float *)((char *)v118[0] + v39), (float *)((char *)v117[0] + v39), v38);
      v41 = stats::mean((stats *)v40, v37);
      *(float *)((char *)v116[0] + v39) = v41;
      v39 += 4;
      v40 = (Scandium::ScandiumPPG *)((char *)v40 + 6400);
    }
    while (v39 != 64);
    v42 = 0;
    v43 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 51452);
    do
    {
      Scandium::ScandiumPPG::calc_ppg_ac_metrics(v43, v37, (float *)((char *)v121[0] + v42), (float *)((char *)v120[0] + v42), v38);
      v44 = stats::mean((stats *)v43, v37);
      *(float *)((char *)v119[0] + v42) = v44;
      v42 += 4;
      v43 = (Scandium::ScandiumPPG *)((char *)v43 + 6400);
    }
    while (v42 != 64);
    v45 = 0;
    v46 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 252);
    do
    {
      Scandium::ScandiumPPG::calc_ppg_ac_metrics(v46, v37, (float *)&v124[v45], (float *)((char *)v123[0] + v45), v38);
      v47 = stats::mean((stats *)v46, v37);
      *(float *)((char *)v122[0] + v45) = v47;
      v45 += 4;
      v46 = (Scandium::ScandiumPPG *)((char *)v46 + 6400);
    }
    while (v45 != 32);
    v48 = 0;
    v49 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 256252);
    do
    {
      Scandium::ScandiumPPG::calc_ppg_ac_metrics(v49, v37, (float *)((char *)v115[0] + v48), (float *)((char *)v114[0] + v48), v38);
      v50 = stats::mean((stats *)v49, v37);
      *(float *)((char *)v113[0] + v48) = v50;
      v48 += 4;
      v49 = (Scandium::ScandiumPPG *)((char *)v49 + 6400);
    }
    while (v48 != 16);
    v51 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v118, 258);
    Scandium::fill_valid((float *)this + 193087, v52, v51);
    v53 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v118, 257);
    Scandium::fill_valid((float *)this + 193088, v54, v53);
    v55 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v118, 256);
    Scandium::fill_valid((float *)this + 193089, v56, v55);
    v57 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v117, 258);
    Scandium::fill_valid((float *)this + 193095, v58, v57);
    v59 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v117, 257);
    Scandium::fill_valid((float *)this + 193096, v60, v59);
    v61 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v117, 256);
    Scandium::fill_valid((float *)this + 193097, v62, v61);
    v63 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v116, 258);
    Scandium::fill_valid((float *)this + 193103, v64, v63);
    v65 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v116, 257);
    Scandium::fill_valid((float *)this + 193104, v66, v65);
    v67 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v116, 256);
    Scandium::fill_valid((float *)this + 193105, v68, v67);
    v69 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v121, 258);
    Scandium::fill_valid((float *)this + 193090, v70, v69);
    v71 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v121, 257);
    Scandium::fill_valid((float *)this + 193091, v72, v71);
    v73 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v121, 256);
    Scandium::fill_valid((float *)this + 193092, v74, v73);
    v75 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v120, 258);
    Scandium::fill_valid((float *)this + 193098, v76, v75);
    v77 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v120, 257);
    Scandium::fill_valid((float *)this + 193099, v78, v77);
    v79 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v120, 256);
    Scandium::fill_valid((float *)this + 193100, v80, v79);
    v81 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v119, 258);
    Scandium::fill_valid((float *)this + 193106, v82, v81);
    v83 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v119, 257);
    Scandium::fill_valid((float *)this + 193107, v84, v83);
    v85 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v119, 256);
    Scandium::fill_valid((float *)this + 193108, v86, v85);
    v87 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)&v124, 0);
    Scandium::fill_valid((float *)this + 193093, v88, v87);
    v89 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v123, 0);
    Scandium::fill_valid((float *)this + 193101, v90, v89);
    v91 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v122, 0);
    Scandium::fill_valid((float *)this + 193109, v92, v91);
    v93 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v115, 0);
    Scandium::fill_valid((float *)this + 193094, v94, v93);
    v95 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v114, 0);
    Scandium::fill_valid((float *)this + 193102, v96, v95);
    v97 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v113, 0);
    Scandium::fill_valid((float *)this + 193110, v98, v97);
    v112[0] = (char *)this + 307452;
    v112[1] = (char *)this + 313852;
    v112[2] = (char *)this + 320252;
    Scandium::ScandiumPPG::calc_session_mavs((Scandium::ScandiumPPG *)v112, (float **)v37, 3, (float **)&__p);
    v99 = v111;
    if (v111 != __p)
    {
      v100 = stats::min((stats *)__p, (const float *)((unint64_t)((_BYTE *)v111 - (_BYTE *)__p) >> 2));
      Scandium::fill_valid((float *)this + 193122, v101, v100);
      v102 = stats::max((stats *)__p, (const float *)((unint64_t)((_BYTE *)v111 - (_BYTE *)__p) >> 2));
      Scandium::fill_valid((float *)this + 193123, v103, v102);
      v104 = stats::mean((stats *)__p, (const float *)((unint64_t)((_BYTE *)v111 - (_BYTE *)__p) >> 2));
      Scandium::fill_valid((float *)this + 193124, v105, v104);
      v106 = Scandium::sort_median((Scandium *)__p, (const float *)((unint64_t)((_BYTE *)v111 - (_BYTE *)__p) >> 2));
      Scandium::fill_valid((float *)this + 193125, v107, v106);
      v108 = stats::std((stats *)__p, (const float *)((unint64_t)((_BYTE *)v111 - (_BYTE *)__p) >> 2), 0);
      Scandium::fill_valid((float *)this + 193126, v109, v108);
      v99 = __p;
    }
    if (v99)
    {
      v111 = v99;
      operator delete(v99);
    }
    if (v113[0])
    {
      v113[1] = v113[0];
      operator delete(v113[0]);
    }
    if (v114[0])
    {
      v114[1] = v114[0];
      operator delete(v114[0]);
    }
    if (v115[0])
    {
      v115[1] = v115[0];
      operator delete(v115[0]);
    }
    if (v116[0])
    {
      v116[1] = v116[0];
      operator delete(v116[0]);
    }
    if (v117[0])
    {
      v117[1] = v117[0];
      operator delete(v117[0]);
    }
    if (v118[0])
    {
      v118[1] = v118[0];
      operator delete(v118[0]);
    }
    if (v119[0])
    {
      v119[1] = v119[0];
      operator delete(v119[0]);
    }
    if (v120[0])
    {
      v120[1] = v120[0];
      operator delete(v120[0]);
    }
    if (v121[0])
    {
      v121[1] = v121[0];
      operator delete(v121[0]);
    }
    if (v122[0])
    {
      v122[1] = v122[0];
      operator delete(v122[0]);
    }
    if (v123[0])
    {
      v123[1] = v123[0];
      operator delete(v123[0]);
    }
    if (v124)
    {
      v125 = v124;
      operator delete(v124);
    }
  }
  if (v34)
    operator delete(v34);
}

void sub_24581778C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34)
{
  void *v34;
  uint64_t v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  if (__p)
    operator delete(__p);
  if (a18)
    operator delete(a18);
  if (a21)
    operator delete(a21);
  if (a24)
    operator delete(a24);
  if (a27)
    operator delete(a27);
  if (a30)
    operator delete(a30);
  if (a33)
    operator delete(a33);
  v37 = *(void **)(v35 - 184);
  if (v37)
  {
    *(_QWORD *)(v35 - 176) = v37;
    operator delete(v37);
  }
  v38 = *(void **)(v35 - 160);
  if (v38)
  {
    *(_QWORD *)(v35 - 152) = v38;
    operator delete(v38);
  }
  v39 = *(void **)(v35 - 136);
  if (v39)
  {
    *(_QWORD *)(v35 - 128) = v39;
    operator delete(v39);
  }
  v40 = *(void **)(v35 - 112);
  if (v40)
  {
    *(_QWORD *)(v35 - 104) = v40;
    operator delete(v40);
  }
  v41 = *(void **)(v35 - 88);
  if (v41)
  {
    *(_QWORD *)(v35 - 80) = v41;
    operator delete(v41);
  }
  if (v34)
    operator delete(v34);
  _Unwind_Resume(exception_object);
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_processor_t::report_rslts(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, float *a2)
{
  char *v3;
  float *v4;
  int v5;
  float *v6;
  float *v7;
  float *v8;
  float *v9;
  float *v10;
  float v11;
  void *v12;
  float v13;
  float *v14;
  double v15;
  uint64_t v16;
  int v17;
  float v18;
  float *v19;
  float v20;
  float v21;
  float *v22;
  uint64_t v23;
  int v24;
  float *v25;
  float v26;
  float v27;
  float v28;
  float *v29;
  uint64_t v30;
  float v31;
  float v32;
  float *v33;
  uint64_t v34;
  int v35;
  const float *v36;
  int v37;
  float v38;
  uint64_t v39;
  float v40;
  float v41;
  float v42;
  float v43;
  _BYTE __dst[1796];
  float v46;

  v3 = (char *)this + 772528;
  v4 = (float *)((char *)this + 623296);
  v5 = *((unsigned __int8 *)this + 770698);
  if (v5 == 1)
  {
    v6 = (float *)((char *)this + 632464);
    Scandium::fill_valid((float *)this + 193018, a2, *v4);
    Scandium::fill_valid((float *)this + 193022, v7, v4[3]);
    Scandium::fill_valid((float *)this + 193040, v8, *v6);
    Scandium::fill_valid((float *)this + 193041, v9, *((float *)this + 158119));
    v10 = (float *)&Scandium::ScandiumPPG::MAX_SPO2_DISPLAY_VALUE;
    if (*v4 <= 100.0)
      v10 = v4;
    if (*v4 < 60.0)
      v10 = (float *)&Scandium::ScandiumPPG::MIN_SPO2_DISPLAY_VALUE;
    v11 = *v10;
    v12 = memcpy(__dst, (char *)this + 623384, 0x700uLL);
    v13 = Scandium::ScandiumPPG::scandium_spo2_processor_t::median_hr_allpaths((uint64_t)v12, (uint64_t)__dst);
    goto LABEL_35;
  }
  v15 = nan((const char *)&unk_24582A75F);
  if (v5 != 2)
  {
    v13 = v15;
    v11 = v13;
LABEL_35:
    v43 = v11;
    return Scandium::ScandiumPPG::scandium_spo2_processor_t::result_handler_proxy((uint64_t)this, v43, v13);
  }
  v16 = *((unsigned int *)v3 + 2);
  if ((int)v16 < 1)
    goto LABEL_14;
  v17 = 0;
  v18 = 0.0;
  v19 = v4;
  do
  {
    v20 = *v19++;
    v18 = v18 + v20;
    ++v17;
    --v16;
  }
  while (v16);
  if (v17)
    v21 = v18 / (float)v17;
  else
LABEL_14:
    v21 = NAN;
  Scandium::fill_valid((float *)this + 193018, v14, roundf(v21));
  v23 = *((unsigned int *)v3 + 2);
  if ((int)v23 < 1)
    goto LABEL_20;
  v24 = 0;
  v25 = v4 + 3;
  v26 = 0.0;
  do
  {
    v27 = *v25++;
    v26 = v26 + v27;
    ++v24;
    --v23;
  }
  while (v23);
  if (v24)
    v28 = v26 / (float)v24;
  else
LABEL_20:
    v28 = NAN;
  Scandium::fill_valid((float *)this + 193022, v22, v28);
  v30 = *((unsigned int *)v3 + 2);
  v46 = 0.0;
  v31 = 0.0;
  v32 = 0.0;
  if ((int)v30 >= 1)
  {
    vDSP_meanv_wrapper((uint64_t)this + 632464, 1, &v46, v30);
    v32 = v46;
  }
  Scandium::fill_valid((float *)this + 193040, v29, v32);
  v34 = *((unsigned int *)v3 + 2);
  v46 = 0.0;
  if ((int)v34 >= 1)
  {
    vDSP_meanv_wrapper((uint64_t)this + 632476, 1, &v46, v34);
    v31 = v46;
  }
  v35 = Scandium::fill_valid((float *)this + 193041, v33, v31);
  v36 = (const float *)*((unsigned int *)v3 + 2);
  if ((int)v36 < 1)
    goto LABEL_30;
  v37 = 0;
  v38 = 0.0;
  v39 = *((unsigned int *)v3 + 2);
  do
  {
    v40 = *v4++;
    v38 = v38 + v40;
    ++v37;
    --v39;
  }
  while (v39);
  if (v37)
    v41 = v38 / (float)v37;
  else
LABEL_30:
    v41 = NAN;
  v42 = roundf(v41);
  if (v42 <= 100.0)
    v11 = v42;
  else
    v11 = 100.0;
  v13 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_median_hr(v35, v36, (stats *)((char *)this + 623368));
  v43 = 60.0;
  if (v42 >= 60.0)
    goto LABEL_35;
  return Scandium::ScandiumPPG::scandium_spo2_processor_t::result_handler_proxy((uint64_t)this, v43, v13);
}

void Scandium::ScandiumPPG::beats_t::~beats_t(Scandium::ScandiumPPG::beats_t *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 4);
  if (v2)
  {
    *((_QWORD *)this + 5) = v2;
    operator delete(v2);
  }
  v3 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v3;
    operator delete(v3);
  }
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_processor_t::result_handler_proxy(uint64_t a1, float a2, float a3)
{
  NSObject *log;
  int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  void *__p[2];
  uint64_t v13;
  void *v14[2];
  uint64_t v15;
  void *v16[2];
  uint64_t v17;
  _BYTE v18[8];
  _BYTE v19[40];
  void *v20[2];
  char v21;
  uint8_t buf[4];
  double v23;
  __int16 v24;
  double v25;
  _QWORD v26[4];
  int v27;
  int v28;
  _QWORD v29[4];
  int v30;
  int v31;
  _QWORD v32[4];
  __int128 v33;
  uint64_t v34;
  int v35;
  int v36;
  _QWORD v37[4];
  __int128 v38;
  uint64_t v39;
  int v40;
  int v41;
  _QWORD v42[4];
  __int128 v43;
  uint64_t v44;
  int v45;
  int v46;
  _QWORD v47[4];
  float v48;
  int v49;
  _QWORD v50[4];
  float v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  log = Scandium::algs_get_log((Scandium *)a1);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v23 = a2;
    v24 = 2048;
    v25 = a3;
    _os_log_impl(&dword_2457F9000, log, OS_LOG_TYPE_DEFAULT, "scandium report results: spo2: %.06f hr: %.06f", buf, 0x16u);
  }
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics((Scandium::ScandiumPPG::scandium_spo2_processor_t *)a1);
  if (*(_QWORD *)(a1 + 772768))
  {
    std::string::basic_string[abi:ne180100]<0>(v20, "report");
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[13],char const(&)[7],0>((uint64_t)buf, "algs_version", "11.1.3");
    std::string::basic_string[abi:ne180100]<0>(v26, "algs_mode");
    v27 = *(unsigned __int8 *)(a1 + 770698);
    v28 = 1;
    v7 = *(_DWORD *)(a1 + 772516);
    std::string::basic_string[abi:ne180100]<0>(v29, "optical_gen");
    v30 = v7;
    v31 = 1;
    v8 = *(int *)(a1 + 772536);
    v16[1] = 0;
    v17 = 0;
    v16[0] = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v16, (const void *)(a1 + 623296), a1 + 623296 + 4 * v8, v8);
    std::string::basic_string[abi:ne180100]<0>(v32, "window_spo2");
    v33 = *(_OWORD *)v16;
    v34 = v17;
    v16[1] = 0;
    v17 = 0;
    v16[0] = 0;
    v35 = 3;
    v36 = 6;
    v14[0] = 0;
    v14[1] = 0;
    v15 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v14, (const void *)(a1 + 623308), a1 + 623320, 3uLL);
    std::string::basic_string[abi:ne180100]<0>(v37, "window_spo2_no_conf_gate");
    v38 = *(_OWORD *)v14;
    v39 = v15;
    v14[1] = 0;
    v15 = 0;
    v14[0] = 0;
    v40 = 3;
    v41 = 6;
    __p[0] = 0;
    __p[1] = 0;
    v13 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(__p, (const void *)(a1 + 623368), a1 + 623380, 3uLL);
    std::string::basic_string[abi:ne180100]<0>(v42, "window_hr");
    v43 = *(_OWORD *)__p;
    v44 = v13;
    __p[1] = 0;
    v13 = 0;
    __p[0] = 0;
    v45 = 3;
    v46 = 6;
    std::string::basic_string[abi:ne180100]<0>(v47, "result_spo2");
    v48 = a2;
    v49 = 3;
    std::string::basic_string[abi:ne180100]<0>(v50, "result_hr");
    v51 = a3;
    v52 = 3;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v19, buf, 8);
    v9 = *(_QWORD *)(a1 + 772768);
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, void **, _BYTE *))(*(_QWORD *)v9 + 48))(v9, v20, v19);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v19);
    v10 = 576;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v19[v10 + 24]);
      if ((char)v19[v10 + 15] < 0)
        operator delete(*(void **)&v18[v10]);
      v10 -= 72;
    }
    while (v10);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v14[0])
    {
      v14[1] = v14[0];
      operator delete(v14[0]);
    }
    if (v16[0])
    {
      v16[1] = v16[0];
      operator delete(v16[0]);
    }
    if (v21 < 0)
      operator delete(v20[0]);
    Scandium::ScandiumPPG::scandium_spo2_processor_t::log_core_analytics((Scandium::ScandiumPPG::scandium_spo2_processor_t *)a1);
  }
  result = *(_QWORD *)(a1 + 772640);
  if (result)
  {
    *(_DWORD *)buf = roundf(a2);
    LODWORD(v23) = roundf(a3);
    return (*(uint64_t (**)(uint64_t, uint8_t *))(*(_QWORD *)result + 48))(result, buf);
  }
  return result;
}

void sub_2458180C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,char a32)
{
  uint64_t i;

  for (i = 504; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a32 + i));
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  if (a17)
    operator delete(a17);
  if (a31 < 0)
    operator delete(a26);
  _Unwind_Resume(a1);
}

float Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga_openness(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, stats *a2, stats *a3, const float *a4)
{
  float *v6;
  float v7;
  float v8;
  uint64_t v9;
  float result;
  float v11;
  float v12;
  float v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  uint64_t v24;

  if (!(_DWORD)a4)
    return NAN;
  v6 = (float *)a2;
  v24 = 0;
  v7 = stats::mean(a2, a4);
  v8 = stats::mean(a3, a4);
  vDSP_maxv_wrapper((uint64_t)v6, 1, (float *)&v24 + 1, (int)a4);
  vDSP_minv_wrapper((uint64_t)v6, 1, (float *)&v24, (int)a4);
  v9 = v24;
  vDSP_maxv_wrapper((uint64_t)a3, 1, (float *)&v24 + 1, (int)a4);
  vDSP_minv_wrapper((uint64_t)a3, 1, (float *)&v24, (int)a4);
  result = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  if ((int)a4 >= 1)
  {
    v14 = a4;
    v13 = 0.0;
    v12 = 0.0;
    do
    {
      v15 = *v6++;
      v16 = (float)(v15 - v7) / (float)(*((float *)&v9 + 1) - *(float *)&v9);
      v17 = *(float *)a3->cp_time;
      a3 = (stats *)((char *)a3 + 4);
      v18 = (float)(v17 - v8) / (float)(*((float *)&v24 + 1) - *(float *)&v24);
      v11 = v11 + (float)(v16 * v16);
      v12 = v12 + (float)(v16 * v18);
      v13 = v13 + (float)(v18 * v18);
      --v14;
    }
    while (v14);
  }
  v19 = v11 / (float)(int)a4;
  v20 = v13 / (float)(int)a4;
  v21 = sqrtf((float)((float)((float)(v12 / (float)(int)a4) * (float)(v12 / (float)(int)a4)) * 4.0)+ (float)((float)(v20 - v19) * (float)(v20 - v19)));
  v22 = v19 + v20;
  v23 = (float)(v22 - v21) * 0.5;
  if (v23 >= 0.0)
    return sqrtf(v23 / (float)((float)(v22 + v21) * 0.5));
  return result;
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_good_snips(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  int v7;
  unint64_t i;
  unint64_t v11;
  _DWORD *v12;
  _DWORD *v13;
  _DWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  int v21;

  v7 = *(_DWORD *)(a3 + 16);
  if (v7 >= 1)
  {
    for (i = 0; (uint64_t)i < v7; ++i)
    {
      if (((*(_QWORD *)(*a4 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v12 = *(_DWORD **)(a2 + 8);
        v11 = *(_QWORD *)(a2 + 16);
        if ((unint64_t)v12 >= v11)
        {
          v14 = *(_DWORD **)a2;
          v15 = ((uint64_t)v12 - *(_QWORD *)a2) >> 2;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v17 = v11 - (_QWORD)v14;
          if (v17 >> 1 > v16)
            v16 = v17 >> 1;
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
            v18 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v18 = v16;
          if (v18)
          {
            v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2 + 16, v18);
            v14 = *(_DWORD **)a2;
            v12 = *(_DWORD **)(a2 + 8);
          }
          else
          {
            v19 = 0;
          }
          v20 = &v19[4 * v15];
          *(_DWORD *)v20 = i;
          v13 = v20 + 4;
          while (v12 != v14)
          {
            v21 = *--v12;
            *((_DWORD *)v20 - 1) = v21;
            v20 -= 4;
          }
          *(_QWORD *)a2 = v20;
          *(_QWORD *)(a2 + 8) = v13;
          *(_QWORD *)(a2 + 16) = &v19[4 * v18];
          if (v14)
            operator delete(v14);
        }
        else
        {
          *v12 = i;
          v13 = v12 + 1;
        }
        *(_QWORD *)(a2 + 8) = v13;
        v7 = *(_DWORD *)(a3 + 16);
      }
    }
  }
  *(_QWORD *)(a5 + 48) = a2;
  *(_DWORD *)(a5 + 104) = (*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2;
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_dropped_samples_metrics_for_window_and_type(uint64_t a1, uint64_t a2, int *a3, int a4, int a5)
{
  uint64_t v5;
  unsigned __int16 v6;
  int v7;
  BOOL v8;
  unsigned __int16 v9;
  uint64_t i;
  int v11;
  BOOL v12;

  *(_DWORD *)a2 = 0;
  v5 = (a4 - 1);
  if (a4 >= 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    for (i = a4; i; --i)
    {
      v11 = *a3++;
      v12 = (v11 & a5) != 0;
      if ((v11 & a5) != 0)
      {
        ++v9;
        *(_WORD *)a2 = ++v7;
        if (!v5)
          goto LABEL_7;
      }
      else if (v8)
      {
LABEL_7:
        if (v9 > v6)
        {
          *(_WORD *)(a2 + 2) = v9;
          v6 = v9;
        }
        v9 = 0;
      }
      --v5;
      v8 = v12;
    }
  }
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  float *v14;
  void **v15;
  uint64_t v16;
  void ***v17;
  uint64_t v18;
  float v19;
  float *v20;
  void **v21;
  uint64_t v22;
  void ***v23;
  uint64_t v24;
  float v25;
  float *v26;
  void **v27;
  uint64_t v28;
  void ***v29;
  uint64_t v30;
  float v31;
  float *v32;
  void **v33;
  uint64_t v34;
  void ***v35;
  uint64_t v36;
  float v37;
  float *v38;
  void **v39;
  uint64_t v40;
  void ***v41;
  uint64_t v42;
  float v43;
  float *v44;
  void **v45;
  uint64_t v46;
  void ***v47;
  uint64_t v48;
  float v49;
  float *v50;
  void **v51;
  uint64_t v52;
  void ***v53;
  uint64_t v54;
  float v55;
  float *v56;
  void **v57;
  uint64_t v58;
  void ***v59;
  uint64_t v60;
  float v61;
  float *v62;
  void **v63;
  uint64_t v64;
  void ***v65;
  uint64_t v66;
  float v67;
  float *v68;
  void **v69;
  uint64_t v70;
  void ***v71;
  uint64_t v72;
  float v73;
  float *v74;
  void **v75;
  uint64_t v76;
  void ***v77;
  uint64_t v78;
  float v79;
  float *v80;
  void **v81;
  uint64_t v82;
  void ***v83;
  uint64_t v84;
  float v85;
  float *v86;
  void **v87;
  uint64_t v88;
  void ***v89;
  uint64_t v90;
  void **v91;
  uint64_t v92;
  void ***v93;
  uint64_t v94;
  void **v95;
  uint64_t v96;
  void ***v97;
  uint64_t v98;
  float v99;
  void **v100;
  uint64_t v101;
  uint64_t v102;
  void ***v103;
  uint64_t v104;
  void **v105;
  uint64_t v106;
  void ***v107;
  uint64_t v108;
  float v109;
  void **v110;
  uint64_t v111;
  void ***v112;
  uint64_t v113;
  void **v114;
  uint64_t v115;
  void ***v116;
  uint64_t v117;
  float v118;
  void **v119;
  uint64_t v120;
  void ***v121;
  uint64_t v122;
  void **v123;
  uint64_t v124;
  void ***v125;
  uint64_t v126;
  void **v127;
  uint64_t v128;
  void ***v129;
  uint64_t v130;
  void **v131;
  uint64_t v132;
  void ***v133;
  uint64_t v134;
  void **v135;
  uint64_t v136;
  void ***v137;
  uint64_t v138;
  void **v139;
  uint64_t v140;
  void ***v141;
  uint64_t v142;
  void **v143;
  uint64_t v144;
  void ***v145;
  uint64_t v146;
  void **v147;
  uint64_t v148;
  void ***v149;
  uint64_t v150;
  void **v151;
  uint64_t v152;
  void ***v153;
  uint64_t v154;
  Scandium **v155;
  void **v156;
  uint64_t v157;
  void ***v158;
  uint64_t v159;
  unint64_t v160;
  float v161;
  float *v162;
  Scandium *v163;
  unint64_t v164;
  float v165;
  float *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169[3];
  uint64_t v170[3];
  uint64_t v171[3];
  uint64_t v172[3];
  uint64_t v173[3];
  uint64_t v174[3];
  uint64_t v175[3];
  uint64_t v176[3];
  uint64_t v177[3];
  uint64_t v178[3];
  uint64_t v179[3];
  uint64_t v180[3];
  void *v181;
  void *v182;
  void **v183;
  void **v184;
  void **v185;
  uint64_t v186;
  void ***v187;
  uint64_t v188;

  v188 = *MEMORY[0x24BDAC8D0];
  if (*((_QWORD *)this + 1) == *(_QWORD *)this)
    return;
  v2 = (uint64_t *)((char *)this + 24);
  if (*((_QWORD *)this + 4) == *((_QWORD *)this + 3)
    || *((_QWORD *)this + 7) == *((_QWORD *)this + 6)
    || *((_QWORD *)this + 10) == *((_QWORD *)this + 9)
    || *((_QWORD *)this + 13) == *((_QWORD *)this + 12))
  {
    return;
  }
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this, 1, 0, v180);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this, 0, 0, v179);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this, 2, 0, v178);
  memset(v177, 0, sizeof(v177));
  v3 = (char *)*((_QWORD *)this + 9);
  v4 = (char *)*((_QWORD *)this + 10);
  if (v3 != v4)
  {
    do
    {
      v5 = v3 + 64;
      v184 = 0;
      v185 = 0;
      v186 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v184, v3, (uint64_t)(v3 + 64), 0x10uLL);
      std::vector<std::vector<float>>::push_back[abi:ne180100](v177, (uint64_t)&v184);
      if (v184)
      {
        v185 = v184;
        operator delete(v184);
      }
      v3 = v5;
    }
    while (v5 != v4);
  }
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 9, 1, 0, v176);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 9, 0, 0, v175);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 9, 2, 0, v174);
  memset(v173, 0, sizeof(v173));
  v6 = (char *)*((_QWORD *)this + 9);
  v7 = (char *)*((_QWORD *)this + 10);
  if (v6 != v7)
  {
    do
    {
      v8 = v6 + 64;
      v184 = 0;
      v185 = 0;
      v186 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v184, v6, (uint64_t)(v6 + 64), 0x10uLL);
      std::vector<std::vector<float>>::push_back[abi:ne180100](v173, (uint64_t)&v184);
      if (v184)
      {
        v185 = v184;
        operator delete(v184);
      }
      v6 = v8;
    }
    while (v8 != v7);
  }
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 6, 1, 0, v172);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 6, 0, 0, v171);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 6, 2, 0, v170);
  if (v178[1] == v178[0])
    std::vector<float>::__throw_out_of_range[abi:ne180100]();
  if (v180[1] == v180[0])
    std::vector<float>::__throw_out_of_range[abi:ne180100]();
  if (v179[1] == v179[0])
    std::vector<float>::__throw_out_of_range[abi:ne180100]();
  v9 = *(_QWORD *)(v178[0] + 8);
  v167 = *(_QWORD *)v178[0];
  v10 = *(_QWORD *)v180[0];
  v168 = *(_QWORD *)(v180[0] + 8);
  v12 = *(_QWORD *)v179[0];
  v11 = *(_QWORD *)(v179[0] + 8);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 12, 2, 1, v169);
  v184 = (void **)&unk_25169D588;
  v185 = (void **)Scandium::sort_median;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = Scandium::sort_median;
  v183 = &v181;
  v13 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v169, (uint64_t)&v184, (uint64_t)&v181);
  Scandium::fill_valid((float *)this + 193070, v14, v13);
  v15 = v183;
  if (v183 == &v181)
  {
    v16 = 4;
    v15 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_22;
    v16 = 5;
  }
  (*((void (**)(void))*v15 + v16))();
LABEL_22:
  v17 = v187;
  if (v187 == &v184)
  {
    v18 = 4;
    v17 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_27;
    v18 = 5;
  }
  ((void (*)(void))(*v17)[v18])();
LABEL_27:
  v184 = (void **)v169;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::min;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::min;
  v183 = &v181;
  v19 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v180, (uint64_t)&v184, (uint64_t)&v181);
  Scandium::fill_valid((float *)this + 193058, v20, v19);
  v21 = v183;
  if (v183 == &v181)
  {
    v22 = 4;
    v21 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_32;
    v22 = 5;
  }
  (*((void (**)(void))*v21 + v22))();
LABEL_32:
  v23 = v187;
  if (v187 == &v184)
  {
    v24 = 4;
    v23 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_37;
    v24 = 5;
  }
  ((void (*)(void))(*v23)[v24])();
LABEL_37:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::min;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::min;
  v183 = &v181;
  v25 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v179, (uint64_t)&v184, (uint64_t)&v181);
  Scandium::fill_valid((float *)this + 193059, v26, v25);
  v27 = v183;
  if (v183 == &v181)
  {
    v28 = 4;
    v27 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_42;
    v28 = 5;
  }
  (*((void (**)(void))*v27 + v28))();
LABEL_42:
  v29 = v187;
  if (v187 == &v184)
  {
    v30 = 4;
    v29 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_47;
    v30 = 5;
  }
  ((void (*)(void))(*v29)[v30])();
LABEL_47:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::min;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::min;
  v183 = &v181;
  v31 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v178, (uint64_t)&v184, (uint64_t)&v181);
  Scandium::fill_valid((float *)this + 193060, v32, v31);
  v33 = v183;
  if (v183 == &v181)
  {
    v34 = 4;
    v33 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_52;
    v34 = 5;
  }
  (*((void (**)(void))*v33 + v34))();
LABEL_52:
  v35 = v187;
  if (v187 == &v184)
  {
    v36 = 4;
    v35 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_57;
    v36 = 5;
  }
  ((void (*)(void))(*v35)[v36])();
LABEL_57:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)Scandium::sort_median;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = Scandium::sort_median;
  v183 = &v181;
  v37 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v180, (uint64_t)&v184, (uint64_t)&v181);
  Scandium::fill_valid((float *)this + 193061, v38, v37);
  v39 = v183;
  if (v183 == &v181)
  {
    v40 = 4;
    v39 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_62;
    v40 = 5;
  }
  (*((void (**)(void))*v39 + v40))();
LABEL_62:
  v41 = v187;
  if (v187 == &v184)
  {
    v42 = 4;
    v41 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_67;
    v42 = 5;
  }
  ((void (*)(void))(*v41)[v42])();
LABEL_67:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)Scandium::sort_median;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = Scandium::sort_median;
  v183 = &v181;
  v43 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v179, (uint64_t)&v184, (uint64_t)&v181);
  Scandium::fill_valid((float *)this + 193062, v44, v43);
  v45 = v183;
  if (v183 == &v181)
  {
    v46 = 4;
    v45 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_72;
    v46 = 5;
  }
  (*((void (**)(void))*v45 + v46))();
LABEL_72:
  v47 = v187;
  if (v187 == &v184)
  {
    v48 = 4;
    v47 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_77;
    v48 = 5;
  }
  ((void (*)(void))(*v47)[v48])();
LABEL_77:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)Scandium::sort_median;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = Scandium::sort_median;
  v183 = &v181;
  v49 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v178, (uint64_t)&v184, (uint64_t)&v181);
  Scandium::fill_valid((float *)this + 193063, v50, v49);
  v51 = v183;
  if (v183 == &v181)
  {
    v52 = 4;
    v51 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_82;
    v52 = 5;
  }
  (*((void (**)(void))*v51 + v52))();
LABEL_82:
  v53 = v187;
  if (v187 == &v184)
  {
    v54 = 4;
    v53 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_87;
    v54 = 5;
  }
  ((void (*)(void))(*v53)[v54])();
LABEL_87:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::max;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::max;
  v183 = &v181;
  v55 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v180, (uint64_t)&v184, (uint64_t)&v181);
  Scandium::fill_valid((float *)this + 193064, v56, v55);
  v57 = v183;
  if (v183 == &v181)
  {
    v58 = 4;
    v57 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_92;
    v58 = 5;
  }
  (*((void (**)(void))*v57 + v58))();
LABEL_92:
  v59 = v187;
  if (v187 == &v184)
  {
    v60 = 4;
    v59 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_97;
    v60 = 5;
  }
  ((void (*)(void))(*v59)[v60])();
LABEL_97:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::max;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::max;
  v183 = &v181;
  v61 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v179, (uint64_t)&v184, (uint64_t)&v181);
  Scandium::fill_valid((float *)this + 193065, v62, v61);
  v63 = v183;
  if (v183 == &v181)
  {
    v64 = 4;
    v63 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_102;
    v64 = 5;
  }
  (*((void (**)(void))*v63 + v64))();
LABEL_102:
  v65 = v187;
  if (v187 == &v184)
  {
    v66 = 4;
    v65 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_107;
    v66 = 5;
  }
  ((void (*)(void))(*v65)[v66])();
LABEL_107:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::max;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::max;
  v183 = &v181;
  v67 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v178, (uint64_t)&v184, (uint64_t)&v181);
  Scandium::fill_valid((float *)this + 193066, v68, v67);
  v69 = v183;
  if (v183 == &v181)
  {
    v70 = 4;
    v69 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_112;
    v70 = 5;
  }
  (*((void (**)(void))*v69 + v70))();
LABEL_112:
  v71 = v187;
  if (v187 == &v184)
  {
    v72 = 4;
    v71 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_117;
    v72 = 5;
  }
  ((void (*)(void))(*v71)[v72])();
LABEL_117:
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()(v2, 1, 0, v169);
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::mean;
  v183 = &v181;
  v73 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v169, (uint64_t)&v184, (uint64_t)&v181);
  Scandium::fill_valid((float *)this + 193067, v74, v73);
  v75 = v183;
  if (v183 == &v181)
  {
    v76 = 4;
    v75 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_122;
    v76 = 5;
  }
  (*((void (**)(void))*v75 + v76))();
LABEL_122:
  v77 = v187;
  if (v187 == &v184)
  {
    v78 = 4;
    v77 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_127;
    v78 = 5;
  }
  ((void (*)(void))(*v77)[v78])();
LABEL_127:
  v184 = (void **)v169;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()(v2, 0, 0, v169);
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::mean;
  v183 = &v181;
  v79 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v169, (uint64_t)&v184, (uint64_t)&v181);
  Scandium::fill_valid((float *)this + 193068, v80, v79);
  v81 = v183;
  if (v183 == &v181)
  {
    v82 = 4;
    v81 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_132;
    v82 = 5;
  }
  (*((void (**)(void))*v81 + v82))();
LABEL_132:
  v83 = v187;
  if (v187 == &v184)
  {
    v84 = 4;
    v83 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_137;
    v84 = 5;
  }
  ((void (*)(void))(*v83)[v84])();
LABEL_137:
  v184 = (void **)v169;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()(v2, 2, 0, v169);
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::mean;
  v183 = &v181;
  v85 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v169, (uint64_t)&v184, (uint64_t)&v181);
  Scandium::fill_valid((float *)this + 193069, v86, v85);
  v87 = v183;
  if (v183 == &v181)
  {
    v88 = 4;
    v87 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_142;
    v88 = 5;
  }
  (*((void (**)(void))*v87 + v88))();
LABEL_142:
  v89 = v187;
  if (v187 == &v184)
  {
    v90 = 4;
    v89 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_147;
    v90 = 5;
  }
  ((void (*)(void))(*v89)[v90])();
LABEL_147:
  v184 = (void **)v169;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::max;
  v183 = &v181;
  *((_DWORD *)this + 193071) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v177, (uint64_t)&v184, (uint64_t)&v181)* 16.0);
  v91 = v183;
  if (v183 == &v181)
  {
    v92 = 4;
    v91 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_152;
    v92 = 5;
  }
  (*((void (**)(void))*v91 + v92))();
LABEL_152:
  v93 = v187;
  if (v187 == &v184)
  {
    v94 = 4;
    v93 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_157;
    v94 = 5;
  }
  ((void (*)(void))(*v93)[v94])();
LABEL_157:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::min;
  v183 = &v181;
  *((_DWORD *)this + 193072) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v177, (uint64_t)&v184, (uint64_t)&v181)* 16.0);
  v95 = v183;
  if (v183 == &v181)
  {
    v96 = 4;
    v95 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_162;
    v96 = 5;
  }
  (*((void (**)(void))*v95 + v96))();
LABEL_162:
  v97 = v187;
  if (v187 == &v184)
  {
    v98 = 4;
    v97 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_167;
    v98 = 5;
  }
  ((void (*)(void))(*v97)[v98])();
LABEL_167:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::max;
  v183 = &v181;
  v99 = (float)(unint64_t)((v168 - v10) >> 2);
  *((_DWORD *)this + 193073) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v176, (uint64_t)&v184, (uint64_t)&v181)* v99);
  v100 = v183;
  if (v183 == &v181)
  {
    v102 = 4;
    v100 = &v181;
    v101 = v11;
  }
  else
  {
    v101 = v11;
    if (!v183)
      goto LABEL_172;
    v102 = 5;
  }
  (*((void (**)(void))*v100 + v102))();
LABEL_172:
  v103 = v187;
  if (v187 == &v184)
  {
    v104 = 4;
    v103 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_177;
    v104 = 5;
  }
  ((void (*)(void))(*v103)[v104])();
LABEL_177:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::min;
  v183 = &v181;
  *((_DWORD *)this + 193074) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v176, (uint64_t)&v184, (uint64_t)&v181)* v99);
  v105 = v183;
  if (v183 == &v181)
  {
    v106 = 4;
    v105 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_182;
    v106 = 5;
  }
  (*((void (**)(void))*v105 + v106))();
LABEL_182:
  v107 = v187;
  if (v187 == &v184)
  {
    v108 = 4;
    v107 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_187;
    v108 = 5;
  }
  ((void (*)(void))(*v107)[v108])();
LABEL_187:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::max;
  v183 = &v181;
  v109 = (float)(unint64_t)((v101 - v12) >> 2);
  *((_DWORD *)this + 193075) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v175, (uint64_t)&v184, (uint64_t)&v181)* v109);
  v110 = v183;
  if (v183 == &v181)
  {
    v111 = 4;
    v110 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_192;
    v111 = 5;
  }
  (*((void (**)(void))*v110 + v111))();
LABEL_192:
  v112 = v187;
  if (v187 == &v184)
  {
    v113 = 4;
    v112 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_197;
    v113 = 5;
  }
  ((void (*)(void))(*v112)[v113])();
LABEL_197:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::min;
  v183 = &v181;
  *((_DWORD *)this + 193076) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v175, (uint64_t)&v184, (uint64_t)&v181)* v109);
  v114 = v183;
  if (v183 == &v181)
  {
    v115 = 4;
    v114 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_202;
    v115 = 5;
  }
  (*((void (**)(void))*v114 + v115))();
LABEL_202:
  v116 = v187;
  if (v187 == &v184)
  {
    v117 = 4;
    v116 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_207;
    v117 = 5;
  }
  ((void (*)(void))(*v116)[v117])();
LABEL_207:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::max;
  v183 = &v181;
  v118 = (float)(unint64_t)((v9 - v167) >> 2);
  *((_DWORD *)this + 193077) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v174, (uint64_t)&v184, (uint64_t)&v181)* v118);
  v119 = v183;
  if (v183 == &v181)
  {
    v120 = 4;
    v119 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_212;
    v120 = 5;
  }
  (*((void (**)(void))*v119 + v120))();
LABEL_212:
  v121 = v187;
  if (v187 == &v184)
  {
    v122 = 4;
    v121 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_217;
    v122 = 5;
  }
  ((void (*)(void))(*v121)[v122])();
LABEL_217:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::min;
  v183 = &v181;
  *((_DWORD *)this + 193078) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v174, (uint64_t)&v184, (uint64_t)&v181)* v118);
  v123 = v183;
  if (v183 == &v181)
  {
    v124 = 4;
    v123 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_222;
    v124 = 5;
  }
  (*((void (**)(void))*v123 + v124))();
LABEL_222:
  v125 = v187;
  if (v187 == &v184)
  {
    v126 = 4;
    v125 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_227;
    v126 = 5;
  }
  ((void (*)(void))(*v125)[v126])();
LABEL_227:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::max;
  v183 = &v181;
  *((_DWORD *)this + 193079) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v173, (uint64_t)&v184, (uint64_t)&v181)* 16.0);
  v127 = v183;
  if (v183 == &v181)
  {
    v128 = 4;
    v127 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_232;
    v128 = 5;
  }
  (*((void (**)(void))*v127 + v128))();
LABEL_232:
  v129 = v187;
  if (v187 == &v184)
  {
    v130 = 4;
    v129 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_237;
    v130 = 5;
  }
  ((void (*)(void))(*v129)[v130])();
LABEL_237:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::min;
  v183 = &v181;
  *((_DWORD *)this + 193080) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v173, (uint64_t)&v184, (uint64_t)&v181)* 16.0);
  v131 = v183;
  if (v183 == &v181)
  {
    v132 = 4;
    v131 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_242;
    v132 = 5;
  }
  (*((void (**)(void))*v131 + v132))();
LABEL_242:
  v133 = v187;
  if (v187 == &v184)
  {
    v134 = 4;
    v133 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_247;
    v134 = 5;
  }
  ((void (*)(void))(*v133)[v134])();
LABEL_247:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::max;
  v183 = &v181;
  *((_DWORD *)this + 193081) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v172, (uint64_t)&v184, (uint64_t)&v181)* v99);
  v135 = v183;
  if (v183 == &v181)
  {
    v136 = 4;
    v135 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_252;
    v136 = 5;
  }
  (*((void (**)(void))*v135 + v136))();
LABEL_252:
  v137 = v187;
  if (v187 == &v184)
  {
    v138 = 4;
    v137 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_257;
    v138 = 5;
  }
  ((void (*)(void))(*v137)[v138])();
LABEL_257:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::min;
  v183 = &v181;
  *((_DWORD *)this + 193082) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v172, (uint64_t)&v184, (uint64_t)&v181)* v99);
  v139 = v183;
  if (v183 == &v181)
  {
    v140 = 4;
    v139 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_262;
    v140 = 5;
  }
  (*((void (**)(void))*v139 + v140))();
LABEL_262:
  v141 = v187;
  if (v187 == &v184)
  {
    v142 = 4;
    v141 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_267;
    v142 = 5;
  }
  ((void (*)(void))(*v141)[v142])();
LABEL_267:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::max;
  v183 = &v181;
  *((_DWORD *)this + 193083) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v171, (uint64_t)&v184, (uint64_t)&v181)* v109);
  v143 = v183;
  if (v183 == &v181)
  {
    v144 = 4;
    v143 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_272;
    v144 = 5;
  }
  (*((void (**)(void))*v143 + v144))();
LABEL_272:
  v145 = v187;
  if (v187 == &v184)
  {
    v146 = 4;
    v145 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_277;
    v146 = 5;
  }
  ((void (*)(void))(*v145)[v146])();
LABEL_277:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::min;
  v183 = &v181;
  *((_DWORD *)this + 193084) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v171, (uint64_t)&v184, (uint64_t)&v181)* v109);
  v147 = v183;
  if (v183 == &v181)
  {
    v148 = 4;
    v147 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_282;
    v148 = 5;
  }
  (*((void (**)(void))*v147 + v148))();
LABEL_282:
  v149 = v187;
  if (v187 == &v184)
  {
    v150 = 4;
    v149 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_287;
    v150 = 5;
  }
  ((void (*)(void))(*v149)[v150])();
LABEL_287:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::max;
  v183 = &v181;
  *((_DWORD *)this + 193085) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v170, (uint64_t)&v184, (uint64_t)&v181)* v118);
  v151 = v183;
  if (v183 == &v181)
  {
    v152 = 4;
    v151 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_292;
    v152 = 5;
  }
  (*((void (**)(void))*v151 + v152))();
LABEL_292:
  v153 = v187;
  if (v187 == &v184)
  {
    v154 = 4;
    v153 = &v184;
  }
  else
  {
    if (!v187)
      goto LABEL_297;
    v154 = 5;
  }
  ((void (*)(void))(*v153)[v154])();
LABEL_297:
  v184 = (void **)&unk_25169D588;
  v185 = (void **)stats::mean;
  v187 = &v184;
  v181 = &unk_25169D588;
  v182 = stats::min;
  v183 = &v181;
  v155 = (Scandium **)((char *)this + 623320);
  *((_DWORD *)this + 193086) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v170, (uint64_t)&v184, (uint64_t)&v181)* v118);
  v156 = v183;
  if (v183 == &v181)
  {
    v157 = 4;
    v156 = &v181;
  }
  else
  {
    if (!v183)
      goto LABEL_302;
    v157 = 5;
  }
  (*((void (**)(void))*v156 + v157))();
LABEL_302:
  v158 = v187;
  if (v187 == &v184)
  {
    v159 = 4;
    v158 = &v184;
    goto LABEL_306;
  }
  if (v187)
  {
    v159 = 5;
LABEL_306:
    ((void (*)(void))(*v158)[v159])();
  }
  v160 = *((_QWORD *)this + 77916) - (_QWORD)*v155;
  if (v160)
  {
    v161 = Scandium::sort_median(*v155, (const float *)(v160 >> 2));
    Scandium::fill_valid((float *)this + 193050, v162, v161);
  }
  v163 = (Scandium *)*((_QWORD *)this + 77918);
  v164 = *((_QWORD *)this + 77919) - (_QWORD)v163;
  if (v164)
  {
    v165 = Scandium::sort_median(v163, (const float *)(v164 >> 2));
    Scandium::fill_valid((float *)this + 193051, v166, v165);
  }
  v184 = (void **)v170;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  v184 = (void **)v171;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  v184 = (void **)v172;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  v184 = (void **)v173;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  v184 = (void **)v174;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  v184 = (void **)v175;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  v184 = (void **)v176;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  v184 = (void **)v177;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  v184 = (void **)v178;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  v184 = (void **)v179;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
  v184 = (void **)v180;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v184);
}

void sub_245819A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,char a40)
{
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;

  v43 = *(_QWORD **)(v41 - 168);
  if (v43 == v40)
  {
    v44 = 4;
    v43 = (_QWORD *)(v41 - 192);
  }
  else
  {
    if (!v43)
      goto LABEL_6;
    v44 = 5;
  }
  (*(void (**)(void))(*v43 + 8 * v44))();
LABEL_6:
  v45 = *(_QWORD **)(v41 - 136);
  if (v45 == (_QWORD *)(v41 - 160))
  {
    v46 = 4;
    v45 = (_QWORD *)(v41 - 160);
  }
  else
  {
    if (!v45)
      goto LABEL_11;
    v46 = 5;
  }
  (*(void (**)(void))(*v45 + 8 * v46))();
LABEL_11:
  *(_QWORD *)(v41 - 160) = &a16;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 160));
  *(_QWORD *)(v41 - 160) = &a19;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 160));
  *(_QWORD *)(v41 - 160) = &a22;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 160));
  *(_QWORD *)(v41 - 160) = &a25;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 160));
  *(_QWORD *)(v41 - 160) = &a28;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 160));
  *(_QWORD *)(v41 - 160) = &a31;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 160));
  *(_QWORD *)(v41 - 160) = &a34;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 160));
  *(_QWORD *)(v41 - 160) = &a37;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 160));
  *(_QWORD *)(v41 - 160) = &a40;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 160));
  *(_QWORD *)(v41 - 160) = v41 - 240;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 160));
  *(_QWORD *)(v41 - 160) = v41 - 216;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 160));
  _Unwind_Resume(a1);
}

void sub_245819CEC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 - 160);
  if (v1)
  {
    *(_QWORD *)(v0 - 152) = v1;
    operator delete(v1);
  }
  JUMPOUT(0x245819C9CLL);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()(uint64_t *a1@<X0>, int a2@<W1>, char a3@<W2>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  char *v8;
  uint64_t v9;
  int v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  int v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *__p;
  char *v24;
  char *v25;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v5 = *a1;
  v22 = a1[1];
  if (*a1 == v22)
    return;
  do
  {
    v8 = 0;
    v9 = 0;
    __p = 0;
    v24 = 0;
    v25 = 0;
    do
    {
      v10 = Scandium::ScandiumPPG::path_idx_to_type[v9];
      if ((a3 & 1) != 0)
      {
        if (v10 == a2)
          goto LABEL_24;
      }
      else if (v10 != a2)
      {
        goto LABEL_24;
      }
      if (v8 >= v25)
      {
        v12 = (char *)__p;
        v13 = (v8 - (_BYTE *)__p) >> 2;
        v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 62)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v15 = v25 - (_BYTE *)__p;
        if ((v25 - (_BYTE *)__p) >> 1 > v14)
          v14 = v15 >> 1;
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL)
          v16 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v16 = v14;
        if (v16)
        {
          v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v25, v16);
          v12 = (char *)__p;
          v8 = v24;
        }
        else
        {
          v17 = 0;
        }
        v18 = &v17[4 * v13];
        *(_DWORD *)v18 = *(_DWORD *)(v5 + 4 * v9);
        v11 = v18 + 4;
        while (v8 != v12)
        {
          v19 = *((_DWORD *)v8 - 1);
          v8 -= 4;
          *((_DWORD *)v18 - 1) = v19;
          v18 -= 4;
        }
        __p = v18;
        v24 = v11;
        v25 = &v17[4 * v16];
        if (v12)
          operator delete(v12);
      }
      else
      {
        *(_DWORD *)v8 = *(_DWORD *)(v5 + 4 * v9);
        v11 = v8 + 4;
      }
      v24 = v11;
      v8 = v11;
LABEL_24:
      ++v9;
    }
    while (v9 != 16);
    v20 = a4[1];
    if (v20 >= a4[2])
    {
      v21 = std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>(a4, (uint64_t)&__p);
    }
    else
    {
      std::vector<std::vector<float>>::__construct_one_at_end[abi:ne180100]<std::vector<float> const&>((uint64_t)a4, (uint64_t)&__p);
      v21 = v20 + 24;
    }
    a4[1] = v21;
    if (__p)
    {
      v24 = (char *)__p;
      operator delete(__p);
    }
    v5 += 64;
  }
  while (v5 != v22);
}

void sub_245819EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
  {
    a11 = (uint64_t)__p;
    operator delete(__p);
  }
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

float Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  int v7;
  int v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  int v18;
  uint64_t v19;
  char *v20;
  float v21;
  float v22;
  char *__p;
  char *v25;
  char *v26;
  void *v27;
  _BYTE *v28;
  uint64_t v29;

  __p = 0;
  v25 = 0;
  v26 = 0;
  v4 = *a1;
  v5 = a1[1];
  if (*a1 == v5)
  {
    v20 = 0;
    v19 = 0;
  }
  else
  {
    do
    {
      v27 = 0;
      v28 = 0;
      v29 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v27, *(const void **)v4, *(_QWORD *)(v4 + 8), (uint64_t)(*(_QWORD *)(v4 + 8) - *(_QWORD *)v4) >> 2);
      std::function<float ()(float const*,int)>::operator()(a2, (uint64_t)v27, (unint64_t)(v28 - (_BYTE *)v27) >> 2);
      v8 = v7;
      v9 = v25;
      if (v25 >= v26)
      {
        v11 = __p;
        v12 = (v25 - __p) >> 2;
        v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 62)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v14 = v26 - __p;
        if ((v26 - __p) >> 1 > v13)
          v13 = v14 >> 1;
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL)
          v15 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v15 = v13;
        if (v15)
        {
          v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v26, v15);
          v11 = __p;
          v9 = v25;
        }
        else
        {
          v16 = 0;
        }
        v17 = &v16[4 * v12];
        *(_DWORD *)v17 = v8;
        v10 = v17 + 4;
        while (v9 != v11)
        {
          v18 = *((_DWORD *)v9 - 1);
          v9 -= 4;
          *((_DWORD *)v17 - 1) = v18;
          v17 -= 4;
        }
        __p = v17;
        v26 = &v16[4 * v15];
        if (v11)
          operator delete(v11);
      }
      else
      {
        *(_DWORD *)v25 = v7;
        v10 = v25 + 4;
      }
      v25 = v10;
      if (v27)
      {
        v28 = v27;
        operator delete(v27);
      }
      v4 += 24;
    }
    while (v4 != v5);
    v19 = (uint64_t)__p;
    v20 = v10;
  }
  std::function<float ()(float const*,int)>::operator()(a3, v19, (unint64_t)&v20[-v19] >> 2);
  v22 = v21;
  if (__p)
    operator delete(__p);
  return v22;
}

void sub_24581A084(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

float Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>(uint64_t *a1, __int16 a2, float a3)
{
  float *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float *v10;
  float *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  float *v17;
  float v18;
  uint64_t v19;
  float *v20;
  unint64_t v21;
  float v22;
  float *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  float *v29;
  float v30;
  float v31;
  Scandium *__p;
  float *v34;
  char *v35;

  __p = 0;
  v34 = 0;
  v35 = 0;
  if ((a2 & 0xFF00) != 0)
  {
    v4 = 0;
    v5 = 0;
    v6 = a2;
    do
    {
      v7 = 0;
      v8 = 4 * v5;
      do
      {
        if (Scandium::ScandiumPPG::path_array[4 * v5 + v7] == v6)
        {
          if (a1[1] - *a1 <= (unint64_t)(v7 + v8))
            std::vector<float>::__throw_out_of_range[abi:ne180100]();
          LOBYTE(a3) = *(_BYTE *)(*a1 + v7 + v8);
          v9 = (float)LODWORD(a3);
          if (v4 >= (float *)v35)
          {
            v11 = (float *)__p;
            v12 = ((char *)v4 - (char *)__p) >> 2;
            v13 = v12 + 1;
            if ((unint64_t)(v12 + 1) >> 62)
              std::vector<float>::__throw_length_error[abi:ne180100]();
            v14 = v35 - (char *)__p;
            if ((v35 - (char *)__p) >> 1 > v13)
              v13 = v14 >> 1;
            if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL)
              v15 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v15 = v13;
            if (v15)
            {
              v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v35, v15);
              v11 = (float *)__p;
              v4 = v34;
            }
            else
            {
              v16 = 0;
            }
            v17 = (float *)&v16[4 * v12];
            *v17 = v9;
            v10 = v17 + 1;
            while (v4 != v11)
            {
              v18 = *--v4;
              a3 = v18;
              *--v17 = v18;
            }
            __p = (Scandium *)v17;
            v35 = &v16[4 * v15];
            if (v11)
              operator delete(v11);
          }
          else
          {
            *v4 = v9;
            v10 = v4 + 1;
          }
          v34 = v10;
          v4 = v10;
        }
        ++v7;
      }
      while (v7 != 4);
      ++v5;
    }
    while (v5 != 4);
  }
  else
  {
    v19 = *a1;
    if (a1[1] == *a1)
    {
      v4 = 0;
    }
    else
    {
      v20 = 0;
      v21 = 0;
      do
      {
        LOBYTE(a3) = *(_BYTE *)(v19 + v21);
        v22 = (float)LODWORD(a3);
        if (v20 >= (float *)v35)
        {
          v23 = (float *)__p;
          v24 = ((char *)v20 - (char *)__p) >> 2;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v26 = v35 - (char *)__p;
          if ((v35 - (char *)__p) >> 1 > v25)
            v25 = v26 >> 1;
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
            v27 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v27 = v25;
          if (v27)
          {
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v35, v27);
            v23 = (float *)__p;
            v20 = v34;
          }
          else
          {
            v28 = 0;
          }
          v29 = (float *)&v28[4 * v24];
          *v29 = v22;
          v4 = v29 + 1;
          while (v20 != v23)
          {
            v30 = *--v20;
            a3 = v30;
            *--v29 = v30;
          }
          __p = (Scandium *)v29;
          v35 = &v28[4 * v27];
          if (v23)
            operator delete(v23);
        }
        else
        {
          *v20 = v22;
          v4 = v20 + 1;
        }
        v34 = v4;
        ++v21;
        v19 = *a1;
        v20 = v4;
      }
      while (a1[1] - *a1 > v21);
    }
  }
  v31 = Scandium::sort_median(__p, (const float *)((unint64_t)((char *)v4 - (char *)__p) >> 2));
  if (__p)
    operator delete(__p);
  return v31;
}

void sub_24581A364(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

float Scandium::ScandiumPPG::get_median_of_path_type<float>(uint64_t *a1, __int16 a2)
{
  char *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char *v9;
  Scandium *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  Scandium *v16;
  int v17;
  uint64_t v18;
  Scandium *v19;
  unint64_t v20;
  int v21;
  Scandium *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  int v29;
  float v30;
  Scandium *__p;
  char *v33;
  char *v34;

  __p = 0;
  v33 = 0;
  v34 = 0;
  if ((a2 & 0xFF00) != 0)
  {
    v3 = 0;
    v4 = 0;
    v5 = a2;
    do
    {
      v6 = 0;
      v7 = 4 * v4;
      do
      {
        if (Scandium::ScandiumPPG::path_array[4 * v4 + v6] == v5)
        {
          if (v6 + v7 >= (unint64_t)((a1[1] - *a1) >> 2))
            std::vector<float>::__throw_out_of_range[abi:ne180100]();
          v8 = *(_DWORD *)(*a1 + 4 * (v6 + v7));
          if (v3 >= v34)
          {
            v10 = __p;
            v11 = (v3 - (char *)__p) >> 2;
            v12 = v11 + 1;
            if ((unint64_t)(v11 + 1) >> 62)
              std::vector<float>::__throw_length_error[abi:ne180100]();
            v13 = v34 - (char *)__p;
            if ((v34 - (char *)__p) >> 1 > v12)
              v12 = v13 >> 1;
            if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
              v14 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v14 = v12;
            if (v14)
            {
              v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v34, v14);
              v10 = __p;
              v3 = v33;
            }
            else
            {
              v15 = 0;
            }
            v16 = (Scandium *)&v15[4 * v11];
            *(_DWORD *)v16 = v8;
            v9 = (char *)v16 + 4;
            while (v3 != (char *)v10)
            {
              v17 = *((_DWORD *)v3 - 1);
              v3 -= 4;
              *((_DWORD *)v16 - 1) = v17;
              v16 = (Scandium *)((char *)v16 - 4);
            }
            __p = v16;
            v34 = &v15[4 * v14];
            if (v10)
              operator delete(v10);
          }
          else
          {
            *(_DWORD *)v3 = v8;
            v9 = v3 + 4;
          }
          v33 = v9;
          v3 = v9;
        }
        ++v6;
      }
      while (v6 != 4);
      ++v4;
    }
    while (v4 != 4);
  }
  else
  {
    v18 = *a1;
    if (a1[1] == *a1)
    {
      v3 = 0;
    }
    else
    {
      v19 = 0;
      v20 = 0;
      do
      {
        v21 = *(_DWORD *)(v18 + 4 * v20);
        if (v19 >= (Scandium *)v34)
        {
          v22 = __p;
          v23 = (v19 - __p) >> 2;
          v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v25 = v34 - (char *)__p;
          if ((v34 - (char *)__p) >> 1 > v24)
            v24 = v25 >> 1;
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL)
            v26 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v26 = v24;
          if (v26)
          {
            v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v34, v26);
            v22 = __p;
            v19 = (Scandium *)v33;
          }
          else
          {
            v27 = 0;
          }
          v28 = &v27[4 * v23];
          *(_DWORD *)v28 = v21;
          v3 = v28 + 4;
          while (v19 != v22)
          {
            v29 = *((_DWORD *)v19 - 1);
            v19 = (Scandium *)((char *)v19 - 4);
            *((_DWORD *)v28 - 1) = v29;
            v28 -= 4;
          }
          __p = (Scandium *)v28;
          v34 = &v27[4 * v26];
          if (v22)
            operator delete(v22);
        }
        else
        {
          *(_DWORD *)v19 = v21;
          v3 = (char *)v19 + 4;
        }
        v33 = v3;
        ++v20;
        v18 = *a1;
        v19 = (Scandium *)v3;
      }
      while (v20 < (a1[1] - *a1) >> 2);
    }
  }
  v30 = Scandium::sort_median(__p, (const float *)((unint64_t)(v3 - (char *)__p) >> 2));
  if (__p)
    operator delete(__p);
  return v30;
}

void sub_24581A62C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::log_core_analytics(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  _QWORD *v1;
  Scandium::ScandiumPPG::scandium_spo2_processor_t *v2;
  unint64_t i;
  _BYTE v4[40];
  void *__p[2];
  char v6;
  _QWORD v7[4];
  int v8;
  int v9;
  _QWORD v10[4];
  int v11;
  int v12;
  _QWORD v13[4];
  int v14;
  int v15;
  _QWORD v16[4];
  int v17;
  int v18;
  _QWORD v19[4];
  int v20;
  int v21;
  _QWORD v22[4];
  int v23;
  int v24;
  _QWORD v25[4];
  int v26;
  int v27;
  _QWORD v28[4];
  int v29;
  int v30;
  _QWORD v31[4];
  int v32;
  int v33;
  _QWORD v34[4];
  int v35;
  int v36;
  _QWORD v37[4];
  int v38;
  int v39;
  _QWORD v40[4];
  int v41;
  int v42;
  _QWORD v43[4];
  int v44;
  int v45;
  _QWORD v46[4];
  int v47;
  int v48;
  _QWORD v49[4];
  int v50;
  int v51;
  _QWORD v52[4];
  int v53;
  int v54;
  _QWORD v55[4];
  int v56;
  int v57;
  _QWORD v58[4];
  int v59;
  int v60;
  _QWORD v61[4];
  int v62;
  int v63;
  _QWORD v64[4];
  int v65;
  int v66;
  _QWORD v67[4];
  int v68;
  int v69;
  _QWORD v70[4];
  int v71;
  int v72;
  _QWORD v73[4];
  int v74;
  int v75;
  _QWORD v76[4];
  int v77;
  int v78;
  _QWORD v79[4];
  int v80;
  int v81;
  _QWORD v82[4];
  int v83;
  int v84;
  _QWORD v85[4];
  int v86;
  int v87;
  _QWORD v88[4];
  int v89;
  int v90;
  _QWORD v91[4];
  int v92;
  int v93;
  _QWORD v94[4];
  int v95;
  int v96;
  _QWORD v97[4];
  int v98;
  int v99;
  _QWORD v100[4];
  int v101;
  int v102;
  _QWORD v103[4];
  int v104;
  int v105;
  _QWORD v106[4];
  int v107;
  int v108;
  _QWORD v109[4];
  int v110;
  int v111;
  _QWORD v112[4];
  int v113;
  int v114;
  _QWORD v115[4];
  int v116;
  int v117;
  _QWORD v118[4];
  int v119;
  int v120;
  _QWORD v121[4];
  int v122;
  int v123;
  _QWORD v124[4];
  int v125;
  int v126;
  _QWORD v127[4];
  int v128;
  int v129;
  _QWORD v130[4];
  int v131;
  int v132;
  _QWORD v133[4];
  int v134;
  int v135;
  _QWORD v136[4];
  int v137;
  int v138;
  _QWORD v139[4];
  int v140;
  int v141;
  _QWORD v142[4];
  int v143;
  int v144;
  _QWORD v145[4];
  int v146;
  int v147;
  _QWORD v148[4];
  int v149;
  int v150;
  _QWORD v151[4];
  int v152;
  int v153;
  _QWORD v154[4];
  int v155;
  int v156;
  _QWORD v157[4];
  int v158;
  int v159;
  _QWORD v160[4];
  int v161;
  int v162;
  _QWORD v163[4];
  int v164;
  int v165;
  _QWORD v166[4];
  int v167;
  int v168;
  _QWORD v169[4];
  int v170;
  int v171;
  _QWORD v172[4];
  int v173;
  int v174;
  _QWORD v175[4];
  int v176;
  int v177;
  _QWORD v178[4];
  int v179;
  int v180;
  _QWORD v181[4];
  int v182;
  int v183;
  _QWORD v184[4];
  int v185;
  int v186;
  _QWORD v187[4];
  int v188;
  int v189;
  _QWORD v190[4];
  int v191;
  int v192;
  _QWORD v193[4];
  int v194;
  int v195;
  _QWORD v196[4];
  int v197;
  int v198;
  _QWORD v199[4];
  int v200;
  int v201;
  _QWORD v202[4];
  int v203;
  int v204;
  _QWORD v205[4];
  int v206;
  int v207;
  _QWORD v208[4];
  int v209;
  int v210;
  _QWORD v211[4];
  int v212;
  int v213;
  _QWORD v214[4];
  int v215;
  int v216;
  _QWORD v217[4];
  int v218;
  int v219;
  _QWORD v220[4];
  int v221;
  int v222;
  _QWORD v223[4];
  int v224;
  int v225;
  _QWORD v226[4];
  int v227;
  int v228;
  _QWORD v229[4];
  int v230;
  int v231;
  _QWORD v232[4];
  int v233;
  int v234;
  _QWORD v235[4];
  int v236;
  int v237;
  _QWORD v238[4];
  int v239;
  int v240;
  _QWORD v241[4];
  int v242;
  int v243;
  _QWORD v244[4];
  int v245;
  int v246;
  _QWORD v247[4];
  int v248;
  int v249;
  _QWORD v250[4];
  int v251;
  int v252;
  _QWORD v253[4];
  int v254;
  int v255;
  _QWORD v256[4];
  int v257;
  int v258;
  _QWORD v259[4];
  int v260;
  int v261;
  _QWORD v262[4];
  int v263;
  int v264;
  _QWORD v265[4];
  int v266;
  int v267;
  _QWORD v268[4];
  int v269;
  int v270;
  _QWORD v271[4];
  int v272;
  int v273;
  _QWORD v274[4];
  int v275;
  int v276;
  _QWORD v277[4];
  int v278;
  int v279;
  _QWORD v280[4];
  int v281;
  int v282;
  _QWORD v283[4];
  int v284;
  int v285;
  _QWORD v286[4];
  int v287;
  int v288;
  _QWORD v289[4];
  int v290;
  int v291;
  _QWORD v292[4];
  int v293;
  int v294;
  _QWORD v295[4];
  int v296;
  int v297;
  _QWORD v298[4];
  int v299;
  int v300;
  _QWORD v301[4];
  int v302;
  int v303;
  _QWORD v304[4];
  int v305;
  int v306;
  _QWORD v307[4];
  int v308;
  int v309;
  _QWORD v310[4];
  int v311;
  int v312;
  _QWORD v313[4];
  int v314;
  int v315;
  _QWORD v316[4];
  int v317;
  int v318;
  _QWORD v319[4];
  int v320;
  int v321;
  _QWORD v322[4];
  int v323;
  int v324;
  _QWORD v325[4];
  int v326;
  int v327;
  _QWORD v328[4];
  int v329;
  int v330;
  _QWORD v331[4];
  int v332;
  int v333;
  _QWORD v334[4];
  int v335;
  int v336;
  _QWORD v337[4];
  int v338;
  int v339;
  _QWORD v340[4];
  int v341;
  int v342;
  _QWORD v343[4];
  int v344;
  int v345;
  _QWORD v346[4];
  int v347;
  int v348;
  _QWORD v349[4];
  int v350;
  int v351;
  _QWORD v352[4];
  int v353;
  int v354;
  _QWORD v355[4];
  int v356;
  int v357;
  _QWORD v358[4];
  _DWORD v359[10];
  uint64_t v360;

  v360 = *MEMORY[0x24BDAC8D0];
  v1 = (_QWORD *)((char *)this + 772768);
  if (*((_QWORD *)this + 96596))
  {
    v2 = this;
    std::string::basic_string[abi:ne180100]<0>(__p, "coreanalytics");
    std::string::basic_string[abi:ne180100]<0>(v7, "rawSpO2");
    v8 = *((_DWORD *)v2 + 193018);
    v9 = 3;
    std::string::basic_string[abi:ne180100]<0>(v10, "rawSpO2_BGWin0");
    v11 = *((_DWORD *)v2 + 193019);
    v12 = 3;
    std::string::basic_string[abi:ne180100]<0>(v13, "rawSpO2_BGWin1");
    v14 = *((_DWORD *)v2 + 193020);
    v15 = 3;
    std::string::basic_string[abi:ne180100]<0>(v16, "rawSpO2_BGWin2");
    v17 = *((_DWORD *)v2 + 193021);
    v18 = 3;
    std::string::basic_string[abi:ne180100]<0>(v19, "rawSpO2NoConfGate");
    v20 = *((_DWORD *)v2 + 193022);
    v21 = 3;
    std::string::basic_string[abi:ne180100]<0>(v22, "rawSpO2NoConfGate_BGWin0");
    v23 = *((_DWORD *)v2 + 193023);
    v24 = 3;
    std::string::basic_string[abi:ne180100]<0>(v25, "rawSpO2NoConfGate_BGWin1");
    v26 = *((_DWORD *)v2 + 193024);
    v27 = 3;
    std::string::basic_string[abi:ne180100]<0>(v28, "rawSpO2NoConfGate_BGWin2");
    v29 = *((_DWORD *)v2 + 193025);
    v30 = 3;
    std::string::basic_string[abi:ne180100]<0>(v31, "numChannelsPassingGIRPIRMax");
    v32 = *((_DWORD *)v2 + 193026);
    v33 = 1;
    std::string::basic_string[abi:ne180100]<0>(v34, "numChannelsPassingGIRPIRMin");
    v35 = *((_DWORD *)v2 + 193027);
    v36 = 1;
    std::string::basic_string[abi:ne180100]<0>(v37, "numValidChannelsMax");
    v38 = *((_DWORD *)v2 + 193028);
    v39 = 1;
    std::string::basic_string[abi:ne180100]<0>(v40, "numValidChannelsMin");
    v41 = *((_DWORD *)v2 + 193029);
    v42 = 1;
    std::string::basic_string[abi:ne180100]<0>(v43, "agc_opc_duration_ms");
    v44 = *((unsigned __int16 *)v2 + 386060);
    v45 = 1;
    std::string::basic_string[abi:ne180100]<0>(v46, "agc_opc_green_fs_enum");
    v47 = *((unsigned __int8 *)v2 + 772122);
    v48 = 1;
    std::string::basic_string[abi:ne180100]<0>(v49, "agc_opc_num_retries");
    v50 = *((unsigned __int8 *)v2 + 772123);
    v51 = 1;
    std::string::basic_string[abi:ne180100]<0>(v52, "agc_opc_num_converged");
    v53 = *((unsigned __int8 *)v2 + 772124);
    v54 = 1;
    std::string::basic_string[abi:ne180100]<0>(v55, "numSuccessfulWindows");
    v56 = *((_DWORD *)v2 + 193032);
    v57 = 1;
    std::string::basic_string[abi:ne180100]<0>(v58, "sessionLen");
    v59 = *((_DWORD *)v2 + 193033);
    v60 = 1;
    std::string::basic_string[abi:ne180100]<0>(v61, "bailoutIndex");
    v62 = *((_DWORD *)v2 + 193034);
    v63 = 1;
    std::string::basic_string[abi:ne180100]<0>(v64, "numFailedWinAggGIRPIR");
    v65 = *((_DWORD *)v2 + 193035);
    v66 = 1;
    std::string::basic_string[abi:ne180100]<0>(v67, "numFailedWinStd");
    v68 = *((_DWORD *)v2 + 193036);
    v69 = 1;
    std::string::basic_string[abi:ne180100]<0>(v70, "min_mav");
    v71 = *((_DWORD *)v2 + 193037);
    v72 = 3;
    std::string::basic_string[abi:ne180100]<0>(v73, "max_mav");
    v74 = *((_DWORD *)v2 + 193038);
    v75 = 3;
    std::string::basic_string[abi:ne180100]<0>(v76, "median_mav");
    v77 = *((_DWORD *)v2 + 193039);
    v78 = 3;
    std::string::basic_string[abi:ne180100]<0>(v79, "ir_wavelength");
    v80 = *((_DWORD *)v2 + 193040);
    v81 = 3;
    std::string::basic_string[abi:ne180100]<0>(v82, "red_wavelength");
    v83 = *((_DWORD *)v2 + 193041);
    v84 = 3;
    std::string::basic_string[abi:ne180100]<0>(v85, "mean_accelX");
    v86 = *((_DWORD *)v2 + 193042);
    v87 = 3;
    std::string::basic_string[abi:ne180100]<0>(v88, "mean_accelY");
    v89 = *((_DWORD *)v2 + 193043);
    v90 = 3;
    std::string::basic_string[abi:ne180100]<0>(v91, "mean_accelZ");
    v92 = *((_DWORD *)v2 + 193044);
    v93 = 3;
    std::string::basic_string[abi:ne180100]<0>(v94, "mean_pi_ir_long");
    v95 = *((_DWORD *)v2 + 193045);
    v96 = 3;
    std::string::basic_string[abi:ne180100]<0>(v97, "mean_pi_ir_short");
    v98 = *((_DWORD *)v2 + 193046);
    v99 = 3;
    std::string::basic_string[abi:ne180100]<0>(v100, "mean_pi_red_long");
    v101 = *((_DWORD *)v2 + 193047);
    v102 = 3;
    std::string::basic_string[abi:ne180100]<0>(v103, "mean_pi_red_short");
    v104 = *((_DWORD *)v2 + 193048);
    v105 = 3;
    std::string::basic_string[abi:ne180100]<0>(v106, "mean_pi_green");
    v107 = *((_DWORD *)v2 + 193049);
    v108 = 3;
    std::string::basic_string[abi:ne180100]<0>(v109, "medianGIRPIRShort");
    v110 = *((_DWORD *)v2 + 193070);
    v111 = 3;
    std::string::basic_string[abi:ne180100]<0>(v112, "medianMeasurementConfidence");
    v113 = *((_DWORD *)v2 + 193050);
    v114 = 3;
    std::string::basic_string[abi:ne180100]<0>(v115, "medianWeightedStdDev");
    v116 = *((_DWORD *)v2 + 193051);
    v117 = 3;
    std::string::basic_string[abi:ne180100]<0>(v118, "dropped_sessWin_CPMSAll_total_len");
    v119 = *((unsigned __int16 *)v2 + 386104);
    v120 = 1;
    std::string::basic_string[abi:ne180100]<0>(v121, "dropped_sessWin_CPMSAll_max_seg_len");
    v122 = *((unsigned __int16 *)v2 + 386105);
    v123 = 1;
    std::string::basic_string[abi:ne180100]<0>(v124, "dropped_sessWin_Saturation_total_len");
    v125 = *((unsigned __int16 *)v2 + 386106);
    v126 = 1;
    std::string::basic_string[abi:ne180100]<0>(v127, "dropped_sessWin_Saturation_max_seg_len");
    v128 = *((unsigned __int16 *)v2 + 386107);
    v129 = 1;
    std::string::basic_string[abi:ne180100]<0>(v130, "dropped_BGWin0_CPMSAll_total_len");
    v131 = *((unsigned __int16 *)v2 + 386108);
    v132 = 1;
    std::string::basic_string[abi:ne180100]<0>(v133, "dropped_BGWin0_Saturation_total_len");
    v134 = *((unsigned __int16 *)v2 + 386109);
    v135 = 1;
    std::string::basic_string[abi:ne180100]<0>(v136, "dropped_BGWin1_CPMSAll_total_len");
    v137 = *((unsigned __int16 *)v2 + 386110);
    v138 = 1;
    std::string::basic_string[abi:ne180100]<0>(v139, "dropped_BGWin1_Saturation_total_len");
    v140 = *((unsigned __int16 *)v2 + 386111);
    v141 = 1;
    std::string::basic_string[abi:ne180100]<0>(v142, "dropped_BGWin2_CPMSAll_total_len");
    v143 = *((unsigned __int16 *)v2 + 386112);
    v144 = 1;
    std::string::basic_string[abi:ne180100]<0>(v145, "dropped_BGWin2_Saturation_total_len");
    v146 = *((unsigned __int16 *)v2 + 386113);
    v147 = 1;
    std::string::basic_string[abi:ne180100]<0>(v148, "dropped_sessWin_TX_DOWNAll_total_len");
    v149 = *((unsigned __int16 *)v2 + 386114);
    v150 = 1;
    std::string::basic_string[abi:ne180100]<0>(v151, "minChannelConfidenceShortIR");
    v152 = *((_DWORD *)v2 + 193058);
    v153 = 3;
    std::string::basic_string[abi:ne180100]<0>(v154, "minChannelConfidenceShortRed");
    v155 = *((_DWORD *)v2 + 193059);
    v156 = 3;
    std::string::basic_string[abi:ne180100]<0>(v157, "minChannelConfidenceLong");
    v158 = *((_DWORD *)v2 + 193060);
    v159 = 3;
    std::string::basic_string[abi:ne180100]<0>(v160, "medianChannelConfidenceShortIR");
    v161 = *((_DWORD *)v2 + 193061);
    v162 = 3;
    std::string::basic_string[abi:ne180100]<0>(v163, "medianChannelConfidenceShortRed");
    v164 = *((_DWORD *)v2 + 193062);
    v165 = 3;
    std::string::basic_string[abi:ne180100]<0>(v166, "medianChannelConfidenceLong");
    v167 = *((_DWORD *)v2 + 193063);
    v168 = 3;
    std::string::basic_string[abi:ne180100]<0>(v169, "maxChannelConfidenceShortIR");
    v170 = *((_DWORD *)v2 + 193064);
    v171 = 3;
    std::string::basic_string[abi:ne180100]<0>(v172, "maxChannelConfidenceShortRed");
    v173 = *((_DWORD *)v2 + 193065);
    v174 = 3;
    std::string::basic_string[abi:ne180100]<0>(v175, "maxChannelConfidenceLong");
    v176 = *((_DWORD *)v2 + 193066);
    v177 = 3;
    std::string::basic_string[abi:ne180100]<0>(v178, "meanSpO2ShortIR");
    v179 = *((_DWORD *)v2 + 193067);
    v180 = 3;
    std::string::basic_string[abi:ne180100]<0>(v181, "meanSpO2ShortRed");
    v182 = *((_DWORD *)v2 + 193068);
    v183 = 3;
    std::string::basic_string[abi:ne180100]<0>(v184, "meanSpO2Long");
    v185 = *((_DWORD *)v2 + 193069);
    v186 = 3;
    std::string::basic_string[abi:ne180100]<0>(v187, "numHighConfidenceChannelsMax");
    v188 = *((_DWORD *)v2 + 193071);
    v189 = 1;
    std::string::basic_string[abi:ne180100]<0>(v190, "numHighConfidenceChannelsMin");
    v191 = *((_DWORD *)v2 + 193072);
    v192 = 1;
    std::string::basic_string[abi:ne180100]<0>(v193, "numHighConfidenceChannelsMaxShortIR");
    v194 = *((_DWORD *)v2 + 193073);
    v195 = 1;
    std::string::basic_string[abi:ne180100]<0>(v196, "numHighConfidenceChannelsMinShortIR");
    v197 = *((_DWORD *)v2 + 193074);
    v198 = 1;
    std::string::basic_string[abi:ne180100]<0>(v199, "numHighConfidenceChannelsMaxShortRed");
    v200 = *((_DWORD *)v2 + 193075);
    v201 = 1;
    std::string::basic_string[abi:ne180100]<0>(v202, "numHighConfidenceChannelsMinShortRed");
    v203 = *((_DWORD *)v2 + 193076);
    v204 = 1;
    std::string::basic_string[abi:ne180100]<0>(v205, "numHighConfidenceChannelsMaxLong");
    v206 = *((_DWORD *)v2 + 193077);
    v207 = 1;
    std::string::basic_string[abi:ne180100]<0>(v208, "numHighConfidenceChannelsMinLong");
    v209 = *((_DWORD *)v2 + 193078);
    v210 = 1;
    std::string::basic_string[abi:ne180100]<0>(v211, "numChannelsPassingSNRMax");
    v212 = *((_DWORD *)v2 + 193079);
    v213 = 1;
    std::string::basic_string[abi:ne180100]<0>(v214, "numChannelsPassingSNRMin");
    v215 = *((_DWORD *)v2 + 193080);
    v216 = 1;
    std::string::basic_string[abi:ne180100]<0>(v217, "numChannelsPassingSNRMaxShortIR");
    v218 = *((_DWORD *)v2 + 193081);
    v219 = 1;
    std::string::basic_string[abi:ne180100]<0>(v220, "numChannelsPassingSNRMinShortIR");
    v221 = *((_DWORD *)v2 + 193082);
    v222 = 1;
    std::string::basic_string[abi:ne180100]<0>(v223, "numChannelsPassingSNRMaxShortRed");
    v224 = *((_DWORD *)v2 + 193083);
    v225 = 1;
    std::string::basic_string[abi:ne180100]<0>(v226, "numChannelsPassingSNRMinShortRed");
    v227 = *((_DWORD *)v2 + 193084);
    v228 = 1;
    std::string::basic_string[abi:ne180100]<0>(v229, "numChannelsPassingSNRMaxLong");
    v230 = *((_DWORD *)v2 + 193085);
    v231 = 1;
    std::string::basic_string[abi:ne180100]<0>(v232, "numChannelsPassingSNRMinLong");
    v233 = *((_DWORD *)v2 + 193086);
    v234 = 1;
    std::string::basic_string[abi:ne180100]<0>(v235, "ppg_ac_pp_ir_long");
    v2 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)v2 + 772348);
    v236 = *(_DWORD *)v2;
    v237 = 3;
    std::string::basic_string[abi:ne180100]<0>(v238, "ppg_ac_pp_ir_short_ir");
    v239 = *((_DWORD *)v2 + 1);
    v240 = 3;
    std::string::basic_string[abi:ne180100]<0>(v241, "ppg_ac_pp_ir_short_red");
    v242 = *((_DWORD *)v2 + 2);
    v243 = 3;
    std::string::basic_string[abi:ne180100]<0>(v244, "ppg_ac_std_ir_long");
    v245 = *((_DWORD *)v2 + 8);
    v246 = 3;
    std::string::basic_string[abi:ne180100]<0>(v247, "ppg_ac_std_ir_short_ir");
    v248 = *((_DWORD *)v2 + 9);
    v249 = 3;
    std::string::basic_string[abi:ne180100]<0>(v250, "ppg_ac_std_ir_short_red");
    v251 = *((_DWORD *)v2 + 10);
    v252 = 3;
    std::string::basic_string[abi:ne180100]<0>(v253, "ppg_mean_ir_long");
    v254 = *((_DWORD *)v2 + 16);
    v255 = 3;
    std::string::basic_string[abi:ne180100]<0>(v256, "ppg_mean_ir_short_ir");
    v257 = *((_DWORD *)v2 + 17);
    v258 = 3;
    std::string::basic_string[abi:ne180100]<0>(v259, "ppg_mean_ir_short_red");
    v260 = *((_DWORD *)v2 + 18);
    v261 = 3;
    std::string::basic_string[abi:ne180100]<0>(v262, "ppg_ac_pp_red_long");
    v263 = *((_DWORD *)v2 + 3);
    v264 = 3;
    std::string::basic_string[abi:ne180100]<0>(v265, "ppg_ac_pp_red_short_ir");
    v266 = *((_DWORD *)v2 + 4);
    v267 = 3;
    std::string::basic_string[abi:ne180100]<0>(v268, "ppg_ac_pp_red_short_red");
    v269 = *((_DWORD *)v2 + 5);
    v270 = 3;
    std::string::basic_string[abi:ne180100]<0>(v271, "ppg_ac_std_red_long");
    v272 = *((_DWORD *)v2 + 11);
    v273 = 3;
    std::string::basic_string[abi:ne180100]<0>(v274, "ppg_ac_std_red_short_ir");
    v275 = *((_DWORD *)v2 + 12);
    v276 = 3;
    std::string::basic_string[abi:ne180100]<0>(v277, "ppg_ac_std_red_short_red");
    v278 = *((_DWORD *)v2 + 13);
    v279 = 3;
    std::string::basic_string[abi:ne180100]<0>(v280, "ppg_mean_red_long");
    v281 = *((_DWORD *)v2 + 19);
    v282 = 3;
    std::string::basic_string[abi:ne180100]<0>(v283, "ppg_mean_red_short_ir");
    v284 = *((_DWORD *)v2 + 20);
    v285 = 3;
    std::string::basic_string[abi:ne180100]<0>(v286, "ppg_mean_red_short_red");
    v287 = *((_DWORD *)v2 + 21);
    v288 = 3;
    std::string::basic_string[abi:ne180100]<0>(v289, "ppg_ac_pp_green");
    v290 = *((_DWORD *)v2 + 6);
    v291 = 3;
    std::string::basic_string[abi:ne180100]<0>(v292, "ppg_ac_std_green");
    v293 = *((_DWORD *)v2 + 14);
    v294 = 3;
    std::string::basic_string[abi:ne180100]<0>(v295, "ppg_mean_green");
    v296 = *((_DWORD *)v2 + 22);
    v297 = 3;
    std::string::basic_string[abi:ne180100]<0>(v298, "ppg_ac_pp_blank");
    v299 = *((_DWORD *)v2 + 7);
    v300 = 3;
    std::string::basic_string[abi:ne180100]<0>(v301, "ppg_ac_std_blank");
    v302 = *((_DWORD *)v2 + 15);
    v303 = 3;
    std::string::basic_string[abi:ne180100]<0>(v304, "ppg_mean_blank");
    v305 = *((_DWORD *)v2 + 23);
    v306 = 3;
    std::string::basic_string[abi:ne180100]<0>(v307, "tia_gain_ir_long");
    v308 = *((_DWORD *)v2 + 24);
    v309 = 3;
    std::string::basic_string[abi:ne180100]<0>(v310, "tia_gain_ir_short_ir");
    v311 = *((_DWORD *)v2 + 25);
    v312 = 3;
    std::string::basic_string[abi:ne180100]<0>(v313, "tia_gain_ir_short_red");
    v314 = *((_DWORD *)v2 + 26);
    v315 = 3;
    std::string::basic_string[abi:ne180100]<0>(v316, "tia_gain_red_long");
    v317 = *((_DWORD *)v2 + 27);
    v318 = 3;
    std::string::basic_string[abi:ne180100]<0>(v319, "tia_gain_red_short_ir");
    v320 = *((_DWORD *)v2 + 28);
    v321 = 3;
    std::string::basic_string[abi:ne180100]<0>(v322, "tia_gain_red_short_red");
    v323 = *((_DWORD *)v2 + 29);
    v324 = 3;
    std::string::basic_string[abi:ne180100]<0>(v325, "tia_gain_green");
    v326 = *((_DWORD *)v2 + 30);
    v327 = 3;
    std::string::basic_string[abi:ne180100]<0>(v328, "tia_gain_blank");
    v329 = *((_DWORD *)v2 + 31);
    v330 = 3;
    std::string::basic_string[abi:ne180100]<0>(v331, "iled_ir");
    v332 = *((_DWORD *)v2 + 32);
    v333 = 3;
    std::string::basic_string[abi:ne180100]<0>(v334, "iled_red");
    v335 = *((_DWORD *)v2 + 33);
    v336 = 3;
    std::string::basic_string[abi:ne180100]<0>(v337, "iled_green");
    v338 = *((_DWORD *)v2 + 34);
    v339 = 3;
    std::string::basic_string[abi:ne180100]<0>(v340, "min_mav_1s");
    v341 = *((_DWORD *)v2 + 35);
    v342 = 3;
    std::string::basic_string[abi:ne180100]<0>(v343, "max_mav_1s");
    v344 = *((_DWORD *)v2 + 36);
    v345 = 3;
    std::string::basic_string[abi:ne180100]<0>(v346, "mean_mav_1s");
    v347 = *((_DWORD *)v2 + 37);
    v348 = 3;
    std::string::basic_string[abi:ne180100]<0>(v349, "median_mav_1s");
    v350 = *((_DWORD *)v2 + 38);
    v351 = 3;
    std::string::basic_string[abi:ne180100]<0>(v352, "std_mav_1s");
    v353 = *((_DWORD *)v2 + 39);
    v354 = 3;
    std::string::basic_string[abi:ne180100]<0>(v355, "hfw");
    v356 = *((unsigned __int8 *)v2 + 160);
    v357 = 1;
    std::string::basic_string[abi:ne180100]<0>(v358, "win_len");
    v359[0] = *((unsigned __int16 *)v2 + 81);
    v359[8] = 1;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v4, (unsigned __int8 *)v7, 118);
    if (!*v1)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(_QWORD, void **, _BYTE *))(*(_QWORD *)*v1 + 48))(*v1, __p, v4);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v4);
    for (i = 0; i != -8496; i -= 72)
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v359[i / 4]);
      if (SHIBYTE(v358[i / 8 + 2]) < 0)
        operator delete((void *)v358[i / 8]);
    }
    if (v6 < 0)
      operator delete(__p[0]);
  }
}

void sub_24581B85C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  unint64_t *v22;
  uint64_t v23;

  v22 = &STACK[0x2130];
  v23 = -8496;
  do
  {
    v22 = (unint64_t *)(std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)v22)
                             - 72);
    v23 += 72;
  }
  while (v23);
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_processor_t::motion_status_handler_proxy(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, int a2)
{
  char *v3;
  NSObject *log;
  int v5;
  uint64_t result;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (char *)this + 772544;
  log = Scandium::algs_get_log(this);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)v3;
    v7[0] = 67109376;
    v7[1] = v5;
    v8 = 1024;
    v9 = a2;
    _os_log_impl(&dword_2457F9000, log, OS_LOG_TYPE_DEFAULT, "scandium motion handler pkt %d: %d", (uint8_t *)v7, 0xEu);
  }
  result = *((_QWORD *)v3 + 20);
  if (result)
  {
    LOBYTE(v7[0]) = a2;
    return (*(uint64_t (**)(uint64_t, _DWORD *))(*(_QWORD *)result + 48))(result, v7);
  }
  return result;
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_processor_t::posture_status_handler_proxy(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, int a2)
{
  char *v3;
  NSObject *log;
  int v5;
  uint64_t result;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (char *)this + 772544;
  log = Scandium::algs_get_log(this);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)v3;
    v7[0] = 67109376;
    v7[1] = v5;
    v8 = 1024;
    v9 = a2;
    _os_log_impl(&dword_2457F9000, log, OS_LOG_TYPE_DEFAULT, "scandium posture handler pkt %d: %d", (uint8_t *)v7, 0xEu);
  }
  result = *((_QWORD *)v3 + 24);
  if (result)
  {
    LOBYTE(v7[0]) = a2;
    return (*(uint64_t (**)(uint64_t, _DWORD *))(*(_QWORD *)result + 48))(result, v7);
  }
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<overloaded<Scandium::ScandiumPPG::scandium_spo2_monitor_t::scandium_spo2_monitor_t(std::string const&,std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL)::$_0,Scandium::ScandiumPPG::scandium_spo2_monitor_t::(std::string const&,std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL)::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&>(Scandium *a1)
{
  NSObject *log;
  uint8_t v3[16];

  log = Scandium::algs_get_log(a1);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2457F9000, log, OS_LOG_TYPE_DEFAULT, "Scandium Algs using legacy packets.", v3, 2u);
  }
  return 1;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<overloaded<Scandium::ScandiumPPG::scandium_spo2_monitor_t::scandium_spo2_monitor_t(std::string const&,std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL)::$_0,Scandium::ScandiumPPG::scandium_spo2_monitor_t::(std::string const&,std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL)::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&>(Scandium *a1)
{
  NSObject *log;
  uint8_t v3[16];

  log = Scandium::algs_get_log(a1);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2457F9000, log, OS_LOG_TYPE_DEFAULT, "Scandium Algs using current packets.", v3, 2u);
  }
  return 0;
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::~scandium_beat_detection_t(Scandium::ScandiumPPG::scandium_beat_detection_t *this)
{
  char *v2;
  char *v3;
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (char *)this + 132688;
  v3 = (char *)this + 132808;
  v4 = (char *)*((_QWORD *)this + 16604);
  if (v4 == v3)
  {
    v5 = 4;
    v4 = v3;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
LABEL_6:
  v6 = (void *)*((_QWORD *)v2 + 12);
  if (v6)
    operator delete(v6);
  v7 = (void *)*((_QWORD *)v2 + 9);
  if (v7)
  {
    *((_QWORD *)v2 + 10) = v7;
    operator delete(v7);
  }
  v8 = (void *)*((_QWORD *)v2 + 6);
  if (v8)
  {
    *((_QWORD *)v2 + 7) = v8;
    operator delete(v8);
  }
  v9 = (void *)*((_QWORD *)v2 + 3);
  if (v9)
  {
    *((_QWORD *)v2 + 4) = v9;
    operator delete(v9);
  }
  v10 = *(void **)v2;
  if (*(_QWORD *)v2)
  {
    *((_QWORD *)v2 + 1) = v10;
    operator delete(v10);
  }
  v11 = (void *)*((_QWORD *)this + 15);
  if (v11)
  {
    *((_QWORD *)this + 16) = v11;
    operator delete(v11);
  }
  v12 = (void *)*((_QWORD *)this + 11);
  if (v12)
  {
    *((_QWORD *)this + 12) = v12;
    operator delete(v12);
  }
}

char *std::vector<int>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(char *result, unsigned __int8 *a2, unsigned __int8 *a3, unint64_t a4)
{
  char *v6;
  _DWORD *v7;
  int v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = (_DWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_24581BC5C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

char *std::vector<int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(char *result, int *a2, int *a3, unint64_t a4)
{
  char *v6;
  _DWORD *v7;
  int v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = (_DWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_24581BD50(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 2)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 1;
    if (v8 >> 1 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
      v11 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 2;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

uint64_t std::__optional_destruct_base<Scandium::ScandiumPPG::channel_combination_param_t,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 136))
  {
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(a1 + 56);
    if (*(char *)(a1 + 23) < 0)
      operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[23],std::vector<int>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD *v5;

  v5 = std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, a2);
  v5[4] = 0;
  v5[5] = 0;
  v5 += 4;
  v5[2] = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v5, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2);
  *(_DWORD *)(a1 + 56) = 1;
  *(_DWORD *)(a1 + 64) = 6;
  return a1;
}

void sub_24581BF04(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[24],std::vector<int>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD *v5;

  v5 = std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, a2);
  v5[4] = 0;
  v5[5] = 0;
  v5 += 4;
  v5[2] = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v5, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2);
  *(_DWORD *)(a1 + 56) = 1;
  *(_DWORD *)(a1 + 64) = 6;
  return a1;
}

void sub_24581BF70(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<std::vector<float>>::__construct_one_at_end[abi:ne180100]<std::vector<float> const&>(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *result;

  v3 = *(_QWORD **)(a1 + 8);
  *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  result = std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v3, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  *(_QWORD *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_24581BFD4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v15 = v11;
  v16 = &v10[24 * v9];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v11, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  v15 += 24;
  std::vector<std::vector<float>>::__swap_out_circular_buffer(a1, v14);
  v12 = a1[1];
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_24581C0DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<float>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<float>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::vector<float>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::vector<float>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

uint64_t std::vector<std::vector<float>>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[5];

  v6 = a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    v9 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - *a1) >> 3);
    v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 3);
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v10;
    v16[4] = result;
    v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(result, v12);
    v14 = &v13[24 * v9];
    v16[0] = v13;
    v16[1] = v14;
    v16[3] = &v13[24 * v15];
    *((_QWORD *)v14 + 1) = 0;
    *((_QWORD *)v14 + 2) = 0;
    *(_QWORD *)v14 = 0;
    *(_OWORD *)v14 = *(_OWORD *)a2;
    *((_QWORD *)v14 + 2) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v16[2] = v14 + 24;
    std::vector<std::vector<float>>::__swap_out_circular_buffer(a1, v16);
    v8 = (_QWORD *)a1[1];
    result = std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)v16);
  }
  else
  {
    *v7 = 0;
    v7[1] = 0;
    v7[2] = 0;
    *(_OWORD *)v7 = *(_OWORD *)a2;
    v7[2] = *(_QWORD *)(a2 + 16);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v8 = v7 + 3;
    a1[1] = (uint64_t)(v7 + 3);
  }
  a1[1] = (uint64_t)v8;
  return result;
}

void sub_24581C430(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::function<float ()(float const*,int)>::operator()(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v5;
  uint64_t v6;

  v6 = a2;
  v5 = a3;
  v3 = *(_QWORD *)(a1 + 24);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, int *))(*(_QWORD *)v3 + 48))(v3, &v6, &v5);
}

void std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<float>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_24581C574(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t std::unordered_map<Scandium::sc_optical_gen_e,std::string>::unordered_map(uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::__unordered_map_hasher<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::hash<Scandium::sc_optical_gen_e>,std::equal_to<Scandium::sc_optical_gen_e>,true>,std::__unordered_map_equal<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::equal_to<Scandium::sc_optical_gen_e>,std::hash<Scandium::sc_optical_gen_e>,true>,std::allocator<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>>>::__emplace_unique_key_args<Scandium::sc_optical_gen_e,std::pair<Scandium::sc_optical_gen_e const,std::string> const&>(a1, a2, (uint64_t)a2);
      a2 += 8;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_24581C630(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::__unordered_map_hasher<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::hash<Scandium::sc_optical_gen_e>,std::equal_to<Scandium::sc_optical_gen_e>,true>,std::__unordered_map_equal<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::equal_to<Scandium::sc_optical_gen_e>,std::hash<Scandium::sc_optical_gen_e>,true>,std::allocator<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>>>::__emplace_unique_key_args<Scandium::sc_optical_gen_e,std::pair<Scandium::sc_optical_gen_e const,std::string> const&>(uint64_t a1, int *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  uint64_t **v8;
  uint64_t *result;
  unint64_t v10;
  float v11;
  float v12;
  _BOOL8 v13;
  unint64_t v14;
  unint64_t v15;
  size_t v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD v19[3];

  v5 = *a2;
  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
  {
    v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 <= v5)
        v3 = v5 % v6;
    }
    else
    {
      v3 = (v6 - 1) & v5;
    }
    v8 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v3);
    if (v8)
    {
      for (result = *v8; result; result = (uint64_t *)*result)
      {
        v10 = result[1];
        if (v10 == v5)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v5)
            return result;
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v10 >= v6)
              v10 %= v6;
          }
          else
          {
            v10 &= v6 - 1;
          }
          if (v10 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::__unordered_map_hasher<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::hash<Scandium::sc_optical_gen_e>,std::equal_to<Scandium::sc_optical_gen_e>,true>,std::__unordered_map_equal<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::equal_to<Scandium::sc_optical_gen_e>,std::hash<Scandium::sc_optical_gen_e>,true>,std::allocator<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>>>::__construct_node_hash<std::pair<Scandium::sc_optical_gen_e const,std::string> const&>(a1, *a2, a3, (uint64_t)v19);
  v11 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    v13 = 1;
    if (v6 >= 3)
      v13 = (v6 & (v6 - 1)) != 0;
    v14 = v13 | (2 * v6);
    v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15)
      v16 = v15;
    else
      v16 = v14;
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v16);
    v6 = *(_QWORD *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5)
        v3 = v5 % v6;
      else
        v3 = v5;
    }
    else
    {
      v3 = (v6 - 1) & v5;
    }
  }
  v17 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v17)
  {
    *(_QWORD *)v19[0] = *v17;
    *v17 = v19[0];
  }
  else
  {
    *(_QWORD *)v19[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v19[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v19[0])
    {
      v18 = *(_QWORD *)(*(_QWORD *)v19[0] + 8);
      if ((v6 & (v6 - 1)) != 0)
      {
        if (v18 >= v6)
          v18 %= v6;
      }
      else
      {
        v18 &= v6 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v18) = v19[0];
    }
  }
  result = (uint64_t *)v19[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_24581C854(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::__unordered_map_hasher<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::hash<Scandium::sc_optical_gen_e>,std::equal_to<Scandium::sc_optical_gen_e>,true>,std::__unordered_map_equal<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::equal_to<Scandium::sc_optical_gen_e>,std::hash<Scandium::sc_optical_gen_e>,true>,std::allocator<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>>>::__construct_node_hash<std::pair<Scandium::sc_optical_gen_e const,std::string> const&>(uint64_t a1@<X0>, std::string::size_type a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  std::string *v8;
  std::string *v9;

  v7 = a1 + 16;
  v8 = (std::string *)operator new(0x30uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v8->__r_.__value_.__l.__size_ = a2;
  LODWORD(v8->__r_.__value_.__r.__words[2]) = *(_DWORD *)a3;
  v9 = v8 + 1;
  if (*(char *)(a3 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)(a3 + 8), *(_QWORD *)(a3 + 16));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)(a3 + 8);
    v9->__r_.__value_.__r.__words[2] = *(_QWORD *)(a3 + 24);
  }
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_24581C90C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0>,void ()(BOOL)>::~__func()
{
  JUMPOUT(0x24953BE38);
}

_QWORD *std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0>,void ()(BOOL)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_25169D488;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0>,void ()(BOOL)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_25169D488;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0>,void ()(BOOL)>::operator()(uint64_t a1, unsigned __int8 *a2)
{
  return Scandium::ScandiumPPG::scandium_spo2_processor_t::motion_status_handler_proxy(*(Scandium::ScandiumPPG::scandium_spo2_processor_t **)(a1 + 8), *a2);
}

uint64_t std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0>,void ()(BOOL)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0>,void ()(BOOL)>::target_type()
{
}

void std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1>,void ()(BOOL)>::~__func()
{
  JUMPOUT(0x24953BE38);
}

_QWORD *std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1>,void ()(BOOL)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_25169D508;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1>,void ()(BOOL)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_25169D508;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1>,void ()(BOOL)>::operator()(uint64_t a1, unsigned __int8 *a2)
{
  return Scandium::ScandiumPPG::scandium_spo2_processor_t::posture_status_handler_proxy(*(Scandium::ScandiumPPG::scandium_spo2_processor_t **)(a1 + 8), *a2);
}

uint64_t std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1>,void ()(BOOL)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1>,void ()(BOOL)>::target_type()
{
}

void std::__function::__func<float (*)(float const*,int),std::allocator<float (*)(float const*,int)>,float ()(float const*,int)>::~__func()
{
  JUMPOUT(0x24953BE38);
}

_QWORD *std::__function::__func<float (*)(float const*,int),std::allocator<float (*)(float const*,int)>,float ()(float const*,int)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &unk_25169D588;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<float (*)(float const*,int),std::allocator<float (*)(float const*,int)>,float ()(float const*,int)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &unk_25169D588;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<float (*)(float const*,int),std::allocator<float (*)(float const*,int)>,float ()(float const*,int)>::operator()(uint64_t a1, _QWORD *a2, unsigned int *a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 8))(*a2, *a3);
}

uint64_t std::__function::__func<float (*)(float const*,int),std::allocator<float (*)(float const*,int)>,float ()(float const*,int)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<float (*)(float const*,int),std::allocator<float (*)(float const*,int)>,float ()(float const*,int)>::target_type()
{
}

double Scandium::ScandiumPPG::BGA_t::reset(Scandium::ScandiumPPG::BGA_t *this)
{
  double result;

  *((_DWORD *)this + 16) = 0;
  result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *(_OWORD *)((char *)this + 76) = 0u;
  *(_OWORD *)((char *)this + 92) = 0u;
  *((_DWORD *)this + 27) = 0;
  return result;
}

_QWORD *Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_reset(_QWORD *this)
{
  this[1] = *this;
  this[4] = this[3];
  this[7] = this[6];
  this[10] = this[9];
  return this;
}

double Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_t(Scandium::ScandiumPPG::scandium_bga_t *this)
{
  double result;

  *((_QWORD *)this + 15) = 0;
  result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  return result;
}

void Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t(Scandium::ScandiumPPG::scandium_bga_t *this)
{
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (char *)this + 96;
  v3 = (char *)*((_QWORD *)this + 15);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_6:
  v5 = (void *)*((_QWORD *)this + 9);
  if (v5)
  {
    *((_QWORD *)this + 10) = v5;
    operator delete(v5);
  }
  v6 = (void *)*((_QWORD *)this + 6);
  if (v6)
  {
    *((_QWORD *)this + 7) = v6;
    operator delete(v6);
  }
  v7 = (void *)*((_QWORD *)this + 3);
  if (v7)
  {
    *((_QWORD *)this + 4) = v7;
    operator delete(v7);
  }
  v8 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v8;
    operator delete(v8);
  }
}

void Scandium::ScandiumPPG::scandium_bga_t::compute_bga_measures(Scandium::ScandiumPPG::beats_t *a1@<X1>, __int32 a2@<W2>, uint64_t a3@<X8>, int32x2_t a4@<D0>)
{
  int *v5;
  unint64_t v6;
  int32x2_t v7;
  int v8;
  uint64_t v9;
  int v10;
  __int32 v11;
  int v13;

  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 16) = 0;
  a4.i32[0] = *((_DWORD *)a1 + 6);
  v5 = (int *)*((_QWORD *)a1 + 4);
  v6 = *((_QWORD *)a1 + 5) - (_QWORD)v5;
  v7 = vcvt_n_s32_f32(vdiv_f32((float32x2_t)0x4190000042700000, (float32x2_t)vdup_lane_s32(a4, 0)), 6uLL);
  *(int32x2_t *)a3 = v7;
  if ((int)(v6 >> 2) < 1)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    v9 = (v6 >> 2);
    do
    {
      v10 = *v5++;
      v11 = v7.i32[0] - v7.i32[1] + v10;
      if (v10 >= v7.i32[1] && v11 <= a2)
        ++v8;
      --v9;
    }
    while (v9);
  }
  *(_DWORD *)(a3 + 16) = v8;
  v13 = *((_DWORD *)a1 + 7);
  *(_DWORD *)(a3 + 8) = a4.i32[0];
  *(_DWORD *)(a3 + 12) = v13;
}

void Scandium::ScandiumPPG::scandium_bga_t::compute_ppg_snips(_QWORD *a1, _QWORD *a2, uint64_t a3, int *a4, uint64_t a5, uint64_t *a6, int a7)
{
  uint64_t v11;
  uint64_t v12;
  float *v13;
  uint64_t v14;
  void **v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;
  char *v21;
  _DWORD *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  int v30;
  uint64_t v31;
  float v32;
  float *v33;
  float *v34;
  float *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  float *v41;
  int v42;
  float v43;
  vDSP_Length v44;
  vDSP_Length *v45;
  unint64_t v46;
  float *v47;
  float v48;
  float v49;
  uint64_t v50;
  void ***v51;
  uint64_t v55;
  void *__p;
  float *v57;
  float *v58;
  float *v59[3];

  v11 = *(_QWORD *)(a3 + 40) - *(_QWORD *)(a3 + 32);
  std::vector<unsigned long>::vector(v59, (int)(v11 >> 2));
  if ((int)((unint64_t)v11 >> 2) >= 1)
  {
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)(a3 + 32);
    v15 = (void **)(a1 + 6);
    v16 = ((unint64_t)v11 >> 2);
    do
    {
      v17 = *(_DWORD *)(v14 + 4 * v12);
      v18 = a4[1];
      v19 = v17 - v18;
      if (v17 >= v18 && v19 + *a4 - 1 < (unint64_t)((uint64_t)(a2[1] - *a2) >> 2))
      {
        v21 = (char *)a1[7];
        v20 = a1[8];
        if ((unint64_t)v21 >= v20)
        {
          v23 = (char *)*v15;
          v24 = (v21 - (_BYTE *)*v15) >> 2;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v26 = v20 - (_QWORD)v23;
          if (v26 >> 1 > v25)
            v25 = v26 >> 1;
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
            v27 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v27 = v25;
          if (v27)
          {
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 8), v27);
            v23 = (char *)a1[6];
            v21 = (char *)a1[7];
          }
          else
          {
            v28 = 0;
          }
          v29 = &v28[4 * v24];
          *(_DWORD *)v29 = v19;
          v22 = v29 + 4;
          while (v21 != v23)
          {
            v30 = *((_DWORD *)v21 - 1);
            v21 -= 4;
            *((_DWORD *)v29 - 1) = v30;
            v29 -= 4;
          }
          a1[6] = v29;
          a1[7] = v22;
          a1[8] = &v28[4 * v27];
          if (v23)
            operator delete(v23);
        }
        else
        {
          *(_DWORD *)v21 = v19;
          v22 = v21 + 4;
        }
        a1[7] = v22;
        v13 = (float *)((_DWORD)v13 + 1);
      }
      ++v12;
    }
    while (v12 != v16);
    if ((int)v13 > 0)
    {
      __p = 0;
      v57 = 0;
      v58 = 0;
      std::vector<float>::reserve(&__p, v13);
      v31 = 0;
      v55 = 0;
      do
      {
        vDSP_maxv_wrapper(*a2 + 4 * *((int *)*v15 + v31), 1, (float *)&v55, *a4);
        vDSP_minv_wrapper(*a2 + 4 * *((int *)*v15 + v31), 1, (float *)&v55 + 1, *a4);
        v32 = *(float *)&v55 - *((float *)&v55 + 1);
        v33 = v57;
        if (v57 >= v58)
        {
          v35 = (float *)__p;
          v36 = ((char *)v57 - (_BYTE *)__p) >> 2;
          v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v38 = (char *)v58 - (_BYTE *)__p;
          if (((char *)v58 - (_BYTE *)__p) >> 1 > v37)
            v37 = v38 >> 1;
          if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v37;
          if (v39)
          {
            v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v58, v39);
            v35 = (float *)__p;
            v33 = v57;
          }
          else
          {
            v40 = 0;
          }
          v41 = (float *)&v40[4 * v36];
          *v41 = v32;
          v34 = v41 + 1;
          while (v33 != v35)
          {
            v42 = *((_DWORD *)v33-- - 1);
            *((_DWORD *)v41-- - 1) = v42;
          }
          __p = v41;
          v57 = v34;
          v58 = (float *)&v40[4 * v39];
          if (v35)
            operator delete(v35);
        }
        else
        {
          *v57 = v32;
          v34 = v33 + 1;
        }
        v57 = v34;
        ++v31;
      }
      while (v31 != v13);
      v43 = stats::std((stats *)__p, v13, 1);
      v44 = 0;
      v45 = (vDSP_Length *)v59[0];
      do
      {
        v45[v44] = v44;
        ++v44;
      }
      while (v13 != v44);
      stats::median_vdsp((stats *)__p, v45, (unint64_t *)v13);
      v46 = 0;
      v47 = (float *)__p;
      v49 = v48 + (float)(v43 * 2.0);
      v50 = *a6;
      do
      {
        if (v47[v46] > v49)
          *(_QWORD *)(v50 + ((v46 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << v46);
        ++v46;
      }
      while (v13 != v46);
      *(_DWORD *)(a5 + 108) = (a1[7] - a1[6]) >> 2;
      if (a7)
      {
        if (a7 == 1)
        {
          v51 = (void ***)(a5 + 32);
        }
        else
        {
          if (a7 != 2)
            goto LABEL_55;
          v51 = (void ***)(a5 + 40);
        }
      }
      else
      {
        v51 = (void ***)(a5 + 24);
      }
      *v51 = v15;
LABEL_55:
      if (__p)
      {
        v57 = (float *)__p;
        operator delete(__p);
      }
    }
  }
  if (v59[0])
  {
    v59[1] = v59[0];
    operator delete(v59[0]);
  }
}

void sub_24581D098(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
  if (__p)
    operator delete(__p);
  if (a18)
    operator delete(a18);
  _Unwind_Resume(exception_object);
}

char *Scandium::ScandiumPPG::scandium_bga_t::compute_wavelength(char *result, uint64_t a2, uint64_t a3, uint64_t *a4, unsigned int *a5, uint64_t a6, int a7)
{
  uint64_t v9;
  unint64_t v10;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  float **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float *v20;
  float *v21;
  uint64_t v22;
  float v23;
  float *v24;
  uint64_t v25;
  float *v26;
  float v27;
  uint64_t v28;
  float v29;
  float v30;
  int v31;

  v9 = a4[1];
  v10 = v9 - *a4;
  if (v9 == *a4)
  {
    v30 = 0.0;
  }
  else
  {
    v13 = result;
    v14 = (int)*a5;
    v15 = *a5;
    v16 = (float **)(result + 72);
    v31 = 0;
    result = std::vector<float>::assign((char **)result + 9, v14, &v31);
    if ((int)(v10 >> 2) >= 1)
    {
      v17 = 0;
      v18 = *a4;
      v19 = *((_QWORD *)v13 + 6);
      do
      {
        if ((int)v15 >= 1)
        {
          v20 = (float *)(a3 + 4 * *(unsigned int *)(v19 + 4 * *(int *)(v18 + 4 * v17)));
          v21 = *v16;
          v22 = v15;
          do
          {
            v23 = *v20++;
            *v21 = v23 + *v21;
            ++v21;
            --v22;
          }
          while (v22);
        }
        ++v17;
      }
      while (v17 != (v10 >> 2));
    }
    if ((int)v15 < 1)
    {
      v27 = 0.0;
    }
    else
    {
      v24 = *v16;
      v25 = v15;
      do
      {
        *v24 = *v24 / (float)(int)(v10 >> 2);
        ++v24;
        --v25;
      }
      while (v25);
      v26 = *v16;
      v27 = 0.0;
      v28 = v15;
      do
      {
        v29 = *v26++;
        v27 = v27 + v29;
        --v28;
      }
      while (v28);
    }
    v30 = v27 / (float)(int)v15;
  }
  if (a7 == 1)
  {
    *(float *)(a6 + 72) = v30;
  }
  else if (!a7)
  {
    *(float *)(a6 + 68) = v30;
  }
  return result;
}

void Scandium::ScandiumPPG::scandium_bga_t::compile_bga_metrics(uint64_t a1, uint64_t *a2, uint64_t *a3, unsigned int *a4, uint64_t a5, int a6)
{
  uint64_t v10;
  unint64_t v11;
  unint64_t v14;
  const float *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float *v20;
  char *v21;
  const float *v22;
  float v23;
  char *v24;
  const float *v25;
  char *v26;
  float v27;
  float v28;
  uint64_t v29;
  int v30;

  v10 = a3[1];
  v11 = v10 - *a3;
  if (v10 == *a3)
  {
    v28 = NAN;
    v29 = a3[1];
  }
  else
  {
    v14 = (int)*a4;
    v30 = 0;
    std::vector<float>::assign((char **)a1, v14, &v30);
    v15 = (const float *)*a4;
    if ((int)(v11 >> 2) >= 1)
    {
      v16 = 0;
      v17 = *a3;
      v18 = *(_QWORD *)(a1 + 48);
      v19 = *a2;
      do
      {
        if ((int)v15 >= 1)
        {
          v20 = (float *)(v19 + 4 * *(unsigned int *)(v18 + 4 * *(int *)(v17 + 4 * v16)));
          v21 = *(char **)a1;
          v22 = v15;
          do
          {
            v23 = *v20++;
            *(float *)v21 = v23 + *(float *)v21;
            v21 += 4;
            v22 = (const float *)((char *)v22 - 1);
          }
          while (v22);
        }
        ++v16;
      }
      while (v16 != (v11 >> 2));
    }
    v24 = *(char **)a1;
    if ((int)v15 >= 1)
    {
      v25 = v15;
      v26 = *(char **)a1;
      do
      {
        *(float *)v26 = *(float *)v26 / (float)(int)(v11 >> 2);
        v26 += 4;
        v25 = (const float *)((char *)v25 - 1);
      }
      while (v25);
    }
    v27 = stats::max((stats *)v24, v15);
    v28 = v27 - stats::min(*(stats **)a1, (const float *)*a4);
    v10 = *a3;
    v29 = a3[1];
  }
  *(_QWORD *)(a5 + 48) = a3;
  *(_DWORD *)(a5 + 104) = (unint64_t)(v29 - v10) >> 2;
  switch(a6)
  {
    case 2:
      *(_QWORD *)(a5 + 16) = a1;
      *(float *)(a5 + 64) = v28;
      break;
    case 1:
      *(_QWORD *)(a5 + 8) = a1;
      *(float *)(a5 + 60) = v28;
      break;
    case 0:
      *(_QWORD *)a5 = a1;
      *(float *)(a5 + 56) = v28;
      break;
  }
}

void Scandium::ScandiumPPG::scandium_bga_t::compute_snip_corr(uint64_t a1, _QWORD *a2, _QWORD *a3, unsigned int *a4, float *a5, int a6)
{
  int v6;
  float *v7;
  uint64_t v8;
  uint64_t v9;
  const float **v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  float v18;
  unint64_t v19;
  float *v20;
  float *v21;
  float *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  float *v28;
  int v29;
  float *v30;
  float v31;
  float v32;
  unint64_t v35;
  float *__C[3];
  float v37;

  v6 = a6;
  v7 = a5;
  v8 = a3[1];
  v9 = v8 - *a3;
  if (v8 == *a3)
  {
    v32 = NAN;
  }
  else
  {
    v14 = (const float **)(a1 + 24);
    v35 = (int)(v9 >> 2);
    std::vector<float>::reserve((void **)(a1 + 24), v35);
    if ((int)((unint64_t)v9 >> 2) >= 1)
    {
      v15 = 0;
      v16 = ((unint64_t)v9 >> 2);
      do
      {
        v17 = stats::pearsonr(*(stats **)a1, (stats *)(*a2 + 4 * *(int *)(*(_QWORD *)(a1 + 48) + 4 * *(int *)(*a3 + 4 * v15))), (const float *)*a4);
        v18 = v17;
        v20 = *(float **)(a1 + 32);
        v19 = *(_QWORD *)(a1 + 40);
        if ((unint64_t)v20 >= v19)
        {
          v22 = (float *)*v14;
          v23 = v20 - *v14;
          v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v25 = v19 - (_QWORD)v22;
          if (v25 >> 1 > v24)
            v24 = v25 >> 1;
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL)
            v26 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v26 = v24;
          if (v26)
          {
            v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 40, v26);
            v22 = *(float **)(a1 + 24);
            v20 = *(float **)(a1 + 32);
          }
          else
          {
            v27 = 0;
          }
          v28 = (float *)&v27[4 * v23];
          *v28 = v18;
          v21 = v28 + 1;
          while (v20 != v22)
          {
            v29 = *((_DWORD *)v20-- - 1);
            *((_DWORD *)v28-- - 1) = v29;
          }
          *(_QWORD *)(a1 + 24) = v28;
          *(_QWORD *)(a1 + 32) = v21;
          *(_QWORD *)(a1 + 40) = &v27[4 * v26];
          if (v22)
            operator delete(v22);
        }
        else
        {
          *v20 = v17;
          v21 = v20 + 1;
        }
        *(_QWORD *)(a1 + 32) = v21;
        ++v15;
      }
      while (v15 != v16);
    }
    v37 = 0.0;
    std::vector<float>::vector(__C, v35);
    v30 = __C[0];
    vDSP_vsq(*v14, 1, __C[0], 1, v35);
    vDSP_meanv_wrapper((uint64_t)v30, 1, &v37, v35);
    v31 = v37;
    v7 = a5;
    v6 = a6;
    if (__C[0])
    {
      __C[1] = __C[0];
      operator delete(__C[0]);
    }
    v32 = sqrtf(v31);
  }
  switch(v6)
  {
    case 2:
      v7[21] = v32;
      break;
    case 1:
      v7[20] = v32;
      break;
    case 0:
      v7[19] = v32;
      break;
  }
}

void sub_24581D5C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<unsigned long>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<long long>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_24581D634(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Scandium::scandium_mvmt_detection_t::scandium_mvmt_detection_t(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 36) = 0x3F3504F33A83126FLL;
  *(_DWORD *)(a1 + 44) = 0;
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100](a1 + 48, a2);
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100](a1 + 80, a3);
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  Scandium::scandium_mvmt_detection_t::reset((Scandium::scandium_mvmt_detection_t *)a1);
  return a1;
}

void sub_24581D6C0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = *(_QWORD **)(v1 + 72);
  if (v4 == v2)
  {
    v5 = 4;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
    v2 = *(_QWORD **)(v1 + 72);
  }
  (*(void (**)(_QWORD *))(*v2 + 8 * v5))(v2);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void Scandium::scandium_mvmt_detection_t::reset(Scandium::scandium_mvmt_detection_t *this)
{
  char *v2;
  int v3;

  *(_BYTE *)this = 0;
  *((_BYTE *)this + 16) = 0;
  *((_WORD *)this + 16) = 0;
  v2 = (char *)this + 8;
  v3 = 0;
  std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v2, 8uLL);
  v2 = (char *)this + 24;
  v3 = 0;
  std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v2, 1uLL);
  *((_QWORD *)this + 19) = *((_QWORD *)this + 18);
}

void Scandium::scandium_mvmt_detection_t::~scandium_mvmt_detection_t(Scandium::scandium_mvmt_detection_t *this)
{
  void *v2;
  Scandium::scandium_mvmt_detection_t *v3;
  uint64_t v4;
  Scandium::scandium_mvmt_detection_t *v5;
  uint64_t v6;
  Scandium::scandium_mvmt_detection_t *v7;
  uint64_t v8;

  v2 = (void *)*((_QWORD *)this + 18);
  if (v2)
  {
    *((_QWORD *)this + 19) = v2;
    operator delete(v2);
  }
  v3 = (Scandium::scandium_mvmt_detection_t *)*((_QWORD *)this + 17);
  if (v3 == (Scandium::scandium_mvmt_detection_t *)((char *)this + 112))
  {
    v4 = 4;
    v3 = (Scandium::scandium_mvmt_detection_t *)((char *)this + 112);
  }
  else
  {
    if (!v3)
      goto LABEL_8;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_8:
  v5 = (Scandium::scandium_mvmt_detection_t *)*((_QWORD *)this + 13);
  if (v5 == (Scandium::scandium_mvmt_detection_t *)((char *)this + 80))
  {
    v6 = 4;
    v5 = (Scandium::scandium_mvmt_detection_t *)((char *)this + 80);
  }
  else
  {
    if (!v5)
      goto LABEL_13;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
LABEL_13:
  v7 = (Scandium::scandium_mvmt_detection_t *)*((_QWORD *)this + 9);
  if (v7 == (Scandium::scandium_mvmt_detection_t *)((char *)this + 48))
  {
    v8 = 4;
    v7 = (Scandium::scandium_mvmt_detection_t *)((char *)this + 48);
  }
  else
  {
    if (!v7)
      return;
    v8 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v7 + 8 * v8))();
}

int32x2_t Scandium::scandium_mvmt_detection_t::set_config(int32x2_t *a1, uint64_t a2)
{
  int32x2_t result;

  a1[4].i32[1] = *(_DWORD *)(a2 + 12);
  result = vrev64_s32(*(int32x2_t *)(a2 + 28));
  a1[5] = result;
  return result;
}

uint64_t Scandium::scandium_mvmt_detection_t::process(uint64_t a1, uint64_t a2, unsigned int a3, const float *a4)
{
  uint64_t result;

  *(_WORD *)(a1 + 32) = 0;
  result = 1;
  if ((_DWORD)a4)
  {
    if (a4 + a3 <= 0x3C0)
    {
      Scandium::scandium_mvmt_detection_t::processMvmt((int8x8_t *)a1, a2, a3, a4, *(float *)(a1 + 36));
      Scandium::scandium_mvmt_detection_t::processPosture((int8x8_t *)a1, a2, a3, a4, *(float *)(a1 + 40), *(float *)(a1 + 44));
      return 0;
    }
  }
  return result;
}

uint64_t Scandium::scandium_mvmt_detection_t::processMvmt(int8x8_t *a1, uint64_t a2, unsigned int a3, const float *a4, float a5)
{
  uint64_t result;
  stats *v9;
  float v10;
  uint64_t v11;
  float v12;
  int v13;
  float *v14;
  unint64_t v15;
  float *v16;
  float *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  float *v23;
  char *v24;
  int v25;
  int8x8_t *v26;
  unint64_t v27;
  int8x8_t v28;
  int8x8_t v29;
  char v30;

  result = 1;
  if ((_DWORD)a4 && a4 + a3 <= 0x3C0)
  {
    v9 = (stats *)(a2 + 4 * a3);
    v10 = 0.0;
    v11 = 3;
    do
    {
      v12 = stats::variance(v9, a4, 1);
      if (v10 < v12)
        v10 = v12;
      v9 = (stats *)((char *)v9 + 3840);
      --v11;
    }
    while (v11);
    v13 = a1->u8[0];
    a1->i8[0] = v10 >= a5;
    v14 = (float *)a1[19];
    v15 = (unint64_t)a1[20];
    if ((unint64_t)v14 >= v15)
    {
      v17 = (float *)a1[18];
      v18 = v14 - v17;
      if ((unint64_t)(v18 + 1) >> 62)
        std::vector<float>::__throw_length_error[abi:ne180100]();
      v19 = v15 - (_QWORD)v17;
      v20 = (uint64_t)(v15 - (_QWORD)v17) >> 1;
      if (v20 <= v18 + 1)
        v20 = v18 + 1;
      if (v19 >= 0x7FFFFFFFFFFFFFFCLL)
        v21 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v21 = v20;
      if (v21)
      {
        v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&a1[20], v21);
        v17 = (float *)a1[18];
        v14 = (float *)a1[19];
      }
      else
      {
        v22 = 0;
      }
      v23 = (float *)&v22[4 * v18];
      v24 = &v22[4 * v21];
      *v23 = v10;
      v16 = v23 + 1;
      while (v14 != v17)
      {
        v25 = *((_DWORD *)v14-- - 1);
        *((_DWORD *)v23-- - 1) = v25;
      }
      a1[18] = (int8x8_t)v23;
      a1[19] = (int8x8_t)v16;
      a1[20] = (int8x8_t)v24;
      if (v17)
        operator delete(v17);
    }
    else
    {
      *v14 = v10;
      v16 = v14 + 1;
    }
    a1[19] = (int8x8_t)v16;
    v26 = a1 + 1;
    if (a1->i8[0])
    {
      v29 = *v26;
      std::bitset<8ul>::operator<<=[abi:ne180100]((uint64_t)&v29, 1uLL);
      v27 = *(_QWORD *)&v29 | 1;
    }
    else
    {
      v29 = *v26;
      std::bitset<8ul>::operator<<=[abi:ne180100]((uint64_t)&v29, 1uLL);
      v27 = *(_QWORD *)&v29 & 0xFFFFFFFFFFFFFFFELL;
    }
    a1[1] = (int8x8_t)v27;
    if (v13 != a1->u8[0])
    {
      v30 = 1;
      if ((unint64_t)std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::__bitset<1ul,8ul>,true,BOOL,std::__identity,0>(a1 + 1, 0, (uint64_t)&a1[1], 8u, &v30) <= 7)
      {
        v28 = a1[9];
        if (v28)
        {
          v29.i8[0] = a1->i8[0];
          (*(void (**)(int8x8_t, int8x8_t *))(**(_QWORD **)&v28 + 48))(v28, &v29);
        }
      }
    }
    v30 = 1;
    if ((unint64_t)std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::__bitset<1ul,8ul>,true,BOOL,std::__identity,0>(a1 + 1, 0, (uint64_t)&a1[1], 8u, &v30) < 8)
    {
      return 0;
    }
    else
    {
      result = 0;
      a1[4].i8[0] = 1;
    }
  }
  return result;
}

uint64_t Scandium::scandium_mvmt_detection_t::processPosture(int8x8_t *a1, uint64_t a2, unsigned int a3, const float *a4, float a5, float a6)
{
  uint64_t result;
  uint64_t v11;
  float v12;
  float v13;
  int v14;
  _BOOL4 v15;
  unint64_t v16;
  int8x8_t v17;
  int8x8_t v18;
  char v19;

  result = 1;
  if ((_DWORD)a4 && a4 + a3 <= 0x3C0)
  {
    v11 = a2 + 4 * a3;
    v12 = stats::mean((stats *)v11, a4);
    v13 = stats::mean((stats *)(v11 + 7680), a4);
    v14 = a1[2].u8[0];
    v15 = fabsf(v12) > a5;
    if (v13 > a6)
      v15 = 1;
    a1[2].i8[0] = v15;
    v18 = a1[3];
    if (v15)
    {
      std::bitset<1ul>::operator<<=[abi:ne180100]((uint64_t)&v18, 1);
      v16 = *(_QWORD *)&v18 | 1;
    }
    else
    {
      std::bitset<1ul>::operator<<=[abi:ne180100]((uint64_t)&v18, 1);
      v16 = *(_QWORD *)&v18 & 0xFFFFFFFFFFFFFFFELL;
    }
    a1[3] = (int8x8_t)v16;
    if (v14 != a1[2].u8[0])
    {
      v19 = 1;
      if (!std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::__bitset<1ul,8ul>,true,BOOL,std::__identity,0>(a1 + 3, 0, (uint64_t)&a1[3], 1u, &v19))
      {
        v17 = a1[13];
        if (v17)
        {
          v18.i8[0] = a1[2].i8[0];
          (*(void (**)(int8x8_t, int8x8_t *))(**(_QWORD **)&v17 + 48))(v17, &v18);
        }
      }
    }
    v19 = 1;
    result = std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::__bitset<1ul,8ul>,true,BOOL,std::__identity,0>(a1 + 3, 0, (uint64_t)&a1[3], 1u, &v19);
    if (result)
    {
      result = 0;
      a1[4].i8[1] = 1;
    }
  }
  return result;
}

uint64_t std::bitset<8ul>::operator<<=[abi:ne180100](uint64_t a1, unint64_t a2)
{
  unint64_t v3;
  _BYTE v5[16];
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;

  if (a2 >= 8)
    v3 = 8;
  else
    v3 = a2;
  if ((_DWORD)v3)
  {
    v10 = a1;
    v11 = 0;
    v8 = a1;
    v9 = 8 - v3;
    v6 = a1;
    v7 = 8;
    std::__copy_backward_unaligned[abi:ne180100]<std::__bitset<1ul,8ul>,false>((unint64_t)&v10, (uint64_t)&v8, (uint64_t)&v6, (uint64_t)v5);
    v16 = a1;
    v17 = 0;
    std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v16, v3);
  }
  else
  {
    v16 = a1;
    v17 = 0;
    v14 = a1;
    v15 = 8;
    v12 = a1;
    v13 = 8;
    std::__copy_backward_aligned[abi:ne180100]<std::__bitset<1ul,8ul>,false>((unsigned int *)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)v5);
  }
  return a1;
}

unsigned int *std::__copy_backward_aligned[abi:ne180100]<std::__bitset<1ul,8ul>,false>@<X0>(unsigned int *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  unint64_t v17;

  v6 = *(unsigned int *)(a2 + 8);
  v7 = result[2];
  v8 = v6 + 8 * (*(_QWORD *)a2 - *(_QWORD *)result) - v7;
  v9 = *(unint64_t **)a3;
  if (v8 >= 1)
  {
    if ((_DWORD)v6)
    {
      if (v8 >= v6)
        v11 = *(unsigned int *)(a2 + 8);
      else
        v11 = v6 + 8 * (*(_QWORD *)a2 - *(_QWORD *)result) - v7;
      v8 -= v11;
      v12 = (-1 << (v6 - v11)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v6);
      *v9 = *v9 & ~v12 | **(_QWORD **)a2 & v12;
      *(_DWORD *)(a3 + 8) = (*(_DWORD *)(a3 + 8) - (_BYTE)v11) & 0x3F;
    }
    if (v8 >= 0)
      v13 = v8;
    else
      v13 = v8 + 63;
    v14 = v13 >> 6;
    *(_QWORD *)a3 = &v9[-(v13 >> 6)];
    v15 = (const void *)(*(_QWORD *)a2 - 8 * (v13 >> 6));
    *(_QWORD *)a2 = v15;
    if ((unint64_t)(v8 + 63) >= 0x7F)
      result = (unsigned int *)memmove(*(void **)a3, v15, 8 * v14);
    if (v8 - (v14 << 6) <= 0)
    {
      v9 = *(unint64_t **)a3;
    }
    else
    {
      v16 = *(_QWORD *)(*(_QWORD *)a2 - 8);
      *(_QWORD *)a2 -= 8;
      v9 = (unint64_t *)(*(_QWORD *)a3 - 8);
      v17 = *v9;
      *(_QWORD *)a3 = v9;
      *v9 = v17 & ~(-1 << (((_BYTE)v14 << 6) - v8)) | v16 & (-1 << (((_BYTE)v14 << 6)
                                                                                       - v8));
      *(_DWORD *)(a3 + 8) = -(int)v8 & 0x3F;
    }
  }
  *(_QWORD *)a4 = v9;
  *(_DWORD *)(a4 + 8) = *(_DWORD *)(a3 + 8);
  return result;
}

unint64_t std::__copy_backward_unaligned[abi:ne180100]<std::__bitset<1ul,8ul>,false>@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  BOOL v13;
  int v14;
  unint64_t v15;
  unint64_t *v16;
  uint64_t v17;
  int v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t *v30;
  uint64_t v31;

  v4 = *(unsigned int *)(a2 + 8);
  v5 = *(unsigned int *)(result + 8);
  v6 = v4 + 8 * (*(_QWORD *)a2 - *(_QWORD *)result) - v5;
  if (v6 <= 0)
  {
    LODWORD(v9) = *(_DWORD *)(a3 + 8);
  }
  else
  {
    if ((_DWORD)v4)
    {
      if (v6 >= v4)
        v7 = *(unsigned int *)(a2 + 8);
      else
        v7 = v4 + 8 * (*(_QWORD *)a2 - *(_QWORD *)result) - v5;
      v6 -= v7;
      v8 = (-1 << (v4 - v7)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v4) & **(_QWORD **)a2;
      v9 = *(unsigned int *)(a3 + 8);
      if (v7 >= v9)
        v10 = *(unsigned int *)(a3 + 8);
      else
        v10 = v7;
      if (v10)
      {
        v11 = v8 >> (v4 - v9);
        v12 = v9 >= v4;
        v14 = v9 - v4;
        v13 = v14 != 0 && v12;
        v15 = v8 << v14;
        if (!v13)
          v15 = v11;
        **(_QWORD **)a3 = **(_QWORD **)a3 & ~((-1 << (v9 - v10)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v9)) | v15;
        LODWORD(v9) = ((_BYTE)v9 - (_BYTE)v10) & 0x3F;
        *(_DWORD *)(a3 + 8) = v9;
        v7 -= v10;
      }
      if (v7 >= 1)
      {
        v16 = (unint64_t *)(*(_QWORD *)a3 - 8);
        v9 = *v16;
        *(_QWORD *)a3 = v16;
        *(_DWORD *)(a3 + 8) = -(int)v7 & 0x3F;
        v17 = v9 & ~(-1 << -(char)v7);
        v18 = *(_DWORD *)(a2 + 8) - v7 - v10;
        *(_DWORD *)(a2 + 8) = v18;
        LODWORD(v9) = *(_DWORD *)(a3 + 8);
        *v16 = (v8 << (v9 - v18)) | v17;
      }
    }
    else
    {
      LODWORD(v9) = *(_DWORD *)(a3 + 8);
    }
    v19 = 64 - v9;
    v20 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v9;
    if (v6 < 64)
    {
      v24 = v6;
    }
    else
    {
      do
      {
        v21 = *(_QWORD *)(*(_QWORD *)a2 - 8);
        *(_QWORD *)a2 -= 8;
        v22 = *(unint64_t **)a3;
        result = v21 >> v19;
        *v22 = **(_QWORD **)a3 & ~v20 | (v21 >> v19);
        v23 = *--v22;
        *(_QWORD *)a3 = v22;
        *v22 = v23 & v20 | (v21 << v9);
        v24 = v6 - 64;
        v13 = (unint64_t)v6 > 0x7F;
        v6 -= 64;
      }
      while (v13);
    }
    if (v24 >= 1)
    {
      v25 = *(_QWORD *)(*(_QWORD *)a2 - 8);
      *(_QWORD *)a2 -= 8;
      v26 = v25 & (-1 << -(char)v24);
      if (v24 >= (unint64_t)v9)
        v27 = v9;
      else
        v27 = v24;
      v28 = (-1 << (v9 - v27)) & v20;
      v29 = *(unint64_t **)a3;
      **(_QWORD **)a3 = **(_QWORD **)a3 & ~v28 | (v26 >> v19);
      LODWORD(v9) = ((_BYTE)v9 - (_BYTE)v27) & 0x3F;
      *(_DWORD *)(a3 + 8) = v9;
      if (v24 - v27 >= 1)
      {
        v31 = *(v29 - 1);
        v30 = v29 - 1;
        *(_QWORD *)a3 = v30;
        *(_DWORD *)(a3 + 8) = (v27 - v24) & 0x3F;
        *v30 = v31 & ~(-1 << (v27 - v24)) | (v26 << (v24 + ((v27 - v24) & 0x3F)));
        LODWORD(v9) = (v27 - v24) & 0x3F;
      }
    }
  }
  *(_QWORD *)a4 = *(_QWORD *)a3;
  *(_DWORD *)(a4 + 8) = v9;
  return result;
}

uint64_t std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::__bitset<1ul,8ul>,true,BOOL,std::__identity,0>(int8x8_t *a1, unsigned int a2, uint64_t a3, unsigned int a4, _BYTE *a5)
{
  unint64_t v5;

  v5 = a4 - (unint64_t)a2 + 8 * (a3 - (_QWORD)a1);
  if (*a5)
    return std::__count_BOOL[abi:ne180100]<true,std::__bitset<1ul,8ul>,true>(a1, a2, v5);
  else
    return std::__count_BOOL[abi:ne180100]<false,std::__bitset<1ul,8ul>,true>((uint64_t *)a1, a2, v5);
}

uint64_t std::__count_BOOL[abi:ne180100]<true,std::__bitset<1ul,8ul>,true>(int8x8_t *a1, unsigned int a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint8x8_t v6;
  int8x8_t v7;
  uint8x8_t v8;
  uint8x8_t v9;

  v3 = a2;
  if (a2)
  {
    if (64 - a2 >= a3)
      v4 = a3;
    else
      v4 = 64 - a2;
    v5 = (uint64_t)*a1++;
    v6 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v4)) & (-1 << a2) & v5));
    v6.i16[0] = vaddlv_u8(v6);
    v3 = v6.u32[0];
    a3 -= v4;
  }
  if (a3 >= 0x40)
  {
    do
    {
      v7 = *a1++;
      v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      v3 += v8.u32[0];
      a3 -= 64;
    }
    while (a3 > 0x3F);
  }
  if (a3)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)a1 & (0xFFFFFFFFFFFFFFFFLL >> -(char)a3)));
    v9.i16[0] = vaddlv_u8(v9);
    v3 += v9.u32[0];
  }
  return v3;
}

uint64_t std::__count_BOOL[abi:ne180100]<false,std::__bitset<1ul,8ul>,true>(uint64_t *a1, unsigned int a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint8x8_t v6;
  uint64_t v7;
  uint8x8_t v8;
  uint8x8_t v9;

  v3 = a2;
  if (a2)
  {
    if (64 - a2 >= a3)
      v4 = a3;
    else
      v4 = 64 - a2;
    v5 = *a1++;
    v6 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v4)) & (-1 << a2) & ~v5));
    v6.i16[0] = vaddlv_u8(v6);
    v3 = v6.u32[0];
    a3 -= v4;
  }
  if (a3 >= 0x40)
  {
    do
    {
      v7 = *a1++;
      v8 = (uint8x8_t)vcnt_s8((int8x8_t)~v7);
      v8.i16[0] = vaddlv_u8(v8);
      v3 += v8.u32[0];
      a3 -= 64;
    }
    while (a3 > 0x3F);
  }
  if (a3)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> -(char)a3) & ~*a1));
    v9.i16[0] = vaddlv_u8(v9);
    v3 += v9.u32[0];
  }
  return v3;
}

uint64_t std::bitset<1ul>::operator<<=[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  _BYTE v5[16];
  uint64_t v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;

  v3 = a2 != 0;
  if (a2)
  {
    v10 = a1;
    v11 = 0;
    v8 = a1;
    v9 = a2 == 0;
    v6 = a1;
    v7 = 1;
    std::__copy_backward_unaligned[abi:ne180100]<std::__bitset<1ul,8ul>,false>((unint64_t)&v10, (uint64_t)&v8, (uint64_t)&v6, (uint64_t)v5);
    v16 = a1;
    v17 = 0;
    std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v16, v3);
  }
  else
  {
    v16 = a1;
    v17 = 0;
    v14 = a1;
    v15 = 1;
    v12 = a1;
    v13 = 1;
    std::__copy_backward_aligned[abi:ne180100]<std::__bitset<1ul,8ul>,false>((unsigned int *)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)v5);
  }
  return a1;
}

uint64_t scandium::Processor::convert_algs_analytics@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  int v6;
  int v7;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double v14;
  float v15;

  *(_OWORD *)(a3 + 244) = 0u;
  *(_OWORD *)(a3 + 228) = 0u;
  *(_OWORD *)(a3 + 212) = 0u;
  *(_OWORD *)(a3 + 196) = 0u;
  *(_OWORD *)(a3 + 180) = 0u;
  *(_OWORD *)(a3 + 164) = 0u;
  *(_OWORD *)(a3 + 148) = 0u;
  *(_OWORD *)(a3 + 132) = 0u;
  *(_OWORD *)(a3 + 116) = 0u;
  *(_OWORD *)(a3 + 100) = 0u;
  *(_OWORD *)(a3 + 84) = 0u;
  *(_OWORD *)(a3 + 52) = 0u;
  *(_OWORD *)(a3 + 68) = 0u;
  *(_OWORD *)(a3 + 420) = 0u;
  *(_OWORD *)(a3 + 436) = 0u;
  *(_OWORD *)(a3 + 388) = 0u;
  *(_OWORD *)(a3 + 404) = 0u;
  *(_OWORD *)(a3 + 356) = 0u;
  *(_OWORD *)(a3 + 372) = 0u;
  *(_OWORD *)(a3 + 324) = 0u;
  *(_OWORD *)(a3 + 340) = 0u;
  *(_OWORD *)(a3 + 292) = 0u;
  *(_OWORD *)(a3 + 308) = 0u;
  *(_OWORD *)(a3 + 260) = 0u;
  *(_OWORD *)(a3 + 276) = 0u;
  v3 = *(_OWORD *)(result + 16);
  *(_OWORD *)a3 = *(_OWORD *)result;
  *(_OWORD *)(a3 + 16) = v3;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(result + 32);
  *(_QWORD *)(a3 + 56) = *(_QWORD *)(result + 56);
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + 68);
  *(_OWORD *)(a3 + 88) = *(_OWORD *)(result + 76);
  LODWORD(v3) = *(_DWORD *)(result + 96);
  *(_DWORD *)(a3 + 104) = *(_DWORD *)(result + 92);
  *(_DWORD *)(a3 + 112) = v3;
  v4 = *(_OWORD *)(result + 100);
  *((_QWORD *)&v4 + 1) = *(_QWORD *)(result + 196);
  *(_OWORD *)(a3 + 116) = v4;
  LODWORD(v3) = *(_DWORD *)(result + 208);
  *(_DWORD *)(a3 + 132) = *(_DWORD *)(result + 204);
  *(_OWORD *)(a3 + 136) = *(_OWORD *)(result + 108);
  *(_DWORD *)(a3 + 152) = *(_DWORD *)(result + 124);
  *(_OWORD *)(a3 + 156) = *(_OWORD *)(result + 136);
  *(_OWORD *)(a3 + 216) = *(_OWORD *)(result + 212);
  *(_OWORD *)(a3 + 232) = *(_OWORD *)(result + 228);
  v5 = *(_OWORD *)(result + 176);
  *(_OWORD *)(a3 + 248) = *(_OWORD *)(result + 160);
  *(_DWORD *)(a3 + 452) = 0;
  *(_BYTE *)(a3 + 108) = *(_BYTE *)(a2 + 14);
  *(_WORD *)(a3 + 48) = *(_WORD *)(result + 48);
  *(_BYTE *)(a3 + 50) = *(_BYTE *)(result + 50);
  *(_WORD *)(a3 + 51) = *(_WORD *)(result + 51);
  *(_DWORD *)(a3 + 64) = *(_DWORD *)(result + 64);
  *(_WORD *)(a3 + 172) = *(_WORD *)(result + 152);
  *(_DWORD *)(a3 + 174) = *(_DWORD *)(result + 154);
  *(_BYTE *)(a3 + 178) = *(_BYTE *)(result + 436);
  *(_WORD *)(a3 + 180) = *(_WORD *)(result + 438);
  v6 = *(_DWORD *)(result + 268);
  v7 = *(_DWORD *)(result + 248);
  *(_DWORD *)(a3 + 184) = *(_DWORD *)(result + 244);
  *(_DWORD *)(a3 + 188) = v6;
  v8 = *(_DWORD *)(result + 256);
  *(_DWORD *)(a3 + 192) = *(_DWORD *)(result + 252);
  *(_DWORD *)(a3 + 196) = *(_DWORD *)(result + 260);
  *(_DWORD *)(a3 + 200) = v7;
  *(_DWORD *)(a3 + 204) = *(_DWORD *)(result + 272);
  *(_DWORD *)(a3 + 208) = v8;
  *(_DWORD *)(a3 + 212) = *(_DWORD *)(result + 264);
  *(_OWORD *)(a3 + 264) = v5;
  *(_DWORD *)(a3 + 280) = *(_DWORD *)(result + 192);
  *(_QWORD *)(a3 + 284) = *(_QWORD *)(result + 128);
  *(_DWORD *)(a3 + 292) = v3;
  v9 = *(_OWORD *)(result + 292);
  *(_OWORD *)(a3 + 296) = *(_OWORD *)(result + 276);
  *(_OWORD *)(a3 + 312) = v9;
  v10 = *(_OWORD *)(result + 324);
  *(_OWORD *)(a3 + 328) = *(_OWORD *)(result + 308);
  *(_OWORD *)(a3 + 344) = v10;
  v11 = *(_OWORD *)(result + 356);
  *(_OWORD *)(a3 + 360) = *(_OWORD *)(result + 340);
  *(_OWORD *)(a3 + 376) = v11;
  v12 = *(_OWORD *)(result + 388);
  *(_OWORD *)(a3 + 392) = *(_OWORD *)(result + 372);
  *(_OWORD *)(a3 + 408) = v12;
  v13 = *(_OWORD *)(result + 420);
  *(_OWORD *)(a3 + 424) = *(_OWORD *)(result + 404);
  *(_OWORD *)(a3 + 440) = v13;
  if (*(_WORD *)(a2 + 12))
  {
    v14 = (double)*(uint64_t *)a2 * 0.0078125 / (double)*(unsigned __int16 *)(a2 + 12);
    if (!*(_BYTE *)(a3 + 76))
      *(_BYTE *)(a3 + 76) = 1;
    v15 = v14;
    *(float *)(a3 + 72) = v15;
  }
  *(_DWORD *)(a3 + 68) = *(_DWORD *)(a2 + 8);
  return result;
}

uint64_t scandium::Processor::Processor(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id ***v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  void *exception;
  _QWORD v67[3];
  _QWORD *v68;
  uint64_t v69;
  _QWORD v70[3];
  _QWORD *v71;
  uint64_t v72;
  _QWORD v73[3];
  _QWORD *v74;
  uint64_t v75;
  _QWORD v76[3];
  _QWORD *v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _OWORD v85[2];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[24];
  _BYTE *v94;
  uint64_t v95;
  _BYTE v96[24];
  _BYTE *v97;
  _BYTE v98[24];
  _BYTE *v99;
  uint64_t v100;
  _BYTE v101[24];
  _BYTE *v102;
  _BYTE v103[24];
  _BYTE *v104;
  uint64_t v105;
  _BYTE v106[24];
  _BYTE *v107;
  _BYTE v108[24];
  _BYTE *v109;
  uint64_t v110;
  _BYTE v111[24];
  _BYTE *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[19];
  int v120;
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a1 = 0;
  v9 = *((unsigned int *)a2 + 29);
  if ((_DWORD)v9 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  *(_QWORD *)&v113 = &v79;
  *(_WORD *)(a1 + 8) = ((uint64_t (*)(__int128 *))off_25169D628[v9])(&v113);
  v17 = *((unsigned int *)a2 + 29);
  if ((_DWORD)v17 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  *(_QWORD *)&v113 = &v79;
  *(_BYTE *)(a1 + 10) = ((uint64_t (*)(__int128 *, __int128 *))off_25169D638[v17])(&v113, a2);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 23) = 0;
  if (!*(_WORD *)(a1 + 8))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24953BD90](exception, "start packet indicated a zero-length session");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v18 = *((_DWORD *)a2 + 29);
  if (v18)
  {
    if (v18 != 1)
      std::__throw_bad_variant_access[abi:ne180100]();
    v19 = a2[5];
    v83 = a2[4];
    v84 = v19;
    v85[0] = a2[6];
    *(_DWORD *)((char *)v85 + 15) = *(_DWORD *)((char *)a2 + 111);
    v20 = a2[1];
    v79 = *a2;
    v80 = v20;
    v21 = a2[3];
    v81 = a2[2];
    v82 = v21;
  }
  else
  {
    v22 = a2[5];
    v90 = a2[4];
    v91 = v22;
    v92 = a2[6];
    v23 = a2[1];
    v86 = *a2;
    v87 = v23;
    v24 = a2[3];
    v88 = a2[2];
    v89 = v24;
  }
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)v76, a3);
  v78 = a1;
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)v73, a4);
  v75 = a1;
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)v70, a5);
  v72 = a1;
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)v67, a6);
  v69 = a1;
  if (v18)
  {
    v25 = (id ***)operator new();
    v117 = v83;
    v118 = v84;
    *(_OWORD *)v119 = v85[0];
    *(_DWORD *)&v119[15] = *(_DWORD *)((char *)v85 + 15);
    v113 = v79;
    v114 = v80;
    v115 = v81;
    v116 = v82;
    v120 = 1;
    v26 = (uint64_t)v77;
    if (v77)
    {
      if (v77 == v76)
      {
        v109 = v108;
        (*(void (**)(_QWORD *, _BYTE *))(v76[0] + 24))(v76, v108);
LABEL_18:
        v110 = v78;
        v112 = 0;
        v28 = operator new(0x30uLL);
        *v28 = &off_25169D658;
        std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::__value_func[abi:ne180100]((uint64_t)(v28 + 1), (uint64_t)v108);
        v28[5] = v110;
        v112 = v28;
        v29 = (uint64_t)v74;
        if (v74)
        {
          if (v74 == v73)
          {
            v104 = v103;
            (*(void (**)(_QWORD *, _BYTE *))(v73[0] + 24))(v73, v103);
LABEL_23:
            v105 = v75;
            v107 = 0;
            v30 = operator new(0x30uLL);
            *v30 = &off_25169D6E8;
            std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::__value_func[abi:ne180100]((uint64_t)(v30 + 1), (uint64_t)v103);
            v30[5] = v105;
            v107 = v30;
            v31 = (uint64_t)v71;
            if (v71)
            {
              if (v71 == v70)
              {
                v99 = v98;
                (*(void (**)(_QWORD *, _BYTE *))(v70[0] + 24))(v70, v98);
                goto LABEL_28;
              }
              v31 = (*(uint64_t (**)(void))(*v71 + 16))();
            }
            v99 = (_BYTE *)v31;
LABEL_28:
            v100 = v72;
            v102 = 0;
            v32 = operator new(0x30uLL);
            *v32 = &off_25169D778;
            std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100]((uint64_t)(v32 + 1), (uint64_t)v98);
            v32[5] = v100;
            v102 = v32;
            v33 = (uint64_t)v68;
            if (!v68)
            {
LABEL_31:
              v94 = (_BYTE *)v33;
              goto LABEL_49;
            }
            if (v68 != v67)
            {
              v33 = (*(uint64_t (**)(void))(*v68 + 16))();
              goto LABEL_31;
            }
            goto LABEL_48;
          }
          v29 = (*(uint64_t (**)(void))(*v74 + 16))();
        }
        v104 = (_BYTE *)v29;
        goto LABEL_23;
      }
      v26 = (*(uint64_t (**)(void))(*v77 + 16))();
    }
    v109 = (_BYTE *)v26;
    goto LABEL_18;
  }
  v25 = (id ***)operator new();
  v117 = v90;
  v118 = v91;
  *(_OWORD *)v119 = v92;
  v113 = v86;
  v114 = v87;
  v115 = v88;
  v116 = v89;
  v120 = 0;
  v27 = (uint64_t)v77;
  if (!v77)
    goto LABEL_16;
  if (v77 != v76)
  {
    v27 = (*(uint64_t (**)(void))(*v77 + 16))();
LABEL_16:
    v109 = (_BYTE *)v27;
    goto LABEL_34;
  }
  v109 = v108;
  (*(void (**)(_QWORD *, _BYTE *))(v76[0] + 24))(v76, v108);
LABEL_34:
  v110 = v78;
  v112 = 0;
  v34 = operator new(0x30uLL);
  *v34 = &off_25169D658;
  std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::__value_func[abi:ne180100]((uint64_t)(v34 + 1), (uint64_t)v108);
  v34[5] = v110;
  v112 = v34;
  v35 = (uint64_t)v74;
  if (!v74)
  {
LABEL_37:
    v104 = (_BYTE *)v35;
    goto LABEL_39;
  }
  if (v74 != v73)
  {
    v35 = (*(uint64_t (**)(void))(*v74 + 16))();
    goto LABEL_37;
  }
  v104 = v103;
  (*(void (**)(_QWORD *, _BYTE *))(v73[0] + 24))(v73, v103);
LABEL_39:
  v105 = v75;
  v107 = 0;
  v36 = operator new(0x30uLL);
  *v36 = &off_25169D6E8;
  std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::__value_func[abi:ne180100]((uint64_t)(v36 + 1), (uint64_t)v103);
  v36[5] = v105;
  v107 = v36;
  v37 = (uint64_t)v71;
  if (!v71)
  {
LABEL_42:
    v99 = (_BYTE *)v37;
    goto LABEL_44;
  }
  if (v71 != v70)
  {
    v37 = (*(uint64_t (**)(void))(*v71 + 16))();
    goto LABEL_42;
  }
  v99 = v98;
  (*(void (**)(_QWORD *, _BYTE *))(v70[0] + 24))(v70, v98);
LABEL_44:
  v100 = v72;
  v102 = 0;
  v38 = operator new(0x30uLL);
  *v38 = &off_25169D778;
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100]((uint64_t)(v38 + 1), (uint64_t)v98);
  v38[5] = v100;
  v102 = v38;
  v39 = (uint64_t)v68;
  if (!v68)
  {
LABEL_47:
    v94 = (_BYTE *)v39;
    goto LABEL_49;
  }
  if (v68 != v67)
  {
    v39 = (*(uint64_t (**)(void))(*v68 + 16))();
    goto LABEL_47;
  }
LABEL_48:
  v94 = v93;
  (*(void (**)(_QWORD *, _BYTE *))(v67[0] + 24))(v67, v93);
LABEL_49:
  v95 = v69;
  v97 = 0;
  v40 = operator new(0x30uLL);
  *v40 = &off_25169D7F8;
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100]((uint64_t)(v40 + 1), (uint64_t)v93);
  v40[5] = v95;
  v97 = v40;
  Scandium::ScandiumPPG::scandium_spo2_monitor_t::scandium_spo2_monitor_t(v25, a8, &v113, v111, v106, v101, v96, a7);
  v41 = v97;
  if (v97 == v96)
  {
    v42 = 4;
    v41 = v96;
  }
  else
  {
    if (!v97)
      goto LABEL_54;
    v42 = 5;
  }
  (*(void (**)(void))(*v41 + 8 * v42))();
LABEL_54:
  v43 = v94;
  if (v94 == v93)
  {
    v44 = 4;
    v43 = v93;
  }
  else
  {
    if (!v94)
      goto LABEL_59;
    v44 = 5;
  }
  (*(void (**)(void))(*v43 + 8 * v44))();
LABEL_59:
  v45 = v102;
  if (v102 == v101)
  {
    v46 = 4;
    v45 = v101;
  }
  else
  {
    if (!v102)
      goto LABEL_64;
    v46 = 5;
  }
  (*(void (**)(void))(*v45 + 8 * v46))();
LABEL_64:
  v47 = v99;
  if (v99 == v98)
  {
    v48 = 4;
    v47 = v98;
  }
  else
  {
    if (!v99)
      goto LABEL_69;
    v48 = 5;
  }
  (*(void (**)(void))(*v47 + 8 * v48))();
LABEL_69:
  v49 = v107;
  if (v107 == v106)
  {
    v50 = 4;
    v49 = v106;
  }
  else
  {
    if (!v107)
      goto LABEL_74;
    v50 = 5;
  }
  (*(void (**)(void))(*v49 + 8 * v50))();
LABEL_74:
  v51 = v104;
  if (v104 == v103)
  {
    v52 = 4;
    v51 = v103;
  }
  else
  {
    if (!v104)
      goto LABEL_79;
    v52 = 5;
  }
  (*(void (**)(void))(*v51 + 8 * v52))();
LABEL_79:
  v53 = v112;
  if (v112 == v111)
  {
    v54 = 4;
    v53 = v111;
  }
  else
  {
    if (!v112)
      goto LABEL_84;
    v54 = 5;
  }
  (*(void (**)(void))(*v53 + 8 * v54))();
LABEL_84:
  v55 = v109;
  if (v109 == v108)
  {
    v56 = 4;
    v55 = v108;
  }
  else
  {
    if (!v109)
      goto LABEL_89;
    v56 = 5;
  }
  (*(void (**)(void))(*v55 + 8 * v56))();
LABEL_89:
  std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100]((id ****)a1, v25);
  v57 = v68;
  if (v68 == v67)
  {
    v58 = 4;
    v57 = v67;
  }
  else
  {
    if (!v68)
      goto LABEL_94;
    v58 = 5;
  }
  (*(void (**)(void))(*v57 + 8 * v58))();
LABEL_94:
  v59 = v71;
  if (v71 == v70)
  {
    v60 = 4;
    v59 = v70;
  }
  else
  {
    if (!v71)
      goto LABEL_99;
    v60 = 5;
  }
  (*(void (**)(void))(*v59 + 8 * v60))();
LABEL_99:
  v61 = v74;
  if (v74 == v73)
  {
    v62 = 4;
    v61 = v73;
  }
  else
  {
    if (!v74)
      goto LABEL_104;
    v62 = 5;
  }
  (*(void (**)(void))(*v61 + 8 * v62))();
LABEL_104:
  v63 = v77;
  if (v77 == v76)
  {
    v64 = 4;
    v63 = v76;
    goto LABEL_108;
  }
  if (v77)
  {
    v64 = 5;
LABEL_108:
    (*(void (**)(void))(*v63 + 8 * v64))();
  }
  return a1;
}

void sub_24581ED80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t *a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,char *a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,char *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a68;
  char *a71;
  id ****v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  unint64_t *v79;
  uint64_t v80;
  unint64_t *v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  unint64_t *v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;

  v75 = (unint64_t *)STACK[0x218];
  if ((unint64_t *)STACK[0x218] == &STACK[0x200])
  {
    v76 = 4;
    v75 = &STACK[0x200];
  }
  else
  {
    if (!v75)
      goto LABEL_6;
    v76 = 5;
  }
  (*(void (**)(void))(*v75 + 8 * v76))();
LABEL_6:
  v77 = a71;
  if (a71 == &a68)
  {
    v78 = 4;
    v77 = &a68;
  }
  else
  {
    if (!a71)
      goto LABEL_11;
    v78 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v77 + 8 * v78))();
LABEL_11:
  v79 = (unint64_t *)STACK[0x260];
  if ((unint64_t *)STACK[0x260] == &STACK[0x248])
  {
    v80 = 4;
    v79 = &STACK[0x248];
  }
  else
  {
    if (!v79)
      goto LABEL_16;
    v80 = 5;
  }
  (*(void (**)(void))(*v79 + 8 * v80))();
LABEL_16:
  v81 = (unint64_t *)STACK[0x238];
  if ((unint64_t *)STACK[0x238] == &STACK[0x220])
  {
    v82 = 4;
    v81 = &STACK[0x220];
  }
  else
  {
    if (!v81)
      goto LABEL_21;
    v82 = 5;
  }
  (*(void (**)(void))(*v81 + 8 * v82))();
LABEL_21:
  v83 = *(_QWORD **)(v73 - 232);
  if (v83 == (_QWORD *)(v73 - 256))
  {
    v84 = 4;
    v83 = (_QWORD *)(v73 - 256);
  }
  else
  {
    if (!v83)
      goto LABEL_26;
    v84 = 5;
  }
  (*(void (**)(void))(*v83 + 8 * v84))();
LABEL_26:
  v85 = (unint64_t *)STACK[0x280];
  if ((unint64_t *)STACK[0x280] == &STACK[0x268])
  {
    v86 = 4;
    v85 = &STACK[0x268];
  }
  else
  {
    if (!v85)
      goto LABEL_31;
    v86 = 5;
  }
  (*(void (**)(void))(*v85 + 8 * v86))();
LABEL_31:
  MEMORY[0x24953BE38](v72, 0x20C4093837F09);
  v87 = a12;
  if (a12 == &a9)
  {
    v88 = 4;
    v87 = &a9;
  }
  else
  {
    if (!a12)
      goto LABEL_36;
    v88 = 5;
  }
  (*(void (**)(void))(*v87 + 8 * v88))();
LABEL_36:
  v89 = a17;
  if (a17 == &a14)
  {
    v90 = 4;
    v89 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_41;
    v90 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v89 + 8 * v90))();
LABEL_41:
  v91 = a22;
  if (a22 == &a19)
  {
    v92 = 4;
    v91 = &a19;
  }
  else
  {
    if (!a22)
      goto LABEL_46;
    v92 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v91 + 8 * v92))();
LABEL_46:
  v93 = a27;
  if (a27 == &a24)
  {
    v94 = 4;
    v93 = &a24;
  }
  else
  {
    if (!a27)
      goto LABEL_51;
    v94 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v93 + 8 * v94))();
LABEL_51:
  std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](v71, 0);
  _Unwind_Resume(a1);
}

void scandium::Processor::~Processor(id ****this)
{
  std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0);
}

{
  std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0);
}

void scandium::Processor::process(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[14];
  _OWORD v10[2];

  v2 = *(_OWORD *)(a2 + 208);
  v9[12] = *(_OWORD *)(a2 + 192);
  v9[13] = v2;
  v10[0] = *(_OWORD *)(a2 + 224);
  *(_QWORD *)((char *)v10 + 15) = *(_QWORD *)(a2 + 239);
  v3 = *(_OWORD *)(a2 + 144);
  v9[8] = *(_OWORD *)(a2 + 128);
  v9[9] = v3;
  v4 = *(_OWORD *)(a2 + 176);
  v9[10] = *(_OWORD *)(a2 + 160);
  v9[11] = v4;
  v5 = *(_OWORD *)(a2 + 80);
  v9[4] = *(_OWORD *)(a2 + 64);
  v9[5] = v5;
  v6 = *(_OWORD *)(a2 + 112);
  v9[6] = *(_OWORD *)(a2 + 96);
  v9[7] = v6;
  v7 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v7;
  v8 = *(_OWORD *)(a2 + 48);
  v9[2] = *(_OWORD *)(a2 + 32);
  v9[3] = v8;
  ++*(_WORD *)(a1 + 28);
  *(_QWORD *)(a1 + 16) += *(int *)(a2 + 243);
  Scandium::ScandiumPPG::scandium_spo2_monitor_t::scandium_spo2_monitor_process(*(Scandium::ScandiumPPG::scandium_spo2_processor_t ***)a1, (uint64_t)v9);
}

uint64_t scandium::Processor::max_packet_count(scandium::Processor *this)
{
  return *((unsigned __int16 *)this + 4);
}

uint64_t scandium::Processor::background(scandium::Processor *this)
{
  return *((unsigned __int8 *)this + 10);
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&>(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int16 *)(a2 + 11);
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&>(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int16 *)(a2 + 11);
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&>(uint64_t a1, uint64_t a2)
{
  return *(_BYTE *)(a2 + 13) == 2;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&>(uint64_t a1, uint64_t a2)
{
  return *(_BYTE *)(a2 + 13) == 2;
}

id ***std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](id ****a1, id ***a2)
{
  id ***result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    Scandium::ScandiumPPG::scandium_spo2_monitor_t::~scandium_spo2_monitor_t(result);
    JUMPOUT(0x24953BE38);
  }
  return result;
}

_QWORD *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_25169D658;
  v2 = a1 + 1;
  v3 = (_QWORD *)a1[4];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::~__func(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_25169D658;
  v1 = a1 + 1;
  v2 = (_QWORD *)a1[4];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x24953BE38);
}

_QWORD *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::__clone(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = a1 + 8;
  v3 = operator new(0x30uLL);
  *v3 = &off_25169D658;
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)(v3 + 1), v2);
  v3[5] = *(_QWORD *)(a1 + 40);
  return v3;
}

void sub_24581F318(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  *a2 = &off_25169D658;
  result = std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
  a2[5] = *(_QWORD *)(a1 + 40);
  return result;
}

_QWORD *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::destroy(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 8);
  result = *(_QWORD **)(a1 + 32);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::destroy_deallocate(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 8;
  v3 = (char *)*((_QWORD *)__p + 4);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::operator()(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  double v6;
  float v7;
  uint64_t v8;
  _OWORD v9[3];
  __int16 v10;
  char v11;
  _BYTE v12[5];
  uint64_t v13;
  int v14;
  _BYTE v15[20];
  _BYTE v16[28];
  __int128 v17;
  int v18;
  __int128 v19;
  int v20;
  _BYTE v21[24];
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  __int128 v31;
  _OWORD v32[3];
  int v33;
  uint64_t v34;
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD v46[3];
  __int16 v47;
  char v48;
  __int16 v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  __int128 v53;
  int v54;
  int v55;
  uint64_t v56;
  __int128 v57;
  int v58;
  uint64_t v59;
  __int128 v60;
  __int16 v61;
  int v62;
  __int128 v63;
  __int128 v64;
  int v65;
  uint64_t v66;
  int v67;
  int v68;
  __int128 v69;
  __int128 v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  char v89;
  unsigned __int16 v90;
  uint64_t v91;

  if (*(_QWORD *)(result + 32))
  {
    v2 = result;
    v3 = *a2;
    v4 = *(_QWORD *)(result + 40);
    Scandium::ScandiumPPG::scandium_spo2_monitor_t::get_core_analytics(*(Scandium::ScandiumPPG::scandium_spo2_monitor_t **)v4, v46);
    *(_BYTE *)(v4 + 30) = 1;
    *(_OWORD *)&v21[8] = 0u;
    *(_OWORD *)&v16[12] = 0u;
    *(_OWORD *)v15 = 0u;
    *(_DWORD *)&v12[1] = 0;
    v9[0] = v46[0];
    v9[1] = v46[1];
    v9[2] = v46[2];
    v13 = v50;
    *(_QWORD *)&v15[12] = v52;
    *(_OWORD *)v16 = v53;
    *(_DWORD *)&v16[16] = v54;
    *(_QWORD *)&v5 = v56;
    *((_QWORD *)&v5 + 1) = v66;
    *(_DWORD *)&v16[24] = v55;
    v17 = v5;
    v19 = v57;
    v18 = v67;
    v20 = v58;
    *(_OWORD *)v21 = v60;
    v31 = v69;
    v32[0] = v70;
    v32[1] = v63;
    v16[20] = 1;
    v10 = v47;
    v11 = v48;
    *(_WORD *)v12 = v49;
    v14 = v51;
    *(_WORD *)&v21[16] = v61;
    *(_DWORD *)&v21[18] = v62;
    v21[22] = v89;
    v22 = v90;
    v23 = v71;
    v24 = v77;
    v25 = v73;
    v26 = v75;
    v27 = v72;
    v28 = v78;
    v29 = v74;
    v30 = v76;
    v32[2] = v64;
    v33 = v65;
    v34 = v59;
    v35 = v68;
    v36 = v79;
    v37 = v80;
    v38 = v81;
    v39 = v82;
    v40 = v83;
    v41 = v84;
    v42 = v85;
    v43 = v86;
    v44 = v87;
    v45 = v88;
    if (*(_WORD *)(v4 + 28))
    {
      v6 = (double)*(uint64_t *)(v4 + 16) * 0.0078125 / (double)*(unsigned __int16 *)(v4 + 28);
      if (!v15[8])
        v15[8] = 1;
      v7 = v6;
      *(float *)&v15[4] = v7;
    }
    *(_DWORD *)v15 = *(_DWORD *)(v4 + 24);
    v91 = v3;
    v8 = *(_QWORD *)(v2 + 32);
    if (!v8)
      std::__throw_bad_function_call[abi:ne180100]();
    return (*(uint64_t (**)(uint64_t, uint64_t *, _OWORD *))(*(_QWORD *)v8 + 48))(v8, &v91, v9);
  }
  return result;
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::target_type()
{
}

uint64_t std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(_QWORD *)(a1 + 24) = v4;
  }
  else
  {
    v3 = (_QWORD *)(a1 + 24);
  }
  *v3 = 0;
  return a1;
}

_QWORD *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_25169D6E8;
  v2 = a1 + 1;
  v3 = (_QWORD *)a1[4];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::~__func(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_25169D6E8;
  v1 = a1 + 1;
  v2 = (_QWORD *)a1[4];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x24953BE38);
}

_QWORD *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::__clone(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = a1 + 8;
  v3 = operator new(0x30uLL);
  *v3 = &off_25169D6E8;
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)(v3 + 1), v2);
  v3[5] = *(_QWORD *)(a1 + 40);
  return v3;
}

void sub_24581F828(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  *a2 = &off_25169D6E8;
  result = std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
  a2[5] = *(_QWORD *)(a1 + 40);
  return result;
}

_QWORD *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::destroy(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 8);
  result = *(_QWORD **)(a1 + 32);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::destroy_deallocate(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 8;
  v3 = (char *)*((_QWORD *)__p + 4);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::operator()(uint64_t result, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  BOOL v5;
  __int128 v6;
  double v7;
  float v8;
  uint64_t v9;
  _OWORD v10[3];
  __int16 v11;
  char v12;
  _BYTE v13[5];
  uint64_t v14;
  int v15;
  _BYTE v16[20];
  _BYTE v17[28];
  __int128 v18;
  int v19;
  __int128 v20;
  int v21;
  _BYTE v22[24];
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  __int128 v32;
  _OWORD v33[3];
  int v34;
  uint64_t v35;
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _OWORD v47[3];
  __int16 v48;
  char v49;
  __int16 v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  __int128 v54;
  int v55;
  int v56;
  uint64_t v57;
  __int128 v58;
  int v59;
  uint64_t v60;
  __int128 v61;
  __int16 v62;
  int v63;
  __int128 v64;
  __int128 v65;
  int v66;
  uint64_t v67;
  int v68;
  int v69;
  __int128 v70;
  __int128 v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  char v90;
  unsigned __int16 v91;
  char v92;

  if (*(_QWORD *)(result + 32))
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 40);
    if (*a2 - 1 >= 0xA)
      v4 = 0;
    else
      v4 = *a2;
    Scandium::ScandiumPPG::scandium_spo2_monitor_t::get_core_analytics(*(Scandium::ScandiumPPG::scandium_spo2_monitor_t **)v3, v47);
    v5 = *(unsigned __int16 *)(v3 + 28) == *(unsigned __int16 *)(v3 + 8);
    *(_BYTE *)(v3 + 30) = v5;
    *(_OWORD *)&v22[8] = 0u;
    *(_OWORD *)&v17[12] = 0u;
    *(_OWORD *)v16 = 0u;
    *(_DWORD *)&v13[1] = 0;
    v10[0] = v47[0];
    v10[1] = v47[1];
    v10[2] = v47[2];
    v14 = v51;
    *(_QWORD *)&v16[12] = v53;
    *(_OWORD *)v17 = v54;
    *(_DWORD *)&v17[16] = v55;
    *(_QWORD *)&v6 = v57;
    *((_QWORD *)&v6 + 1) = v67;
    *(_DWORD *)&v17[24] = v56;
    v18 = v6;
    v20 = v58;
    v19 = v68;
    v21 = v59;
    *(_OWORD *)v22 = v61;
    v32 = v70;
    v33[0] = v71;
    v33[1] = v64;
    v17[20] = v5;
    v11 = v48;
    v12 = v49;
    *(_WORD *)v13 = v50;
    v15 = v52;
    *(_WORD *)&v22[16] = v62;
    *(_DWORD *)&v22[18] = v63;
    v22[22] = v90;
    v23 = v91;
    v24 = v72;
    v25 = v78;
    v26 = v74;
    v27 = v76;
    v28 = v73;
    v29 = v79;
    v30 = v75;
    v31 = v77;
    v33[2] = v65;
    v34 = v66;
    v35 = v60;
    v36 = v69;
    v37 = v80;
    v38 = v81;
    v39 = v82;
    v40 = v83;
    v41 = v84;
    v42 = v85;
    v43 = v86;
    v44 = v87;
    v45 = v88;
    v46 = v89;
    if (*(_WORD *)(v3 + 28))
    {
      v7 = (double)*(uint64_t *)(v3 + 16) * 0.0078125 / (double)*(unsigned __int16 *)(v3 + 28);
      if (!v16[8])
        v16[8] = 1;
      v8 = v7;
      *(float *)&v16[4] = v8;
    }
    *(_DWORD *)v16 = *(_DWORD *)(v3 + 24);
    v92 = v4;
    v9 = *(_QWORD *)(v2 + 32);
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    return (*(uint64_t (**)(uint64_t, char *, _OWORD *))(*(_QWORD *)v9 + 48))(v9, &v92, v10);
  }
  return result;
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::target_type()
{
}

uint64_t std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(_QWORD *)(a1 + 24) = v4;
  }
  else
  {
    v3 = (_QWORD *)(a1 + 24);
  }
  *v3 = 0;
  return a1;
}

_QWORD *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_25169D778;
  v2 = a1 + 1;
  v3 = (_QWORD *)a1[4];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::~__func(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_25169D778;
  v1 = a1 + 1;
  v2 = (_QWORD *)a1[4];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x24953BE38);
}

_QWORD *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::__clone(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = a1 + 8;
  v3 = operator new(0x30uLL);
  *v3 = &off_25169D778;
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)(v3 + 1), v2);
  v3[5] = *(_QWORD *)(a1 + 40);
  return v3;
}

void sub_24581FD48(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  *a2 = &off_25169D778;
  result = std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
  a2[5] = *(_QWORD *)(a1 + 40);
  return result;
}

_QWORD *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::destroy(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 8);
  result = *(_QWORD **)(a1 + 32);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::destroy_deallocate(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 8;
  v3 = (char *)*((_QWORD *)__p + 4);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::operator()(uint64_t a1, char *a2)
{
  char v2;
  uint64_t v3;
  char v5;

  v2 = *a2;
  if (*a2)
    ++*(_WORD *)(*(_QWORD *)(a1 + 40) + 24);
  v5 = v2;
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)v3 + 48))(v3, &v5);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::target_type()
{
}

uint64_t std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(_QWORD *)(a1 + 24) = v4;
  }
  else
  {
    v3 = (_QWORD *)(a1 + 24);
  }
  *v3 = 0;
  return a1;
}

_QWORD *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_25169D7F8;
  v2 = a1 + 1;
  v3 = (_QWORD *)a1[4];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::~__func(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_25169D7F8;
  v1 = a1 + 1;
  v2 = (_QWORD *)a1[4];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x24953BE38);
}

_QWORD *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::__clone(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = a1 + 8;
  v3 = operator new(0x30uLL);
  *v3 = &off_25169D7F8;
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)(v3 + 1), v2);
  v3[5] = *(_QWORD *)(a1 + 40);
  return v3;
}

void sub_245820038(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  *a2 = &off_25169D7F8;
  result = std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
  a2[5] = *(_QWORD *)(a1 + 40);
  return result;
}

_QWORD *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::destroy(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 8);
  result = *(_QWORD **)(a1 + 32);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::destroy_deallocate(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 8;
  v3 = (char *)*((_QWORD *)__p + 4);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::operator()(uint64_t a1, char *a2)
{
  char v2;
  uint64_t v3;
  char v5;

  v2 = *a2;
  if (*a2)
    ++*(_WORD *)(*(_QWORD *)(a1 + 40) + 26);
  v5 = v2;
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)v3 + 48))(v3, &v5);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::target_type()
{
}

uint64_t Scandium::ScandiumPPG::scandium_optical_fom_t::scandium_optical_fom_t(uint64_t a1, int a2, unsigned int a3, unsigned int a4)
{
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_DWORD *)(a1 + 40) = 1065353216;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_DWORD *)(a1 + 152) = 1065353216;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_DWORD *)(a1 + 192) = 1065353216;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_DWORD *)(a1 + 232) = 1065353216;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_DWORD *)(a1 + 272) = 1065353216;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_DWORD *)(a1 + 312) = 1065353216;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_DWORD *)(a1 + 352) = 1065353216;
  Scandium::ScandiumPPG::scandium_optical_fom_t::opt_gen_to_hw_fom((Scandium::ScandiumPPG::scandium_optical_fom_t *)a1, a2, a3, a4);
  *(_QWORD *)(a1 + 392) = 0;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  return a1;
}

void sub_24582022C(_Unwind_Exception *a1)
{
  Scandium::ScandiumPPG::scandium_optical_fom_t::hw_fom *v1;

  Scandium::ScandiumPPG::scandium_optical_fom_t::hw_fom::~hw_fom(v1);
  _Unwind_Resume(a1);
}

uint64_t Scandium::ScandiumPPG::scandium_optical_fom_t::opt_gen_to_hw_fom(Scandium::ScandiumPPG::scandium_optical_fom_t *this, int a2, unsigned int a3, unsigned int a4)
{
  __int128 v6;
  __int128 v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19[5];
  uint64_t v20[5];
  uint64_t v21[5];
  uint64_t v22[5];
  uint64_t v23[5];
  uint64_t v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (a2 == 3)
  {
    Scandium::ScandiumPPG::scandium_optical_fom_t::get_s10_params(this, a3, a4, (uint64_t)&v12);
    *(_QWORD *)this = v12;
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 8, v13);
    v9 = v17;
    *((_OWORD *)this + 5) = v16;
    *((_OWORD *)this + 6) = v9;
    *((_QWORD *)this + 14) = v18;
    v10 = v15;
    *((_OWORD *)this + 3) = v14;
    *((_OWORD *)this + 4) = v10;
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 120, v19);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 160, v20);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 200, v21);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 240, v22);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 280, v23);
    v8 = (char *)this + 320;
  }
  else
  {
    if (a2 == 2)
    {
      v12 = 0x3DCCCCCD00000000;
      v39 = xmmword_245827B54;
      v40 = 0x3F4CCCCD00000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v13, (unsigned __int8 *)&v39, 3);
      v14 = xmmword_245827E40;
      v15 = xmmword_245827E50;
      v16 = xmmword_245827E60;
      v17 = xmmword_245827E70;
      v18 = 1065353216;
      v25 = xmmword_245827314;
      v26 = unk_245827324;
      v27 = xmmword_245827334;
      v28 = unk_245827344;
      std::unordered_map<int,float>::unordered_map((uint64_t)v19, (int *)&v25, 8);
      v37 = xmmword_245827BAC;
      v38 = 0x313A3AD300000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v20, (unsigned __int8 *)&v37, 3);
      v35 = xmmword_245827BC4;
      v36 = 0x31335B9B00000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v21, (unsigned __int8 *)&v35, 3);
      v33 = xmmword_245827BDC;
      v34 = 0x428C000000000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v22, (unsigned __int8 *)&v33, 3);
      v31 = xmmword_245827BDC;
      v32 = 0x428C000000000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v23, (unsigned __int8 *)&v31, 3);
      v29 = xmmword_245827BF4;
      v30 = 0x3E4CCCCD00000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v24, (unsigned __int8 *)&v29, 3);
    }
    else
    {
      if (a2 != 1)
        Scandium::ScandiumPPG::scandium_optical_fom_t::opt_gen_to_hw_fom();
      v12 = 0x3DCCCCCD00000000;
      v39 = xmmword_245827B54;
      v40 = 0x3F4CCCCD00000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v13, (unsigned __int8 *)&v39, 3);
      v14 = xmmword_245827E80;
      v15 = xmmword_245827E90;
      v16 = xmmword_245827EA0;
      v17 = xmmword_245827EB0;
      v18 = 1065353216;
      v25 = xmmword_2458272AC;
      v26 = unk_2458272BC;
      v27 = xmmword_2458272CC;
      *(_QWORD *)&v28 = 0x3445FF7C00075300;
      std::unordered_map<int,float>::unordered_map((uint64_t)v19, (int *)&v25, 7);
      v37 = xmmword_2458272E4;
      v38 = 0x3162C63700000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v20, (unsigned __int8 *)&v37, 3);
      v35 = xmmword_2458272FC;
      v36 = 0x30A4ED3F00000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v21, (unsigned __int8 *)&v35, 3);
      v33 = xmmword_245827BDC;
      v34 = 0x428C000000000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v22, (unsigned __int8 *)&v33, 3);
      v31 = xmmword_245827BDC;
      v32 = 0x428C000000000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v23, (unsigned __int8 *)&v31, 3);
      v29 = xmmword_245827BF4;
      v30 = 0x3E4CCCCD00000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v24, (unsigned __int8 *)&v29, 3);
    }
    *(_QWORD *)this = v12;
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 8, v13);
    v6 = v17;
    *((_OWORD *)this + 5) = v16;
    *((_OWORD *)this + 6) = v6;
    *((_QWORD *)this + 14) = v18;
    v7 = v15;
    *((_OWORD *)this + 3) = v14;
    *((_OWORD *)this + 4) = v7;
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 120, v19);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 160, v20);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 200, v21);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 240, v22);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 280, v23);
    v8 = (char *)this + 320;
  }
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)v8, v24);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v24);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v23);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v22);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v21);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v20);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v19);
  result = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v13);
  *(_DWORD *)this = a2;
  return result;
}

void sub_245820748(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v6);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v5);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v4);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v3);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v2);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_optical_fom_t::hw_fom::~hw_fom(Scandium::ScandiumPPG::scandium_optical_fom_t::hw_fom *this)
{
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 320);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 280);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 240);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 200);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 160);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 120);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 8);
}

uint64_t Scandium::ScandiumPPG::scandium_optical_fom_t::get_s10_params@<X0>(Scandium::ScandiumPPG::scandium_optical_fom_t *this@<X0>, unsigned int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  NSObject *log;
  _BOOL8 v8;
  unsigned __int8 v9;
  uint64_t result;
  int v11;
  float32x2_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint8_t buf[16];
  _OWORD v26[2];
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  log = Scandium::algs_get_log(this);
  v8 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (a2 > 0x2E)
    v9 = -1;
  else
    v9 = a2;
  if (a2 <= 0x2E)
  {
    v11 = v9;
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2457F9000, log, OS_LOG_TYPE_DEFAULT, "Scandium using MDM noise estimation parameters", buf, 2u);
    }
    Scandium::ScandiumPPG::scandium_optical_fom_t::get_mdm_params((Scandium *)v8, v11, buf);
    if (!BYTE8(v27))
      __assert_rtn("get_s10_params", "scandium_optical_fom.cpp", 339, "cur_mdm_param.has_value()");
    *(_QWORD *)a4 = 0x3DCCCCCD00000000;
    v23 = xmmword_245827B54;
    v24 = 0x3F4CCCCD00000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 8, (unsigned __int8 *)&v23, 3);
    *(_OWORD *)(a4 + 48) = xmmword_245827EC0;
    *(_DWORD *)(a4 + 64) = 1067114824;
    v12 = vcvt_f32_f64(vmulq_f64(vmulq_n_f64((float64x2_t)xmmword_245827ED0, 128.0 / (double)a3), (float64x2_t)vdupq_n_s64(0x3FC8FDF3B645A1CBuLL)));
    *(float32x2_t *)(a4 + 68) = v12;
    *(_QWORD *)(a4 + 76) = 0x3F9AE148378637BDLL;
    *(float32x2_t *)(a4 + 84) = v12;
    *(_QWORD *)(a4 + 92) = 0x3F9AE148378637BDLL;
    *(float32x2_t *)(a4 + 100) = v12;
    *(_QWORD *)(a4 + 108) = *(_QWORD *)buf;
    *(_DWORD *)(a4 + 116) = *(_DWORD *)&buf[8];
    std::unordered_map<int,float>::unordered_map(a4 + 120, (uint64_t)v26);
    v21 = xmmword_245827BAC;
    v22 = 0x313A3AD300000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 160, (unsigned __int8 *)&v21, 3);
    v19 = xmmword_245827BC4;
    v20 = 0x31335B9B00000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 200, (unsigned __int8 *)&v19, 3);
    v17 = xmmword_245827BDC;
    v18 = 0x428C000000000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 240, (unsigned __int8 *)&v17, 3);
    v15 = xmmword_245827BDC;
    v16 = 0x428C000000000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 280, (unsigned __int8 *)&v15, 3);
    v13 = xmmword_245827BF4;
    v14 = 0x3E4CCCCD00000002;
    result = std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 320, (unsigned __int8 *)&v13, 3);
    if (BYTE8(v27))
      return std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v26);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2457F9000, log, OS_LOG_TYPE_DEFAULT, "Scandium using DCS noise estimation parameters", buf, 2u);
    }
    *(_QWORD *)a4 = 0x3DCCCCCD00000000;
    v23 = xmmword_245827B54;
    v24 = 0x3F4CCCCD00000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 8, (unsigned __int8 *)&v23, 3);
    *(_OWORD *)(a4 + 48) = xmmword_245827EC0;
    *(_OWORD *)(a4 + 64) = xmmword_245827EE0;
    *(_OWORD *)(a4 + 80) = xmmword_245827EE0;
    *(_OWORD *)(a4 + 96) = xmmword_245827EF0;
    *(_QWORD *)(a4 + 112) = 1065353216;
    *(_OWORD *)buf = xmmword_245827B6C;
    v26[0] = unk_245827B7C;
    v26[1] = xmmword_245827B8C;
    v27 = unk_245827B9C;
    std::unordered_map<int,float>::unordered_map(a4 + 120, (int *)buf, 8);
    v21 = xmmword_245827BAC;
    v22 = 0x313A3AD300000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 160, (unsigned __int8 *)&v21, 3);
    v19 = xmmword_245827BC4;
    v20 = 0x31335B9B00000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 200, (unsigned __int8 *)&v19, 3);
    v17 = xmmword_245827BDC;
    v18 = 0x428C000000000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 240, (unsigned __int8 *)&v17, 3);
    v15 = xmmword_245827BDC;
    v16 = 0x428C000000000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 280, (unsigned __int8 *)&v15, 3);
    v13 = xmmword_245827BF4;
    v14 = 0x3E4CCCCD00000002;
    return std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 320, (unsigned __int8 *)&v13, 3);
  }
  return result;
}

void sub_245820C60(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v6);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v5);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v4);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v3);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v2);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1);
  if (*(_BYTE *)(v7 - 104))
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v7 - 144);
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_optical_fom_t::get_mdm_params(Scandium *a1@<X0>, int a2@<W1>, _BYTE *a3@<X8>)
{
  NSObject *log;
  uint64_t v6;
  int v7;
  _BYTE v8[40];
  uint8_t buf[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *a3 = 0;
  a3[56] = 0;
  switch(a2)
  {
    case 9:
      v6 = 0x3F7E7D5636A7C5ACLL;
      v7 = 16;
      *(_OWORD *)buf = xmmword_245827354;
      v10 = unk_245827364;
      v11 = xmmword_245827374;
      v12 = unk_245827384;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 12:
      v6 = 0x3F7D4FDF36A7C5ACLL;
      v7 = 21;
      *(_OWORD *)buf = xmmword_245827394;
      v10 = unk_2458273A4;
      v11 = xmmword_2458273B4;
      v12 = unk_2458273C4;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 14:
      v6 = 0x3F7C84B636A7C5ACLL;
      v7 = 24;
      *(_OWORD *)buf = xmmword_2458273D4;
      v10 = unk_2458273E4;
      v11 = xmmword_2458273F4;
      v12 = unk_245827404;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 16:
      v6 = 0x3F7BC6A836A7C5ACLL;
      v7 = 27;
      *(_OWORD *)buf = xmmword_245827414;
      v10 = unk_245827424;
      v11 = xmmword_245827434;
      v12 = unk_245827444;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 18:
      v6 = 0x3F7AC71136A7C5ACLL;
      v7 = 30;
      *(_OWORD *)buf = xmmword_245827454;
      v10 = unk_245827464;
      v11 = xmmword_245827474;
      v12 = unk_245827484;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 19:
      v6 = 0x3F7A1CAC36A7C5ACLL;
      v7 = 32;
      *(_OWORD *)buf = xmmword_245827494;
      v10 = unk_2458274A4;
      v11 = xmmword_2458274B4;
      v12 = unk_2458274C4;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 20:
      v6 = 0x3F79518336A7C5ACLL;
      v7 = 34;
      *(_OWORD *)buf = xmmword_2458274D4;
      v10 = unk_2458274E4;
      v11 = xmmword_2458274F4;
      v12 = unk_245827504;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 21:
      v6 = 0x3F785F0736A7C5ACLL;
      v7 = 37;
      *(_OWORD *)buf = xmmword_245827514;
      v10 = unk_245827524;
      v11 = xmmword_245827534;
      v12 = unk_245827544;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 23:
      v6 = 0x3F77319036A7C5ACLL;
      v7 = 40;
      *(_OWORD *)buf = xmmword_245827554;
      v10 = unk_245827564;
      v11 = xmmword_245827574;
      v12 = unk_245827584;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 24:
      v6 = 0x3F75C91D36A7C5ACLL;
      v7 = 43;
      *(_OWORD *)buf = xmmword_245827594;
      v10 = unk_2458275A4;
      v11 = xmmword_2458275B4;
      v12 = unk_2458275C4;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 25:
      v6 = 0x3F73F7CF36A7C5ACLL;
      v7 = 47;
      *(_OWORD *)buf = xmmword_2458275D4;
      v10 = unk_2458275E4;
      v11 = xmmword_2458275F4;
      v12 = unk_245827604;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 26:
      v6 = 0x3F72EB1C36A7C5ACLL;
      v7 = 49;
      *(_OWORD *)buf = xmmword_245827614;
      v10 = unk_245827624;
      v11 = xmmword_245827634;
      v12 = unk_245827644;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 27:
      v6 = 0x3F71A9FC36A7C5ACLL;
      v7 = 52;
      *(_OWORD *)buf = xmmword_245827654;
      v10 = unk_245827664;
      v11 = xmmword_245827674;
      v12 = unk_245827684;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 28:
      v6 = 0x3F70418936A7C5ACLL;
      v7 = 55;
      *(_OWORD *)buf = xmmword_245827694;
      v10 = unk_2458276A4;
      v11 = xmmword_2458276B4;
      v12 = unk_2458276C4;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 29:
      v6 = 0x3F6EA4A936A7C5ACLL;
      v7 = 58;
      *(_OWORD *)buf = xmmword_2458276D4;
      v10 = unk_2458276E4;
      v11 = xmmword_2458276F4;
      v12 = unk_245827704;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 30:
      v6 = 0x3F6CC63F36A7C5ACLL;
      v7 = 61;
      *(_OWORD *)buf = xmmword_245827714;
      v10 = unk_245827724;
      v11 = xmmword_245827734;
      v12 = unk_245827744;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 31:
      v6 = 0x3F6A92A336A7C5ACLL;
      v7 = 65;
      *(_OWORD *)buf = xmmword_245827754;
      v10 = unk_245827764;
      v11 = xmmword_245827774;
      v12 = unk_245827784;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 32:
      v6 = 0x3F6809D536A7C5ACLL;
      v7 = 69;
      *(_OWORD *)buf = xmmword_245827794;
      v10 = unk_2458277A4;
      v11 = xmmword_2458277B4;
      v12 = unk_2458277C4;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 33:
      v6 = 0x3F669AD436A7C5ACLL;
      v7 = 72;
      *(_OWORD *)buf = xmmword_2458277D4;
      v10 = unk_2458277E4;
      v11 = xmmword_2458277F4;
      v12 = unk_245827804;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 34:
      v6 = 0x3F65048136A7C5ACLL;
      v7 = 74;
      *(_OWORD *)buf = xmmword_245827814;
      v10 = unk_245827824;
      v11 = xmmword_245827834;
      v12 = unk_245827844;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 35:
      v6 = 0x3F6353F836A7C5ACLL;
      v7 = 77;
      *(_OWORD *)buf = xmmword_245827854;
      v10 = unk_245827864;
      v11 = xmmword_245827874;
      v12 = unk_245827884;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 36:
      v6 = 0x3F61758E36A7C5ACLL;
      v7 = 80;
      *(_OWORD *)buf = xmmword_245827894;
      v10 = unk_2458278A4;
      v11 = xmmword_2458278B4;
      v12 = unk_2458278C4;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 37:
      v6 = 0x3F5F6FD236A7C5ACLL;
      v7 = 83;
      *(_OWORD *)buf = xmmword_2458278D4;
      v10 = unk_2458278E4;
      v11 = xmmword_2458278F4;
      v12 = unk_245827904;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 38:
      v6 = 0x3F5D2F1B36A7C5ACLL;
      v7 = 87;
      *(_OWORD *)buf = xmmword_245827914;
      v10 = unk_245827924;
      v11 = xmmword_245827934;
      v12 = unk_245827944;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 39:
      v6 = 0x3F5AC08336A7C5ACLL;
      v7 = 91;
      *(_OWORD *)buf = xmmword_245827954;
      v10 = unk_245827964;
      v11 = xmmword_245827974;
      v12 = unk_245827984;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 40:
      v6 = 0x3F58106236A7C5ACLL;
      v7 = 95;
      *(_OWORD *)buf = xmmword_245827994;
      v10 = unk_2458279A4;
      v11 = xmmword_2458279B4;
      v12 = unk_2458279C4;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 41:
      v6 = 0x3F55119D36D613C8;
      v7 = 99;
      *(_OWORD *)buf = xmmword_2458279D4;
      v10 = unk_2458279E4;
      v11 = xmmword_2458279F4;
      v12 = unk_245827A04;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 42:
      v6 = 0x3F51D14E36D613C8;
      v7 = 104;
      *(_OWORD *)buf = xmmword_245827A14;
      v10 = unk_245827A24;
      v11 = xmmword_245827A34;
      v12 = unk_245827A44;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 43:
      v6 = 0x3F4E353F36D613C8;
      v7 = 110;
      *(_OWORD *)buf = xmmword_245827A54;
      v10 = unk_245827A64;
      v11 = xmmword_245827A74;
      v12 = unk_245827A84;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 44:
      v6 = 0x3F4A29C736D613C8;
      v7 = 116;
      *(_OWORD *)buf = xmmword_245827A94;
      v10 = unk_245827AA4;
      v11 = xmmword_245827AB4;
      v12 = unk_245827AC4;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 45:
      v6 = 0x3F45BC0236D613C8;
      v7 = 123;
      *(_OWORD *)buf = xmmword_245827AD4;
      v10 = unk_245827AE4;
      v11 = xmmword_245827AF4;
      v12 = unk_245827B04;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 46:
      v6 = 0x3F40C49C36D613C8;
      v7 = 131;
      *(_OWORD *)buf = xmmword_245827B14;
      v10 = unk_245827B24;
      v11 = xmmword_245827B34;
      v12 = unk_245827B44;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
LABEL_36:
      std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v8);
      break;
    default:
      log = Scandium::algs_get_log(a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a2;
        _os_log_impl(&dword_2457F9000, log, OS_LOG_TYPE_DEFAULT, "Scandium unsupported hfw enum: %d", buf, 8u);
      }
      break;
  }
}

void sub_2458218A4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = v2;
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v3);
  if (*(_BYTE *)(v1 + 56))
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1 + 16);
  _Unwind_Resume(a1);
}

uint64_t std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>(uint64_t a1, uint64_t *a2)
{
  int v3;
  int v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = *((_DWORD *)a2 + 2);
  v6 = *a2;
  v5 = a2 + 2;
  *(_QWORD *)a1 = v6;
  *(_DWORD *)(a1 + 8) = v4;
  v7 = a1 + 16;
  if (v3)
  {
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign(v7, v5);
  }
  else
  {
    std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__hash_table(v7, v5);
    *(_BYTE *)(a1 + 56) = 1;
  }
  return a1;
}

void Scandium::ScandiumPPG::scandium_optical_fom_t::process(uint64_t a1, float *a2)
{
  uint64_t v4;
  uint64_t v5;
  Scandium::ScandiumPPG *v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned int v9;
  float v10;
  float v11;
  float v12;
  uint64_t *v13;
  int v14;
  unsigned int v15;
  float v16;
  float v17;
  uint64_t *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  int v24;
  unsigned int v25;
  float v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  float v30;
  uint64_t v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  int v55;
  int v56;
  unsigned int v57;

  v4 = *(unsigned __int8 *)a2;
  v5 = *((unsigned __int8 *)a2 + 1);
  v6 = (Scandium::ScandiumPPG *)(v5 + 4 * v4);
  v7 = Scandium::ScandiumPPG::path_array[4 * v4 + v5];
  LOBYTE(v8) = *((_BYTE *)a2 + (int)Scandium::ScandiumPPG::get_blank_path_idx(v6) + 48);
  v9 = (int)(float)((float)v8 * 10000.0);
  v10 = a2[10];
  v11 = *(float *)(a1 + 100);
  v12 = *(float *)(a1 + 104);
  v57 = v9;
  v13 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>((_QWORD *)(a1 + 120), (int *)&v57);
  if (!v13)
    goto LABEL_5;
  v52 = v12;
  v53 = v11;
  v54 = v10;
  v50 = *(float *)(a1 + 96);
  v51 = *((float *)v13 + 5);
  v48 = *(float *)(a1 + 108);
  v49 = *(float *)(a1 + 92);
  v14 = *(_DWORD *)a1;
  v45 = a2[5];
  v47 = *(float *)(a1 + 112);
  v16 = *(float *)(a1 + 68);
  v43 = *(float *)(a1 + 72);
  v15 = LODWORD(v43);
  v44 = a2[10];
  LOBYTE(v15) = *((_BYTE *)a2 + v6 + 60);
  v17 = (float)v15 * 10000.0;
  v56 = (int)v17;
  v18 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>((_QWORD *)(a1 + 120), &v56);
  if (!v18)
    goto LABEL_5;
  v19 = *((float *)v18 + 5);
  v21 = *(float *)(a1 + 60);
  v20 = *(float *)(a1 + 64);
  v22 = *(float *)(a1 + 108);
  v23 = *(float *)(a1 + 112);
  v24 = *(_DWORD *)a1;
  v41 = a2[10];
  v42 = a2[4];
  v39 = *(float *)(a1 + 88);
  v25 = LODWORD(v39);
  v40 = *(float *)(a1 + 84);
  LOBYTE(v25) = *((_BYTE *)v6 + (_QWORD)a2 + 76);
  v26 = (float)v25 * 10000.0;
  v55 = (int)v26;
  v27 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>((_QWORD *)(a1 + 120), &v55);
  if (!v27)
LABEL_5:
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  v28 = v27;
  v46 = Scandium::ScandiumPPG::scandium_optical_fom_t::compute_circuit_noise(v45, v44, v16, v43, v17, v19, v20, v21, (uint64_t)v27, v24, v22, v23);
  v30 = Scandium::ScandiumPPG::scandium_optical_fom_t::compute_circuit_noise(0.0, v54, v53, v52, (float)v9, v51, v50, v49, v29, v14, v48, v47);
  v32 = Scandium::ScandiumPPG::scandium_optical_fom_t::compute_circuit_noise(v42, v41, v40, v39, v26, *((float *)v28 + 5), *(float *)(a1 + 80), *(float *)(a1 + 76), v31, *(_DWORD *)a1, *(float *)(a1 + 108), *(float *)(a1 + 112));
  v33 = sqrt(fmax(a2[11] * a2[11] - v30 * v30, 0.0));
  v34 = a2[2];
  v35 = a2[4];
  v36 = a2[5];
  v37 = (float)((float)(a2[1] / 2.8284) / 100.0) * v35;
  *(float *)(a1 + 368) = log2f(v37 / v33);
  v38 = (float)((float)(v34 / 2.8284) / 100.0) * v36;
  *(float *)(a1 + 372) = log2f(v38 / v33);
  *(float *)(a1 + 360) = log2f(v37 / sqrtf((float)(v32 * v32) + (float)(v33 * v33)));
  *(float *)(a1 + 364) = log2f(v38 / sqrtf((float)(v46 * v46) + (float)(v33 * v33)));
  *(float *)(a1 + 376) = log2f(v37 / v32);
  *(float *)(a1 + 380) = log2f(v38 / v46);
  Scandium::ScandiumPPG::scandium_optical_fom_t::compute_sxr(a1, v7, a2[*(unsigned __int8 *)a2 + 31], a2[*(unsigned __int8 *)a2 + 27], v35, v36);
  Scandium::ScandiumPPG::scandium_optical_fom_t::compute_sxr_ch(a1, v7, a2[7], a2[8], a2[4], a2[5]);
}

float Scandium::ScandiumPPG::scandium_optical_fom_t::compute_circuit_noise(float a1, float a2, float a3, float a4, float a5, float a6, float a7, float a8, uint64_t a9, int a10, float a11, float a12)
{
  double v18;
  double v19;
  double v20;
  double v21;

  v18 = a6 * a6 / (a5 * a5 * (a7 * a7) * (a12 * a12)) + a2 * 3.20435327e-19;
  v19 = a1;
  v20 = a4;
  v21 = a1 * 3.20435327e-19 * v20 + v18 * a3;
  if (a10 == 3)
    v21 = v21 + v19 * 0.000007 / 199.749844 * (v19 * 0.000007 / 199.749844) * v20;
  return sqrt(v19 * 0.000005 * (v19 * 0.000005) + v19 * a11 * (v19 * a11) + (float)(a1 * a8) * (float)(a1 * a8) + v21);
}

float Scandium::ScandiumPPG::scandium_optical_fom_t::compute_sxr(uint64_t a1, unsigned __int8 a2, float a3, float a4, float a5, float a6)
{
  _QWORD *v11;
  uint64_t **v12;
  float v13;
  float v14;
  uint64_t **v15;
  float v16;
  uint64_t **v17;
  float v18;
  float v19;
  int v20;
  float v21;
  uint64_t **v22;
  float v23;
  uint64_t **v24;
  uint64_t **v25;
  float v26;
  float v27;
  uint64_t **v28;
  float v29;
  uint64_t **v30;
  float v31;
  int v32;
  float v33;
  uint64_t **v34;
  float v35;
  uint64_t **v36;
  float result;
  float v38;
  float v39;
  float v40;
  unsigned __int8 v41;

  v41 = a2;
  v11 = (_QWORD *)(a1 + 160);
  v12 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((_QWORD *)(a1 + 160), &v41);
  if (!v12)
    goto LABEL_12;
  v13 = *((float *)v12 + 5);
  v14 = *(float *)(a1 + 4);
  v15 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>(v11, &v41);
  if (!v15)
    goto LABEL_12;
  v40 = a3;
  v16 = *((float *)v15 + 5);
  v17 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((_QWORD *)(a1 + 8), &v41);
  if (!v17)
    goto LABEL_12;
  v18 = a5;
  v38 = a4;
  v39 = a6;
  v19 = *((float *)v17 + 5);
  v20 = *(_DWORD *)(a1 + 116);
  v21 = *(float *)(a1 + 48);
  v22 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>(v11, &v41);
  if (!v22)
    goto LABEL_12;
  v23 = *((float *)v22 + 5);
  v24 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((_QWORD *)(a1 + 320), &v41);
  if (!v24)
    goto LABEL_12;
  *(float *)(a1 + 384) = (float)((float)((float)(v13 * v14) + (float)((float)(v16 * v19) * (float)((float)v20 / v21)))
                               + (float)((float)((float)(v23 * *((float *)v24 + 5)) * v40) / *(float *)(a1 + 52)))
                       / v18;
  v25 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((_QWORD *)(a1 + 200), &v41);
  if (!v25)
    goto LABEL_12;
  v26 = *((float *)v25 + 5);
  v27 = *(float *)(a1 + 4);
  v28 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((_QWORD *)(a1 + 200), &v41);
  if (!v28)
    goto LABEL_12;
  v29 = *((float *)v28 + 5);
  v30 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((_QWORD *)(a1 + 8), &v41);
  if (!v30
    || (v31 = *((float *)v30 + 5),
        v32 = *(_DWORD *)(a1 + 116),
        v33 = *(float *)(a1 + 48),
        (v34 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((_QWORD *)(a1 + 200), &v41)) == 0)|| (v35 = *((float *)v34 + 5), (v36 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((_QWORD *)(a1 + 320), &v41)) == 0))
  {
LABEL_12:
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  result = (float)((float)((float)(v26 * v27) + (float)((float)(v29 * v31) * (float)((float)v32 / v33)))
                 + (float)((float)((float)(v35 * *((float *)v36 + 5)) * v38) / *(float *)(a1 + 56)))
         / v39;
  *(float *)(a1 + 388) = result;
  return result;
}

float Scandium::ScandiumPPG::scandium_optical_fom_t::compute_sxr_ch(uint64_t a1, unsigned __int8 a2, float a3, float a4, float a5, float a6)
{
  uint64_t **v11;
  double v12;
  uint64_t **v13;
  float v14;
  float v15;
  float result;
  unsigned __int8 v17;

  v17 = a2;
  v11 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((_QWORD *)(a1 + 240), &v17);
  if (!v11
    || (v12 = __exp10((float)(*((float *)v11 + 5) / -20.0)),
        (v13 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((_QWORD *)(a1 + 280), &v17)) == 0))
  {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  v14 = v12 * (float)(a3 - a5);
  v15 = __exp10((float)(*((float *)v13 + 5) / -20.0)) * (float)(a4 - a6);
  *(float *)(a1 + 392) = v14 / a5;
  result = v15 / a6;
  *(float *)(a1 + 396) = result;
  return result;
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::clear((_QWORD *)a1);
  v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v8 = a2[2];
  v7 = a2 + 2;
  v6 = v8;
  v9 = *(v7 - 1);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  v10 = v7[1];
  *(_QWORD *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    v11 = *(_QWORD *)(v6 + 8);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v11 %= v12;
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = a1 + 16;
    *v7 = 0;
    v7[1] = 0;
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::clear(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__hash_table(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v2 = *a2;
  *a2 = 0;
  *(_QWORD *)result = v2;
  *(_QWORD *)(result + 8) = a2[1];
  a2[1] = 0;
  v5 = a2[2];
  v3 = a2 + 2;
  v4 = v5;
  *(_QWORD *)(result + 16) = v5;
  v6 = v3[1];
  *(_QWORD *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    v7 = *(_QWORD *)(v4 + 8);
    v8 = *(_QWORD *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v7 %= v8;
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(_QWORD *)(v2 + 8 * v7) = result + 16;
    *v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 8 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::pair<Scandium::ScandiumPPG::PathType const,float> const&>(a1, a2, a2);
      a2 += 8;
      v5 -= 8;
    }
    while (v5);
  }
  return a1;
}

void sub_245822260(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<int,float>::unordered_map(uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 8 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::pair<int const,float> const&>(a1, a2, a2);
      a2 += 2;
      v5 -= 8;
    }
    while (v5);
  }
  return a1;
}

void sub_2458222D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::pair<int const,float> const&>(uint64_t a1, int *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v7 <= v6)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x18uLL);
  *v10 = 0;
  v10[1] = v6;
  v10[2] = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *v10 = *v19;
LABEL_38:
    *v19 = v10;
    goto LABEL_39;
  }
  *v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    v20 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_2458224EC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<int,float>::unordered_map(uint64_t a1, uint64_t a2)
{
  int *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(int **)(a2 + 16); i; i = *(int **)i)
    std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::pair<int const,float> const&>(a1, i + 4, (_QWORD *)i + 2);
  return a1;
}

void sub_24582255C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void __chkstk_darwin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (___chkstk_darwin)
    ___chkstk_darwin(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  else
    __chkstk_darwin_probe(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void __chkstk_darwin_probe(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v9;
  uint64_t *v10;

  v10 = &a9;
  if (v9 >= 0x1000)
  {
    do
    {
      v10 -= 512;
      v9 -= 4096;
    }
    while (v9 > 0x1000);
  }
}

void ___chkstk_darwin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __chkstk_darwin_probe(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void Scandium::sort_median()
{
  __assert_rtn("sort_median", "ScandiumUtils.cpp", 116, "N > 0");
}

{
  __assert_rtn("sort_median", "ScandiumUtils.cpp", 117, "x != NULL");
}

void stats::mean()
{
  __assert_rtn("mean", "stats.cpp", 18, "N > 0");
}

{
  __assert_rtn("mean", "stats.cpp", 19, "x != NULL");
}

void stats::variance()
{
  __assert_rtn("variance", "stats.cpp", 31, "N > 0");
}

{
  __assert_rtn("variance", "stats.cpp", 32, "x != NULL");
}

void stats::covariance()
{
  __assert_rtn("covariance", "stats.cpp", 52, "Nx > 0");
}

{
  __assert_rtn("covariance", "stats.cpp", 55, "x != NULL");
}

{
  __assert_rtn("covariance", "stats.cpp", 56, "y != NULL");
}

{
  __assert_rtn("covariance", "stats.cpp", 53, "Ny == Nx");
}

void stats::std()
{
  __assert_rtn("std", "stats.cpp", 80, "N > 0");
}

{
  __assert_rtn("std", "stats.cpp", 81, "x != NULL");
}

void stats::median()
{
  __assert_rtn("median", "stats.cpp", 204, "N > 0");
}

{
  __assert_rtn("median", "stats.cpp", 205, "x != NULL");
}

void stats::max()
{
  __assert_rtn("max", "stats.cpp", 178, "N > 0");
}

{
  __assert_rtn("max", "stats.cpp", 179, "x != NULL");
}

void stats::min()
{
  __assert_rtn("min", "stats.cpp", 191, "N > 0");
}

{
  __assert_rtn("min", "stats.cpp", 192, "x != NULL");
}

void stats::median_vdsp()
{
  __assert_rtn("median_vdsp", "stats.cpp", 234, "N > 0");
}

{
  __assert_rtn("median_vdsp", "stats.cpp", 235, "x != NULL");
}

{
  __assert_rtn("median_vdsp", "stats.cpp", 236, "pI != NULL");
}

void stats::percentile()
{
  __assert_rtn("percentile", "stats.cpp", 411, "N > 0");
}

{
  __assert_rtn("percentile", "stats.cpp", 412, "x != NULL");
}

{
  __assert_rtn("percentile", "stats.cpp", 413, "pI != NULL");
}

{
  __assert_rtn("percentile", "stats.cpp", 414, "ptile >= 0 && ptile <= 100");
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_process()
{
  int v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;

  OUTLINED_FUNCTION_1_1(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 136315138;
  HIDWORD(v3) = v0;
  OUTLINED_FUNCTION_0_1(&dword_2457F9000, v1, v2, "%s", v3);
}

void Scandium::ScandiumPPG::median_filt()
{
  __assert_rtn("median_filt", "scandium_beat_detection.cpp", 330, "N > 0");
}

{
  __assert_rtn("median_filt", "scandium_beat_detection.cpp", 331, "x != NULL");
}

{
  __assert_rtn("median_filt", "scandium_beat_detection.cpp", 332, "y != NULL");
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_mvmt_posture_bailout()
{
  __assert_rtn("compute_mvmt_posture_bailout", "scandium_spo2_processor.cpp", 1358, "startIdx >= 0 && startIdx + m_motion_posture_config.window_len <= NUM_BGAWIN_SAMPLES_BG");
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_mvmt_posture_bailout(_QWORD *a1, NSObject *a2)
{
  double v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(float *)(*a1 - 4);
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_2457F9000, a2, OS_LOG_TYPE_DEBUG, "scandium mav: %f", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;

  OUTLINED_FUNCTION_1_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2457F9000, v0, v1, "%s", v2);
  OUTLINED_FUNCTION_1();
}

void Scandium::ScandiumPPG::scandium_optical_fom_t::opt_gen_to_hw_fom()
{
  __assert_rtn("opt_gen_to_hw_fom", "scandium_optical_fom.cpp", 174, "valid_opt_gen");
}

void hid_service_copy_property_cold_1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2457F9000, v0, OS_LOG_TYPE_DEBUG, "%s : key=%@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void hid_service_set_property_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_2457F9000, v2, OS_LOG_TYPE_DEBUG, "%s : key=%@ value=%@", (uint8_t *)v3, 0x20u);
}

void hid_service_copy_event_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2457F9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void hid_service_set_output_event_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2457F9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void scandium::PacketDropDetector::handle_packet(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = CFSTR("com.apple.hid.OxygenSaturation.PacketDrop");
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_2457F9000, a2, OS_LOG_TYPE_DEBUG, "sending a %@ event to CoreAnalytics: %@", (uint8_t *)&v2, 0x16u);
}

void scandium::PacketDropDetector::handle_packet(unsigned __int8 *a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 1024;
  v6 = v3;
  _os_log_fault_impl(&dword_2457F9000, log, OS_LOG_TYPE_FAULT, "detected %u dropped packets for input report 0x%02x", (uint8_t *)v4, 0xEu);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

void IOHIDDeviceActivate(IOHIDDeviceRef device)
{
  MEMORY[0x24BDD8008](device);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x24BDD8038](allocator, *(_QWORD *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8040](device, key);
}

IOReturn IOHIDDeviceGetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return MEMORY[0x24BDD8048](device, *(_QWORD *)&reportType, reportID, report, pReportLength);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x24BDD8060](device, *(_QWORD *)&options);
}

void IOHIDDeviceRegisterInputReportCallback(IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportCallback callback, void *context)
{
  MEMORY[0x24BDD8068](device, report, reportLength, callback, context);
}

void IOHIDDeviceSetDispatchQueue(IOHIDDeviceRef device, dispatch_queue_t queue)
{
  MEMORY[0x24BDD8090](device, queue);
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x24BDD80A8](device, *(_QWORD *)&reportType, reportID, report, reportLength);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return (CFSetRef)MEMORY[0x24BDD8478](manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x24BDD8488](allocator, *(_QWORD *)&options);
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
  MEMORY[0x24BDD84E0](manager, matching);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x24BDD8710](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x24BDD8740](*(_QWORD *)&AssertionID);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x24BEDAC08](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return MEMORY[0x24BEDB3A8]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x24BEDB3E0]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x24BEDB600](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_25169CAB8(__p);
}

uint64_t operator delete()
{
  return off_25169CAC0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25169CAC8(__sz);
}

uint64_t operator new()
{
  return off_25169CAD0();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

double nan(const char *a1)
{
  double result;

  MEMORY[0x24BDAEFF8](a1);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x24BDB3198](__A, __IA, __F, __IF, __C, __IC, __N, __P);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB31D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3220](__A, __IA, __C, __N);
}

void vDSP_maxvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x24BDB3230](__A, __IA, __C, __I, __N);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3248](__A, __IA, __C, __N);
}

void vDSP_minv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3260](__A, __IA, __C, __N);
}

void vDSP_minvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x24BDB3270](__A, __IA, __C, __I, __N);
}

void vDSP_mmov(const float *__A, float *__C, vDSP_Length __M, vDSP_Length __N, vDSP_Length __TA, vDSP_Length __TC)
{
  MEMORY[0x24BDB3280](__A, __C, __M, __N, __TA, __TC);
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32F0](__A, __IA, __C, __N);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3308](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vclr(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3330](__C, __IC, __N);
}

void vDSP_vgen(const float *__A, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33F8](__A, __B, __C, __IC, __N);
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB34C0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsorti(const float *__C, vDSP_Length *__I, vDSP_Length *__Temporary, vDSP_Length __N, int __Order)
{
  MEMORY[0x24BDB3510](__C, __I, __Temporary, __N, *(_QWORD *)&__Order);
}

void vDSP_vsq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3528](__A, __IA, __C, __IC, __N);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3530](__B, __IB, __A, __IA, __C, __IC, __N);
}


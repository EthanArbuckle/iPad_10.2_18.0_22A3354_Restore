void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_3()
{
  uint64_t v0;

  return nw_listener_get_port(*(nw_listener_t *)(v0 + 32));
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

int *OUTLINED_FUNCTION_4()
{
  return __error();
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

void sub_229FCE178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_229FCEDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_9()
{
  uint64_t v0;

  return v0;
}

void sub_229FCF3B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x24BDADD48](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

nw_advertise_descriptor_t nw_advertise_descriptor_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_advertise_descriptor_t)MEMORY[0x24BDE0A00](name, type, domain);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0AF8](connection);
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0B40](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x24BDE0B68](endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x24BDE0C28](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x24BDE0C58](connection, content, context, is_complete, completion);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C98](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x24BDE0CB0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CD0](connection);
}

BOOL nw_content_context_get_is_final(nw_content_context_t context)
{
  return MEMORY[0x24BDE0D20](context);
}

nw_endpoint_t nw_endpoint_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E78](name, type, domain);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E88](hostname, port);
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0EE0](endpoint);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0F20](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x24BDE0F40](endpoint);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x24BDE0FB8](error);
}

void nw_ip_options_set_version(nw_protocol_options_t options, nw_ip_version_t version)
{
  MEMORY[0x24BDE1428](options, *(_QWORD *)&version);
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x24BDE1448](parameters);
}

uint16_t nw_listener_get_port(nw_listener_t listener)
{
  return MEMORY[0x24BDE1460](listener);
}

void nw_listener_set_advertise_descriptor(nw_listener_t listener, nw_advertise_descriptor_t advertise_descriptor)
{
  MEMORY[0x24BDE1468](listener, advertise_descriptor);
}

void nw_listener_set_advertised_endpoint_changed_handler(nw_listener_t listener, nw_listener_advertised_endpoint_changed_handler_t handler)
{
  MEMORY[0x24BDE1478](listener, handler);
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
  MEMORY[0x24BDE1488](listener, handler);
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1498](listener, queue);
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
  MEMORY[0x24BDE14A0](listener, handler);
}

void nw_listener_start(nw_listener_t listener)
{
  MEMORY[0x24BDE14A8](listener);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x24BDE1528](parameters);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x24BDE1588](configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x24BDE15A0](configure_dtls, configure_udp);
}

void nw_parameters_set_include_peer_to_peer(nw_parameters_t parameters, BOOL include_peer_to_peer)
{
  MEMORY[0x24BDE1690](parameters, include_peer_to_peer);
}

void nw_parameters_set_local_endpoint(nw_parameters_t parameters, nw_endpoint_t local_endpoint)
{
  MEMORY[0x24BDE16C8](parameters, local_endpoint);
}

uint64_t nw_parameters_set_required_interface_subtype()
{
  return MEMORY[0x24BDE1740]();
}

void nw_parameters_set_required_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
  MEMORY[0x24BDE1748](parameters, *(_QWORD *)&interface_type);
}

uint64_t nw_parameters_set_use_p2p()
{
  return MEMORY[0x24BDE17A0]();
}

nw_protocol_options_t nw_protocol_stack_copy_internet_protocol(nw_protocol_stack_t stack)
{
  return (nw_protocol_options_t)MEMORY[0x24BDE2038](stack);
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x24BDE2600](options);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void sec_protocol_options_add_pre_shared_key(sec_protocol_options_t options, dispatch_data_t psk, dispatch_data_t psk_identity)
{
  MEMORY[0x24BDE95D0](options, psk, psk_identity);
}

void sec_protocol_options_append_tls_ciphersuite(sec_protocol_options_t options, tls_ciphersuite_t ciphersuite)
{
  MEMORY[0x24BDE95E0](options, ciphersuite);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}


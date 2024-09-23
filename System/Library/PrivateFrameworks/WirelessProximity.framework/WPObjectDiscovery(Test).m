@implementation WPObjectDiscovery(Test)

- (void)receivedTestResponse:()Test .cold.1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_11_2(v1, v2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_2(&dword_209E41000, v3, v4, "ObjectDiscovery Client %@ (test: %d) NOOP receieved test response: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)startTest
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_14_0(a1, a2);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_10_0(&dword_209E41000, v3, v4, "Client %@ (test: %d) calling startTest", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

- (void)stopTest
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_14_0(a1, a2);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_10_0(&dword_209E41000, v3, v4, "Client %@ (test: %d) calling stopTest", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_0();
}

- (void)updateBeaconingState:()Test .cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_11_2(v2, v3);
  OUTLINED_FUNCTION_4_0();
  objc_msgSend(v0, "BOOLValue");
  OUTLINED_FUNCTION_2_2(&dword_209E41000, v4, v5, "Client %@ (test: %d) calling updateBeaconingState with state: %s", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)updateBeaconingKeys:()Test .cold.1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_11_2(v1, v2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_2(&dword_209E41000, v3, v4, "Client %@ (test: %d) calling updateBeaconingKeys with keys: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)updateBeaconingStatus:()Test .cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_14_0(v2, v3);
  OUTLINED_FUNCTION_4_0();
  objc_msgSend(v0, "unsignedCharValue");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9_2(&dword_209E41000, v4, v5, "Client %@ (test: %d) calling updateBeaconingStatus with status: 0x%2x", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_1();
}

- (void)updateBeaconingExtended:()Test .cold.1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_11_2(v1, v2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_2(&dword_209E41000, v3, v4, "Client %@ (test: %d) calling updateBeaconingExtended with data: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)updateNearOwnerTokens:()Test .cold.1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_11_2(v1, v2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_2(&dword_209E41000, v3, v4, "Client %@ (test: %d) calling updateNearOwnerTokens with tokens: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)updateBeaconingInterval:()Test .cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_14_0(v2, v3);
  OUTLINED_FUNCTION_4_0();
  objc_msgSend(v0, "intValue");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9_2(&dword_209E41000, v4, v5, "Client %@ (test: %d) calling updateBeaconingInterval with interval: %d", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_1();
}

@end

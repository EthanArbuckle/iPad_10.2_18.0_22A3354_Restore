@implementation PFPosterPathsAssertion

- (PFPosterPathsAssertion)init
{
  return (PFPosterPathsAssertion *)-[PFPosterPathsAssertion _initWithPaths:invalidationAction:](self, "_initWithPaths:invalidationAction:", MEMORY[0x24BDBD1A8], 0);
}

- (PFPosterPathsAssertion)initWithPaths:(id)a3
{
  return (PFPosterPathsAssertion *)-[PFPosterPathsAssertion _initWithPaths:invalidationAction:](self, "_initWithPaths:invalidationAction:", a3, 0);
}

- (PFPosterPathsAssertion)initWithPaths:(id)a3 queue:(id)a4 invalidationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  PFPosterPathsAssertion *v15;
  void *v17;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFPosterPathsAssertion initWithPaths:queue:invalidationHandler:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244631AB4);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("invalidationHandler"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFPosterPathsAssertion initWithPaths:queue:invalidationHandler:].cold.2();
    goto LABEL_9;
  }
  v11 = (void *)MEMORY[0x24BE0BD88];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __66__PFPosterPathsAssertion_initWithPaths_queue_invalidationHandler___block_invoke;
  v18[3] = &unk_251543BB0;
  v19 = v10;
  v12 = v10;
  objc_msgSend(v11, "responderWithHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setQueue:", v9);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BD80]), "initWithInfo:responder:", 0, v13);
  v15 = -[PFPosterPathsAssertion _initWithPaths:invalidationAction:](self, "_initWithPaths:invalidationAction:", v8, v14);

  return v15;
}

void __66__PFPosterPathsAssertion_initWithPaths_queue_invalidationHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v8, "invalidate");

}

- (id)_initWithPaths:(id)a3 invalidationAction:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  PFPosterPathsAssertion *v15;
  uint64_t v16;
  NSArray *paths;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("NSArray"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFPosterPathsAssertion _initWithPaths:invalidationAction:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244631EA8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFPosterPathsAssertion _initWithPaths:invalidationAction:].cold.1();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244631F0CLL);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * v13);
        NSClassFromString(CFSTR("PFPosterPath"));
        if (!v14)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[PFPosterPathsAssertion _initWithPaths:invalidationAction:].cold.2();
          objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x244631DE0);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFPosterPathClass]"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[PFPosterPathsAssertion _initWithPaths:invalidationAction:].cold.2();
          objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x244631E44);
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  v23.receiver = self;
  v23.super_class = (Class)PFPosterPathsAssertion;
  v15 = -[PFPosterPathsAssertion init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v9, "copy");
    paths = v15->_paths;
    v15->_paths = (NSArray *)v16;

    objc_storeStrong((id *)&v15->_invalidationAction, a4);
  }

  return v15;
}

- (void)invalidateWithResponder:(id)a3
{
  BSAction *v4;
  void *v5;
  id v6;
  BSAction *invalidationAction;
  void *v8;
  id v9;

  v9 = a3;
  if (v9 && (v4 = self->_invalidationAction) != 0 && -[BSAction canSendResponse](v4, "canSendResponse"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BD80]), "initWithInfo:responder:", 0, v9);
    v6 = objc_alloc_init(MEMORY[0x24BE0BE40]);
    objc_msgSend(v6, "setObject:forSetting:", v5, 1);
    invalidationAction = self->_invalidationAction;
    objc_msgSend(MEMORY[0x24BE0BD90], "responseWithInfo:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSAction sendResponse:](invalidationAction, "sendResponse:", v8);

  }
  else
  {
    -[BSAction invalidate](self->_invalidationAction, "invalidate");
    objc_msgSend(v9, "annul");
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x249514098](-[BSAction canSendResponse](self->_invalidationAction, "canSendResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p expectsResponse=%@> {"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_paths;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "appendString:", CFSTR("\n}"));
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PFPosterPathsAssertion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  PFPosterPathsAssertion *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("p"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (1)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(v9);
      if (!--v11)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (!v11)
          break;
      }
    }
  }

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PFPosterPathsAssertion _initWithPaths:invalidationAction:](self, "_initWithPaths:invalidationAction:", v9, v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  BSAction *invalidationAction;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_paths, CFSTR("p"));
  invalidationAction = self->_invalidationAction;
  if (invalidationAction)
    objc_msgSend(v5, "encodeObject:forKey:", invalidationAction, CFSTR("i"));

}

- (NSArray)paths
{
  return self->_paths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationAction, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

- (void)initWithPaths:queue:invalidationHandler:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPaths:queue:invalidationHandler:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithPaths:invalidationAction:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithPaths:invalidationAction:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end

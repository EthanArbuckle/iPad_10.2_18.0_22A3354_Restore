@implementation _PTPredicateValidator

+ (_QWORD)validatorWithPredicate:(uint64_t)a1
{
  id v2;
  _QWORD *v3;
  void *v4;

  v2 = a2;
  objc_opt_self();
  v3 = (_QWORD *)objc_opt_new();
  v4 = (void *)v3[1];
  v3[1] = v2;

  return v3;
}

- (uint64_t)evaluate
{
  uint64_t v1;
  id *v2;

  if (result)
  {
    v1 = result;
    *(_BYTE *)(result + 16) = 1;
    v2 = (id *)(result + 8);
    objc_msgSend(*(id *)(result + 8), "acceptVisitor:flags:", result, 3);
    if (*(_BYTE *)(v1 + 16))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[_PTPredicateValidator evaluate].cold.2(v2);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[_PTPredicateValidator evaluate].cold.1(v2);
    }
    return *(_BYTE *)(v1 + 16) != 0;
  }
  return result;
}

- (void)visitPredicateExpression:(id)a3
{
  id v5;
  unint64_t v6;

  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[_PTPredicateValidator visitPredicateExpression:].cold.1(a2, v5);
  v6 = objc_msgSend(v5, "expressionType");
  if (v6 <= 0x14 && ((1 << v6) & 0x181010) != 0)
    self->_valid = 0;

}

- (void)visitPredicateOperator:(id)a3
{
  id v5;

  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[_PTPredicateValidator visitPredicateOperator:].cold.1(a2, v5);
  if (objc_msgSend(v5, "operatorType") == 11)
    self->_valid = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (void)evaluate
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "predicateFormat");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138543362;
  v3 = v1;
  _os_log_debug_impl(&dword_1B966F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Predicate passed validation: %{public}@", (uint8_t *)&v2, 0xCu);

  OUTLINED_FUNCTION_4();
}

- (void)visitPredicateExpression:(const char *)a1 .cold.1(const char *a1, void *a2)
{
  void *v2;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "expressionType");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B966F000, MEMORY[0x1E0C81028], v6, "[PTPredicate] %@ %@ (%lu) %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

- (void)visitPredicateOperator:(const char *)a1 .cold.1(const char *a1, void *a2)
{
  void *v2;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "operatorType");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B966F000, MEMORY[0x1E0C81028], v6, "[PTPredicate] %@ %@ (%lu) %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

@end

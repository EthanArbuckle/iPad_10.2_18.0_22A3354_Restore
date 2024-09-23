@implementation SXLayoutBlueprintProvider

- (void)updateBlueprint:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[SXLayoutBlueprintProvider blueprint](self, "blueprint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqual:", v4);

    if ((v5 & 1) == 0)
      -[SXLayoutBlueprintProvider setBlueprint:](self, "setBlueprint:", v6);
  }

}

- (SXLayoutBlueprint)blueprint
{
  return self->blueprint;
}

- (void)setBlueprint:(id)a3
{
  objc_storeStrong((id *)&self->blueprint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->blueprint, 0);
}

@end

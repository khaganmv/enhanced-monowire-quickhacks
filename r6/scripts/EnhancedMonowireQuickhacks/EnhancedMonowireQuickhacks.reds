@replaceMethod(MonoWireQuickHackApplyEffector)
protected func ProcessApplyQuickhackAction(hitEvent: ref<gameHitEvent>, playerPuppet: ref<PlayerPuppet>, targetScriptedPuppet: ref<ScriptedPuppet>) -> Void {
  let hitAttackData: ref<AttackData> = hitEvent.attackData;

  this.SpawnFXs(hitEvent, targetScriptedPuppet, true);
  this.ProcessStrongAttack(playerPuppet, targetScriptedPuppet, hitAttackData.GetWeapon());

  if RPGManager.HasStatFlag(playerPuppet, gamedataStatType.CanSpreadMonoWireQuickhack) && AttackData.IsLightMelee(hitAttackData.GetAttackType()) {
    this.ProcessNormalAttack(playerPuppet, targetScriptedPuppet, hitAttackData.GetAttackTime(), hitEvent);
  };
}

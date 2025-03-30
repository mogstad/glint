import type {ModifierLike} from '@glint/template';

declare const enable: boolean;
declare const aModifier: ModifierLike<{Args: {Positional: [string, number]}}>;

<template>
  <div {{aModifier "string" 1.0}}></div>
  <div {{(modifier aModifier "string" 1.0)}}></div>
  <div {{(if enable (modifier aModifier "string" 1))}}></div>
  {{#let (modifier aModifier "string") as |boundModifier |}}
    <div {{boundModifier 1.0}}></div>
  {{/let}}
  {{#let (modifier aModifier "string" 1.0) as |boundModifier|}}
    <div {{boundModifier}}></div>
  {{/let}}
</template>

declare const genericModifier: abstract new <Name extends string>() => InstanceType<
  ModifierLike<{
    Args: {
      Positional: [Name, number];
    };
  }>
>;

let genericTemplate = <template>
  <div {{genericModifier "string" 1.0}}></div>
  <div {{(modifier genericModifier "string" 1.0)}}></div>
  <div {{(if enable (modifier genericModifier "string" 1))}}></div>
  {{#let (modifier genericModifier "string") as |boundModifier |}}
    <div {{boundModifier 1.0}}></div>
  {{/let}}
  {{#let (modifier genericModifier "string" 1.0) as |boundModifier|}}
    <div {{boundModifier}}></div>
  {{/let}}
</template>

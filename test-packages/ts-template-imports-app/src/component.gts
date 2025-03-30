import Component from '@glimmer/component';

class AComponent extends Component<{Args: {string: string, number: number}}> {}

<template>
  <AComponent @string="string" @number={{2.0}} />
  {{#let (component AComponent string="string") as |aComponent|}}
    <aComponent @number={{2.0}} />
  {{/let}}
</template>


class AGenericComponent<T extends string> extends Component<{Args: {string: T, number: number}}> {}

let genericTemplate = <template>
  <AGenericComponent @string="string" @number={{2.0}} />
  {{#let (component AGenericComponent string="string") as |aComponent|}}
    <aComponent @number={{2.0}} />
  {{/let}}
</template>

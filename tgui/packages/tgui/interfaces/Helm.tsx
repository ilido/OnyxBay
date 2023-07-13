import { useBackend } from '../backend';
import { Button, LabeledList, Section } from '../components';
import { Window } from '../layouts';

export const Helm = (act, data) => {
  return (

    <Window>
      <Window.Content>
      <Button
        content="Open map"
        onClick={() => act("map")} />
      </Window.Content>
    </Window>
    );
};
